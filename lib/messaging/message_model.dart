// class DirectMessage {
//   int id;
//   bool seen;
//   bool sentByMe;
//   bool sent = true;
//   DateTime sentAt;
//   String type;
//   String text;
//
//   DirectMessage({
//     this.id,
//     this.seen,
//     this.sentByMe,
//     this.sent = true,
//     this.sentAt,
//     this.type,
//     this.text,
//   });
//
//   DirectMessage.fromJson(Map<String, dynamic> json) {
//     id = json['id'] != null ? json['id'] : null;
//     seen = json['seen'] != null ? json['seen'] : null;
//     sentByMe = json['sentByMe'] != null ? json['sentByMe'] : null;
//     sentAt = json['sentAt'] != null ? _parseDateTime(json['sentAt']) : null;
//     type = json['type'] != null ? json['type'] : null;
//     text = json['text'] != null ? json['text'] : null;
//   }
//
//   DateTime _parseDateTime(String dateTime) =>
//       DateTime.parse(dateTime).toLocal();
// }
