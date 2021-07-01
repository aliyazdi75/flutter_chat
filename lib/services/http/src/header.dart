import 'package:flutter_chat/data/constants/index.dart';
import 'package:flutter_chat/data/repositories/authentication/index.dart';

enum HttpHeaderType {
  authenticated,
  anonymous,
}

abstract class HttpHeader {
  static Future<Map<String, String>> setHeader(
    HttpHeaderType? headerType,
  ) async {
    switch (headerType) {
      case HttpHeaderType.authenticated:
        final credit = await AuthenticationRepository().getCredit();
        return {
          'Content-Type': 'application/json',
          '$apiVersionHeader': '$apiVersion',
          '$authHeader': '${credit.token}'
        };
      case HttpHeaderType.anonymous:
        return {
          'Content-Type': 'application/json',
          '$apiVersionHeader': '$apiVersion'
        };
      default:
        throw Exception('$headerType is not supported HttpHeaderType');
    }
  }
}
