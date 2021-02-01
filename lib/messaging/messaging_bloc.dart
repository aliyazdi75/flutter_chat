// import 'dart:async';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_circular_chart/flutter_circular_chart.dart';
// import 'package:mate_machine_app/model/direct/close_direct.dart';
// import 'package:mate_machine_app/model/direct/direct_message.dart';
// import 'package:mate_machine_app/model/direct/directs.dart';
// import 'package:mate_machine_app/model/direct/last_message.dart';
// import 'package:mate_machine_app/model/direct/open_direct_model.dart';
// import 'package:mate_machine_app/model/hub/direct_message_received.dart';
// import 'package:mate_machine_app/model/hub/direct_seen.dart';
// import 'package:mate_machine_app/model/hub/direct_user_status.dart';
// import 'package:mate_machine_app/model/hub/typing_status.dart';
// import 'package:mate_machine_app/model/response.dart';
// import 'package:mate_machine_app/service/directs_service.dart';
// import 'package:mate_machine_app/service/hub_service.dart';
// import 'package:mate_machine_app/src/app/message/live_chat/live_message_progress_controller.dart';
// import 'package:rxdart/rxdart.dart';
//
// class MessagingBloc {
//   final BuildContext _context;
//   final dynamic mateDirectInfo;
//   final VoidCallback handlePurposeful;
//   final bool isLiveMessaging;
//   final int messageLegitimateTime;
//   final VoidCallback handleOnLiveMessageTimerEnds;
//   final VoidCallback handleOnLiveMessageSent;
//   final DirectsService _directsService = DirectsService();
//   final ScrollController scrollController = ScrollController();
//   final TextEditingController textEditingController = TextEditingController();
//   final FocusNode focusNode = FocusNode();
//   final HubService hubService = HubService();
//   final GlobalKey<AnimatedCircularChartState> chartKey =
//       GlobalKey<AnimatedCircularChartState>();
//   final BehaviorSubject<List<DirectMessage>> _directMessagesSubject =
//       BehaviorSubject.seeded(null);
//   final BehaviorSubject<dynamic> _mateDirectInfoSubject =
//       BehaviorSubject.seeded(null);
//   final moreLoadingNotifier = ValueNotifier<bool>(false);
//   final liveMessageTimeEndNotifier = ValueNotifier<bool>(false);
//
//   bool _hasMoreMsg = true;
//   List<int> dateDirectMessageId = [];
//   List<DirectMessage> _directMessages = [];
//
//   Stream<List<DirectMessage>> get directMessagesStream =>
//       _directMessagesSubject.stream;
//
//   Stream<dynamic> get mateDirectInfoStream => _mateDirectInfoSubject.stream;
//
//   LiveMessageProgressController liveMessageProgressController;
//
//   List<CircularStackEntry> data = <CircularStackEntry>[
//     CircularStackEntry(
//       <CircularSegmentEntry>[
//         CircularSegmentEntry(30, Colors.white, rankKey: 'Q1'),
//         CircularSegmentEntry(0, Colors.grey, rankKey: 'Q2'),
//       ],
//       rankKey: 'Quarterly Profits',
//     ),
//   ];
//
//   MessagingBloc(
//     this._context,
//     this.mateDirectInfo, {
//     this.handlePurposeful,
//     this.isLiveMessaging = false,
//     this.messageLegitimateTime,
//     this.handleOnLiveMessageTimerEnds,
//     this.handleOnLiveMessageSent,
//   }) {
//     _directsService.setContext(_context);
//     _getMessages();
//     _startSocket();
//     if (isLiveMessaging) {
//       liveMessageProgressController = LiveMessageProgressController(
//         chartKey,
//         messageLegitimateTime,
//         () {
//           liveMessageTimeEndNotifier.value = true;
//           _animateMessagesToEnd();
//           handleOnLiveMessageTimerEnds();
//         },
//       );
//     }
//   }
//
//   void dispose() {
//     _directsService.closeDirect(CloseDirect(userId: mateDirectInfo.userId));
//     liveMessageProgressController?.timer?.cancel();
//     _directMessagesSubject.close();
//     _mateDirectInfoSubject.close();
//     moreLoadingNotifier.dispose();
//     textEditingController.dispose();
//     scrollController.dispose();
//     focusNode.dispose();
//     hubService.directListenOff(
//       handleDirectMsg: _handleDirectMsg,
//       handleDirectSeen: _handleDirectSeen,
//       handleDirectTyping: _handleDirectTyping,
//       handleChatUserStatusChanged: _handleChatUserStatusChanged,
//       handleLostConnection: _handleLostConnection,
//     );
//   }
//
//   Future<void> _startSocket() async {
//     await hubService.directListenOn(
//       handleDirectMsg: _handleDirectMsg,
//       handleDirectSeen: _handleDirectSeen,
//       handleDirectTyping: _handleDirectTyping,
//       handleChatUserStatusChanged: _handleChatUserStatusChanged,
//       handleLostConnection: _handleLostConnection,
//     );
//   }
//
//   void _handleLostConnection() {
//     _getNewMessages();
//     _sendMessages();
//   }
//
//   void _updateDirectInfo() {
//     if (!_mateDirectInfoSubject.isClosed) {
//       _mateDirectInfoSubject.add(mateDirectInfo);
//     }
//   }
//
//   void _updateDirectMessages() {
//     if (!_mateDirectInfoSubject.isClosed) {
//       _directMessagesSubject.add(_directMessages);
//     }
//   }
//
//   Future<void> _getMessages() async {
//     OpenDirectBody directBody = OpenDirectBody(userId: mateDirectInfo.userId);
//     ResponseBaseModel<OpenDirectResponse> openDirectResponse =
//         await _directsService.openDirect(directBody);
//     final directInfo = openDirectResponse.result;
//     mateDirectInfo.isOnline = directInfo.isOnline;
//     mateDirectInfo.lastSeen = lastSeenPassedTime(directInfo.lastSeen);
//     _updateDirectInfo();
//     if (directInfo.messages.isNotEmpty) {
//       _directMessages = directInfo.messages.reversed.toList();
//       _addDateMsg();
//       _mateDirectInfoSubject.value.newMessagesCount = 0;
//       _seenMsg(_directMessages.last.id);
//     }
//     _updateDirectMessages();
//   }
//
// //  Future<void> _readDirect() async {
// //    DirectsService _directsService = DirectsService.instance;
// //    DirectRead directRead = DirectRead(
// //      containerId: mateDirectInfo.containerId,
// //      read: true,
// //    );
// //    _directsService.directRead(directRead);
// //  }
//
//   Future<void> _getOlderMessages() async {
//     DirectsBody directBody = DirectsBody(
//       userId: mateDirectInfo.userId,
//       maxId: _directMessages.first.id,
//       count: 20,
//     );
//     ResponseBaseModel<DirectsResponse> openDirectResponse =
//         await _directsService.getMessages(directBody);
//     if (openDirectResponse.result.messages.isEmpty) {
//       _hasMoreMsg = false;
//       moreLoadingNotifier.value = false;
//       return;
//     }
//     _directMessages.insertAll(
//         0, openDirectResponse.result.messages.reversed.toList());
//     _addDateMsg();
//     _updateDirectMessages();
//   }
//
//   Future<void> _getNewMessages() async {
//     if (_directMessages.isEmpty) return;
//     final dm = _directMessages.lastWhere(
//       (dm) => dm.id != null && dm.sent,
//       orElse: null,
//     );
//     if (dm == null) return;
//     final directBody = DirectsBody(
//       userId: mateDirectInfo.userId,
//       minId: dm.id,
//       count: 100,
//     );
//     ResponseBaseModel<DirectsResponse> openDirectResponse =
//         await _directsService.getMessages(directBody);
//     if (openDirectResponse.result.messages.isEmpty) {
//       return;
//     }
//     _directMessages
//         .addAll(openDirectResponse.result.messages.reversed.toList());
//     _addDateMsg();
//     _updateDirectMessages();
//     _animateMessagesToEnd();
//   }
//
//   Future<void> submitText() async {
//     if (textEditingController.text != "") {
//       FocusScope.of(_context).requestFocus(FocusNode());
//       mateDirectInfo?.lastMessage = LastMessage(
//         text: textEditingController.text,
//         outgoing: true,
//         seen: false,
//         sent: false,
//         sentAt: DateTime.now(),
//       );
//       DirectMessage directMessage = DirectMessage(
//         seen: false,
//         sentByMe: true,
//         sent: false,
//         sentAt: DateTime.now(),
//         type: 'text',
//         text: textEditingController.text,
//       );
//       _directMessages.add(directMessage);
//       _updateDirectMessages();
//       _sendMessages();
//     }
//     textEditingController.text = "";
//     _updateDirectInfo();
//     _addDateMsg();
//     _updateDirectMessages();
//     _animateMessagesToEnd();
//   }
//
//   void _sendMessages() {
//     _directMessages.where((dm) => dm.sent == false).forEach((unsentDm) {
//       hubService
//           .sendChatMessage(
//         mateDirectInfo.userId,
//         unsentDm.text,
//       )
//           .then((value) {
//         if (value == null) return;
//         unsentDm?.id = value;
//         unsentDm?.sent = true;
//         mateDirectInfo?.lastMessage?.sent = true;
//         _updateDirectMessages();
//         if (handlePurposeful != null) {
//           handlePurposeful();
//         }
//         if (isLiveMessaging) {
//           if (liveMessageProgressController.timer != null &&
//               liveMessageProgressController.timer.isActive) {
//             liveMessageProgressController.timer.cancel();
//           }
//           liveMessageTimeEndNotifier.value = false;
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             liveMessageProgressController.reset();
//             handleOnLiveMessageSent();
//           });
//         }
//       });
//     });
//   }
//
//   void _animateMessagesToEnd() {
//     scrollController.animateTo(
//       0,
//       duration: Duration(milliseconds: 300),
//       curve: Curves.ease,
//     );
//   }
//
//   void _addDateMsg() {
//     _directMessages.asMap().forEach((index, dm) {
//       var msg = _directMessages;
//       int prv = index - 1;
//       if (index > 0) {
//         if (msg[prv].sentAt.month != dm.sentAt.month ||
//             msg[prv].sentAt.day != dm.sentAt.day) {
//           dateDirectMessageId.add(dm.id);
//         } else if (dateDirectMessageId.contains(dm.id)) {
//           dateDirectMessageId.remove(dm.id);
//         }
//       } else {
//         dateDirectMessageId.add(dm.id);
//       }
//     });
//   }
//
//   bool onScroll(ScrollNotification notification) {
//     if (notification.metrics.extentAfter < 500 &&
//         _hasMoreMsg &&
//         !moreLoadingNotifier.value) {
//       moreLoadingNotifier.value = true;
//       _getOlderMessages().then((_) {
//         moreLoadingNotifier.value = false;
//       });
//     }
//     return false;
//   }
//
//   Future<void> changedText() async {
//     try {
//       await hubService.sendUserIsTyping(mateDirectInfo.userId);
//     } catch (e) {
//       throw UnimplementedError();
//     }
//   }
//
//   Future<void> _seenMsg(int lastMsgId) async {
//     try {
//       await hubService.sendUserDirectSeen(mateDirectInfo.userId, lastMsgId);
//     } catch (e) {
//       throw UnimplementedError();
//     }
//   }
//
//   void _handleChatUserStatusChanged(List<Object> args) {
//     DirectUserStatus onlineStatus = DirectUserStatus.fromJson(args.first);
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(onlineStatus.lastSeen);
//     mateDirectInfo.isOnline = onlineStatus.online;
//     mateDirectInfo.lastSeen = lastSeenPassedTime(date);
//     _updateDirectInfo();
//   }
//
//   void _handleDirectMsg(List<Object> args) {
//     DirectMessageReceived dm = DirectMessageReceived.fromJson(args.first);
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(dm.date);
//     mateDirectInfo?.lastMessage = LastMessage(
//       text: dm.text,
//       outgoing: false,
//       seen: true,
//       sent: true,
//       sentAt: date,
//     );
//     DirectMessage directMessage = DirectMessage(
//       id: dm.id,
//       seen: true,
//       sentByMe: false,
//       sent: true,
//       sentAt: date,
//       type: dm.type,
//       text: dm.text,
//     );
//     if (isLiveMessaging) {
//       if (!liveMessageTimeEndNotifier.value &&
//           (liveMessageProgressController.timer == null ||
//               !liveMessageProgressController.timer.isActive)) {
//         liveMessageProgressController.startTimer();
//       }
//     }
//     _directMessages.add(directMessage);
//     _updateDirectMessages();
//     _seenMsg(directMessage.id);
//     _animateMessagesToEnd();
//   }
//
//   void _handleDirectSeen(List<Object> args) {
//     DirectSeen directSeen = DirectSeen.fromJson(args.first);
//     _directMessages.forEach((dm) {
//       if (dm.id <= directSeen.lastId) {
//         dm.seen = true;
//       }
//     });
//     _updateDirectMessages();
//   }
//
//   void _handleDirectTyping(List<Object> args) {
//     TypingStatus typingStatus = TypingStatus.fromJson(args.first);
//     mateDirectInfo.isTyping = typingStatus.isTyping;
//     _updateDirectInfo();
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       if (timer.tick > 20) {
//         timer.cancel();
//         mateDirectInfo.isTyping = false;
//         _updateDirectInfo();
//       }
//     });
//   }
//
//   String lastSeenPassedTime(DateTime lastSeenTime) {
//     final now = DateTime.now();
//     var minutes = now.difference(lastSeenTime).inMinutes;
//     if (minutes <= 1) {
//       return '1 minute ago';
//     }
//     if (minutes < 60 && minutes > 1) {
//       return '$minutes minutes ago';
//     }
//     var hours = now.difference(lastSeenTime).inHours;
//     if (hours <= 1) {
//       return '1 hour ago';
//     }
//     if (hours < 24 && hours > 1) {
//       return '$hours hours ago';
//     }
//     var days = now.difference(lastSeenTime).inDays;
//     if (days <= 1) {
//       return '1 day ago';
//     }
//     if (days < 7 && days > 1) {
//       return '$days days ago';
//     }
//     if (days > 7) {
//       return '${(days / 7).floor()} weeks ago';
//     }
//     if (days <= 31) {
//       return '1 month ago';
//     }
//     if ((days / 31).floor() > 1) {
//       return '${(days / 31).floor()} months ago';
//     }
//     return '';
//   }
// }
