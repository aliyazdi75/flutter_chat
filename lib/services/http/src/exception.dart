import 'package:flutter/foundation.dart';

class HttpException implements Exception {
  final Object type;
  final String? key;
  final String? value;

  HttpException(this.type, [this.key, this.value]) {
    debugPrintStack(label: toString());
  }

  @override
  String toString() => value == null
      ? key == null
          ? '$type'
          : '$type: ($key)'
      : '$type: ($key, $value)';
}

class ForbiddenException extends HttpException {
  final String url;

  ForbiddenException(this.url, [String? key, String? value])
      : super(UnauthorisedException, key, value);

  @override
  String toString() => 'UnauthorisedException in $url';
}

class InvalidInputException extends HttpException {
  final String url;

  InvalidInputException(this.url, [String? key, String? value])
      : super(InvalidInputException, key, value);

  @override
  String toString() => 'InvalidInputException in $url';
}

class SocketException extends HttpException {
  final String url;

  SocketException(this.url, [String? key, String? value])
      : super(SocketException, key, value);

  @override
  String toString() => 'SocketException in $url';
}

class NotFoundException extends HttpException {
  final String url;

  NotFoundException(this.url, [String? key, String? value])
      : super(NotFoundException, key, value);

  @override
  String toString() => 'NotFoundException in $url';
}

class ServerException extends HttpException {
  final String url;

  ServerException(this.url, [String? key, String? value])
      : super(ServerException, key, value);

  @override
  String toString() => 'ServerException in $url';
}

class NotHandleException extends HttpException {
  final String url;

  NotHandleException(this.url, [String? key, String? value])
      : super(NotHandleException, key, value);

  @override
  String toString() => 'NotHandleException in $url';
}

class UnauthorisedException implements Exception {
  final String url;

  UnauthorisedException(this.url);

  @override
  String toString() => 'UnauthorisedException in $url';
}

class BadRequestException implements Exception {
  final String url;
  final Map<String, dynamic> model;

  BadRequestException(this.url, this.model);

  @override
  String toString() => 'BadRequestException in $url';
}
