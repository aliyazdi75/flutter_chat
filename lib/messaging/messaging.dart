// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Messaging extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: style.padding.message),
//       child: StreamBuilder<List<DirectMessage>>(
//         stream: bloc.directMessagesStream,
//         builder: (_,
//                 AsyncSnapshot<List<DirectMessage>>
//                     directMessagesStreamSnapshot) =>
//             ValueListenableBuilder(
//           valueListenable: bloc.moreLoadingNotifier,
//           builder: (_, bool moreLoadingStream, __) =>
//               NotificationListener<ScrollNotification>(
//             onNotification: (scrollNotification) =>
//                 bloc.onScroll(scrollNotification),
//             child: ListView(
//               controller: bloc.scrollController,
//               physics: BouncingScrollPhysics(),
//               reverse: true,
//               children: <Widget>[
//                 directMessagesStreamSnapshot.hasData
//                     ? directMessagesStreamSnapshot.data.length == 0
//                         ? Center(
//                             child: Text(
//                               'Say Hi to start your conversation!',
//                               style: textTheme.bodyText1,
//                             ),
//                           )
//                         : Column(
//                             children: directMessagesStreamSnapshot.data
//                                 .map(
//                                   (DirectMessage message) =>
//                                       MessageBox(message),
//                                 )
//                                 .toList(),
//                           )
//                     : Container(),
//                 moreLoadingStream
//                     ? Padding(
//                         padding: EdgeInsets.symmetric(vertical: 5.0),
//                         child: Loader(size: 20.0, color: style.colors.blue),
//                       )
//                     : Container()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
