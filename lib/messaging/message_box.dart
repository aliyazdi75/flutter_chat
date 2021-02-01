// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class MessageBox extends StatelessWidget {
//   final DirectMessage _directMessage;
//
//   MessageBox(this._directMessage);
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<MessagingBloc>(context, listen: false);
//     final textTheme = Theme.of(context).textTheme;
//     final style = Style.instance;
//     final sentByMe = _directMessage.sentByMe;
//     final avatarLink =
//         AuthenticationService().currentUser.user.avatarImage.imageLink.url;
//
//     String messagePassedTime(DateTime messageTime) {
//       String hour = messageTime.hour.toString().padLeft(2, '0');
//       String min = messageTime.minute.toString().padLeft(2, '0');
//       return '$hour:$min';
//     }
//
//     Widget date() {
//       DateFormat format = DateFormat("MMMM dd");
//       String formattedDate = format.format(_directMessage.sentAt);
//       return bloc.dateDirectMessageId.contains(_directMessage.id)
//           ? Container(
//               child: Text(
//                 formattedDate,
//                 style: textTheme.caption.copyWith(
//                   fontSize: 10,
//                   color: style.colors.disabled2,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             )
//           : Container();
//     }
//
//     return Column(
//       children: [
//         date(),
//         Container(
//           margin:
//               EdgeInsets.symmetric(vertical: style.padding.messageBetweenBox),
//           child: Directionality(
//             textDirection: sentByMe ? TextDirection.rtl : TextDirection.ltr,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 Container(
//                   height: style.avatar.message,
//                   width: style.avatar.message,
//                   child: ClipOval(
//                     child: Image.network(
//                       sentByMe ? avatarLink : bloc.mateDirectInfo.imageLink.url,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: style.width.messageAvatarMessageBox),
//                 Expanded(
//                   child: LayoutBuilder(
//                     builder: (_, constraint) {
//                       return Row(
//                         children: <Widget>[
//                           Container(
//                             constraints: BoxConstraints(
//                               maxWidth: constraint.maxWidth,
//                               minWidth: constraint.maxWidth * .3,
//                             ),
//                             decoration:
//                                 buildMessageBoxDecoration(sentByMe, style),
//                             child: Stack(
//                               children: <Widget>[
//                                 Container(
//                                   margin: EdgeInsets.only(
//                                     top: style.padding.messageInnerBoxAll,
//                                     left: style.padding.messageInnerBoxAll,
//                                     right: style.padding.messageInnerBoxRight,
//                                     bottom: style.padding.messageInnerBoxBottom,
//                                   ),
//                                   child: Text(
//                                     _directMessage.text,
//                                     textDirection: TextDirection.ltr,
//                                     textAlign: TextAlign.start,
//                                     style: textTheme.subtitle2.copyWith(
//                                       color: sentByMe
//                                           ? Colors.white
//                                           : Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   right: style.positioned.messageTimeRight,
//                                   bottom: style.positioned.messageTimeBottom,
//                                   child: Row(
//                                     children: [
//                                       sentByMe
//                                           ? Icon(
//                                               _directMessage.sent
//                                                   ? _directMessage.seen
//                                                       ? Icons.done_all
//                                                       : Icons.done
//                                                   : Icons.query_builder,
//                                               size: 12.0,
//                                               color: Colors.white,
//                                             )
//                                           : Container(),
//                                       SizedBox(
//                                         width: 2.0,
//                                       ),
//                                       Text(
//                                         messagePassedTime(
//                                             _directMessage.sentAt),
//                                         style: textTheme.caption.copyWith(
//                                           color: sentByMe
//                                               ? Colors.white
//                                               : Colors.black,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 SizedBox(width: style.width.messageMessageBoxEnd),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   BoxDecoration buildMessageBoxDecoration(bool sentByMe, Style style) {
//     return BoxDecoration(
//       gradient: LinearGradient(
//         colors: sentByMe
//             ? [style.colors.blue, style.colors.blue]
//             : [style.colors.grey, style.colors.grey],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ),
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(style.borderRadius.message),
//         topRight: Radius.circular(style.borderRadius.message),
//         bottomLeft: sentByMe
//             ? Radius.circular(style.borderRadius.message)
//             : Radius.circular(0),
//         bottomRight: sentByMe
//             ? Radius.circular(0)
//             : Radius.circular(style.borderRadius.message),
//       ),
//     );
//   }
// }
