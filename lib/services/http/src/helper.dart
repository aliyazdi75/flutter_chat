import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_chat/data/constants/index.dart';
import 'package:http/http.dart' as http;

import 'exception.dart';
import 'header.dart';

abstract class HttpClientBase {
  Future<Map<String, dynamic>> httpGet({
    Map<String, String> queryParams,
    HttpHeaderType headerType,
  });

  Future<Map<String, dynamic>> httpPost({
    @required Object badRequestModel,
    Map<String, String> queryParams,
    HttpHeaderType headerType,
    Map<String, dynamic> body,
  });
}

class HttpHelper implements HttpClientBase {
  HttpHelper(this.path);

  final http.Client _httpClient = http.Client();
  final String path;

  Future<Map<String, dynamic>> _responseData(
    http.Response response, {
    Object badRequestModel,
  }) async {
    try {
      switch (response.statusCode) {
        // 200
        case HttpStatus.ok:
          final headers = response.headers;
          if (!headers.containsKey(contentTypeKeyHeader) &&
              headers[contentTypeKeyHeader] != contentTypeValueHeader) {
            return null;
          }
          return json.decode(utf8.decode(response.bodyBytes))
              as Map<String, dynamic>;
        // 201
        case HttpStatus.created:
        // 204
        case HttpStatus.noContent:
        // 400
        case HttpStatus.badRequest:
          // if (badRequestModel == RegisterBadRequest) {
          //   throw BadRequestException(
          //     response.request.url.path,
          //     RegisterBadRequest.fromJson(
          //         json.decode(utf8.decode(response.bodyBytes))
          //             as Map<String, dynamic>),
          //   );
          // } else if (badRequestModel == LoginBadRequest) {
          //   throw BadRequestException(
          //     response.request.url.path,
          //     LoginBadRequest.fromJson(
          //         json.decode(utf8.decode(response.bodyBytes))
          //             as Map<String, dynamic>),
          //   );
          // }
          throw NotHandleException(
            response.request.url.path,
            'BadRequest Model not implemented',
            response.statusCode.toString(),
          );
        // 401
        case HttpStatus.unauthorized:
          throw UnauthorisedException(response.request.url.path);
        // 403
        case HttpStatus.forbidden:
          throw ForbiddenException(
            response.request.url.path,
            'Authorization Forbidden',
            response.statusCode.toString(),
          );
        // 404
        case HttpStatus.notFound:
          throw NotFoundException(
            response.request.url.path,
            'This Uri Not Founded',
            response.statusCode.toString(),
          );
        // 500
        case HttpStatus.internalServerError:
          throw ServerException(
            response.request.url.path,
            'Server Error Body',
            utf8.decode(response.bodyBytes),
          );
        // Others
        default:
          throw NotHandleException(
            response.request.url.path,
            'This Status Code Not Handled',
            response.statusCode.toString(),
          );
      }
    } on JsonUnsupportedObjectError catch (_) {
      throw ServerException(
        response.request.url.path,
        'Server Unsupported Json Object',
        utf8.decode(response.bodyBytes),
      );
    } on FormatException catch (_) {
      throw ServerException(
        response.request.url.path,
        'Server Unsupported Json Format',
        utf8.decode(response.bodyBytes),
      );
    }
  }

  @override
  Future<Map<String, dynamic>> httpGet({
    Map<String, String> queryParams,
    HttpHeaderType headerType = HttpHeaderType.anonymous,
  }) async {
    try {
      return _responseData(
        await _httpClient.get(
          usingSSL
              ? Uri.https(
                  serverUrl,
                  '/$apiKeyword/$path/',
                  queryParams,
                )
              : Uri.http(
                  serverUrl,
                  '/$apiKeyword/$path/',
                  queryParams,
                ),
          headers: await HttpHeader.setHeader(headerType),
        ),
      );
    } on SocketException catch (e) {
      throw SocketException(e.url, e.key, e.value);
    }
  }

  @override
  Future<Map<String, dynamic>> httpPost({
    Object badRequestModel,
    Map<String, String> queryParams,
    HttpHeaderType headerType = HttpHeaderType.anonymous,
    Map<String, dynamic> body,
  }) async {
    try {
      return _responseData(
        await _httpClient.post(
          usingSSL
              ? Uri.https(
                  serverUrl,
                  '/$apiKeyword/$path/',
                  queryParams,
                )
              : Uri.http(
                  serverUrl,
                  '/$apiKeyword/$path/',
                  queryParams,
                ),
          headers: await HttpHeader.setHeader(headerType),
          body: json.encode(body),
        ),
        badRequestModel: badRequestModel,
      );
    } on SocketException catch (e) {
      throw SocketException(e.url, e.key, e.value);
    } on JsonUnsupportedObjectError catch (e) {
      throw JsonUnsupportedObjectError(e);
    }
  }
}
