// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_circular_chart/flutter_circular_chart.dart';
// import 'package:mate_machine_app/src/app/message/messaging/messaging_bloc.dart';
// import 'package:mate_machine_app/util/fonts/mate_machine_icons.dart';
// import 'package:mate_machine_app/util/style.dart';
// import 'package:provider/provider.dart';
//
// class MessageTextField extends StatelessWidget {
//   MessageTextField({this.isLive = false});
//
//   final bool isLive;
//
//   @override
//   Widget build(BuildContext context) {
//     final bloc = Provider.of<MessagingBloc>(context, listen: false);
//     final textTheme = Theme.of(context).textTheme;
//     final style = Style.instance;
//     return Container(
//       padding: EdgeInsets.only(
//         top: style.padding.messageTextFieldTop,
//         left: style.padding.messageTextFieldAll,
//         right: style.padding.messageTextFieldAll,
//         bottom: style.padding.messageTextFieldAll,
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//               child: Column(
//             children: [
//               Stack(
//                 alignment: Alignment.centerRight,
//                 children: <Widget>[
//                   Container(
//                     child: TextField(
//                       controller: bloc.textEditingController,
//                       focusNode: bloc.focusNode,
//                       textInputAction: TextInputAction.done,
//                       cursorColor: CupertinoColors.inactiveGray,
//                       onSubmitted: (_) => bloc.submitText,
//                       onChanged: (_) => bloc.changedText(),
//                       minLines: 1,
//                       maxLines: 3,
//                       style: textTheme.subtitle2,
//                       keyboardType: TextInputType.multiline,
//                       decoration: InputDecoration(
//                         hintText: 'Type something …',
//                         contentPadding: EdgeInsets.symmetric(
//                           horizontal:
//                               style.padding.messageTextFieldInnerHorizontal,
//                           vertical: style.padding.messageTextFieldInnerVertical,
//                         ),
//                         hintStyle: TextStyle(
//                           color: style.colors.disabled2,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(style.borderRadius.message),
//                           ),
//                           borderSide:
//                               BorderSide(width: 0.0, color: Colors.transparent),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color: Colors.transparent,
//                           ),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(style.borderRadius.message),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.transparent),
//                           borderRadius:
//                               BorderRadius.circular(style.borderRadius.message),
//                         ),
//                         fillColor: style.colors.grey,
//                         filled: true,
//                       ),
//                     ),
//                   ),
//                   isLive
//                       ? ValueListenableBuilder(
//                           valueListenable: bloc.liveMessageTimeEndNotifier,
//                           builder: (_, bool end, __) => end
//                               ? Icon(
//                                   Icons.error,
//                                   size: 42,
//                                   color: style.colors.red,
//                                 )
//                               : AnimatedCircularChart(
//                                   key: bloc.chartKey,
//                                   size: Size(42, 42),
//                                   initialChartData: bloc.data,
//                                   chartType: CircularChartType.Pie,
//                                   duration: Duration(milliseconds: 0),
//                                 ),
//                         )
//                       : Container()
//                 ],
//               ),
//             ],
//           )),
//           SizedBox(width: style.width.messageAvatarMessageBox),
//           Container(
//             height: style.avatar.message,
//             width: style.avatar.message,
//             decoration: BoxDecoration(
//               color: style.colors.blue,
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               icon: Icon(
//                 MateMachineIcons.send,
//                 color: Colors.white,
//                 size: style.iconSizes.send,
//               ),
//               onPressed: () => bloc.submitText(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class DisabledTextField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final style = Style.instance;
//     return Container(
//       padding: EdgeInsets.only(
//         top: style.padding.messageTextFieldTop,
//         left: style.padding.messageTextFieldAll,
//         right: style.padding.messageTextFieldAll,
//         bottom: style.padding.messageTextFieldAll,
//       ),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: Stack(
//               alignment: Alignment.centerRight,
//               children: <Widget>[
//                 Container(
//                   child: TextField(
//                     enabled: false,
//                     style: textTheme.subtitle2,
//                     keyboardType: TextInputType.multiline,
//                     decoration: InputDecoration(
//                       hintText: 'Type something …',
//                       contentPadding: EdgeInsets.symmetric(
//                         horizontal:
//                             style.padding.messageTextFieldInnerHorizontal,
//                         vertical: style.padding.messageTextFieldInnerVertical,
//                       ),
//                       hintStyle: TextStyle(
//                         color: style.colors.disabled2,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(style.borderRadius.message),
//                         ),
//                         borderSide:
//                             BorderSide(width: 0.0, color: Colors.transparent),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.transparent,
//                         ),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(style.borderRadius.message),
//                         ),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.transparent),
//                         borderRadius:
//                             BorderRadius.circular(style.borderRadius.message),
//                       ),
//                       fillColor: style.colors.grey,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: style.width.messageAvatarMessageBox),
//           Container(
//             height: style.avatar.message,
//             width: style.avatar.message,
//             decoration: BoxDecoration(
//               color: style.colors.disabled2,
//               shape: BoxShape.circle,
//             ),
//             child: IconButton(
//               icon: Icon(
//                 MateMachineIcons.send,
//                 color: Colors.white,
//                 size: style.iconSizes.send,
//               ),
//               onPressed: null,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
