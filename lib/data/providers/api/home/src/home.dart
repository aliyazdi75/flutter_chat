import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/services/http/index.dart';

class HomeApi {
  static Future<ChatList> getChatList() async {
    final response = await HttpHelper('silver/directs')
        .httpGet(headerType: HttpHeaderType.authenticated);
    return ChatList.fromJson(response);
  }
}
