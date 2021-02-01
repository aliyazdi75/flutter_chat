import 'package:flutter_chat/data/models/chat/index.dart';
import 'package:flutter_chat/services/http/index.dart';

class ChatApi {
  static Future<Chat> openChat(OpenChatInputBody openChatInputBody) async {
    final body = openChatInputBody.toJson();
    final response = await HttpHelper('direct/open').httpPost(
      headerType: HttpHeaderType.authenticated,
      body: body,
    );
    return Chat.fromJson(response);
  }

  static Future<GetMessageResponse> getMessages(
      String userId, GetMessagesInputQuery getMessagesInputQuery) async {
    final query = Map<String, String>.from(getMessagesInputQuery.toJson());
    final response = await HttpHelper('direct/get/$userId').httpGet(
      headerType: HttpHeaderType.authenticated,
      queryParams: query,
    );
    return GetMessageResponse.fromJson(response);
  }

  static Future<void> readChat(ChatReadInputBody chatReadInputBody) async {
    final body = chatReadInputBody.toJson();
    await HttpHelper('direct/read').httpPost(
      headerType: HttpHeaderType.authenticated,
      body: body,
    );
  }

  static Future<void> closeChat(CloseChatInputBody closeChatInputBody) async {
    final body = closeChatInputBody.toJson();
    await HttpHelper('direct/close').httpPost(
      headerType: HttpHeaderType.authenticated,
      body: body,
    );
  }
}
