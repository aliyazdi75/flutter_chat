import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'exception.g.dart';

abstract class HttpExceptionModel
    implements Built<HttpExceptionModel, HttpExceptionModelBuilder> {
  @nullable
  List<ExceptionDescription> get exceptions;

  HttpExceptionModel._();

  factory HttpExceptionModel(
          [void Function(HttpExceptionModelBuilder) updates]) =
      _$HttpExceptionModel;

  static HttpExceptionModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(HttpExceptionModel.serializer, json);
  }

  static Serializer<HttpExceptionModel> get serializer =>
      _$httpExceptionModelSerializer;
}

abstract class ExceptionDescription
    implements Built<ExceptionDescription, ExceptionDescriptionBuilder> {
  @BuiltValueField(wireName: 'class')
  String get method;

  String get message;

  ExceptionDescription._();

  factory ExceptionDescription(
          [void Function(ExceptionDescriptionBuilder) updates]) =
      _$ExceptionDescription;

  static ExceptionDescription fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ExceptionDescription.serializer, json);
  }

  static Serializer<ExceptionDescription> get serializer =>
      _$exceptionDescriptionSerializer;
}

abstract class ValidationException
    implements Built<ValidationException, ValidationExceptionBuilder> {
  @BuiltValueField(wireName: 'class')
  String get method;

  String get message;

  List<String> get fields;

  ValidationException._();

  factory ValidationException(
          [void Function(ValidationExceptionBuilder) updates]) =
      _$ValidationException;

  static ValidationException fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ValidationException.serializer, json);
  }

  static Serializer<ValidationException> get serializer =>
      _$validationExceptionSerializer;
}
