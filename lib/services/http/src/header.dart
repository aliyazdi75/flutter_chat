import 'package:flutter_chat/data/repositories/authentication/index.dart';

import 'exception.dart';

enum HttpHeaderType {
  authenticated,
  anonymous,
}

abstract class HttpHeader {
  static Future<Map<String, String>> setHeader(
    HttpHeaderType headerType,
  ) async {
    switch (headerType) {
      case HttpHeaderType.authenticated:
        final credit = await AuthenticationRepository().getCredit();
        if (credit == null) {
          throw NoTokenException();
        }
        return {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${credit.token}'
        };
      case HttpHeaderType.anonymous:
        return {'Content-Type': 'application/json'};
      default:
        throw Exception('$headerType is not supported HttpHeaderType');
    }
  }
}
