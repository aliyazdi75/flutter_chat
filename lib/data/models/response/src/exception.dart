import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'exception.g.dart';

abstract class HttpExceptionModel<T>
    implements Built<HttpExceptionModel<T>, HttpExceptionModelBuilder<T>> {
  BuiltList<ExceptionClass<T>> get exceptions;

  HttpExceptionModel._();

  factory HttpExceptionModel(
          [void Function(HttpExceptionModelBuilder<T>) updates]) =
      _$HttpExceptionModel<T>;

  static HttpExceptionModel<T> fromJson<T>(Map<String, dynamic> json) {
    final specifiedType = FullType(HttpExceptionModel, [FullType(T)]);
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(
            specifiedType,
            () => HttpExceptionModelBuilder<T>(),
          )
          ..addBuilderFactory(
            FullType(ExceptionClass, [FullType(T)]),
            () => ExceptionClassBuilder<T>(),
          )
          ..addBuilderFactory(
            FullType(BuiltList, [
              FullType(ExceptionClass, [FullType(T)])
            ]),
            () => ListBuilder<ExceptionClass<T>>(),
          ))
        .build();
    return serializersWithBuilder.deserialize(json,
        specifiedType: specifiedType) as HttpExceptionModel<T>;
  }

  static Serializer<HttpExceptionModel> get serializer =>
      _$httpExceptionModelSerializer;
}

abstract class ExceptionClass<T>
    implements Built<ExceptionClass<T>, ExceptionClassBuilder<T>> {
  T? get errors;

  @BuiltValueField(wireName: 'class')
  ExceptionClassType get type;

  T? get code;

  String? get message;

  ExceptionClass._();

  factory ExceptionClass([void Function(ExceptionClassBuilder<T>) updates]) =
      _$ExceptionClass<T>;

  static Serializer<ExceptionClass> get serializer =>
      _$exceptionClassSerializer;
}

class ExceptionClassType extends EnumClass {
  @BuiltValueEnumConst(wireName: 'ValidationException')
  static const ExceptionClassType validationException = _$validationException;

  @BuiltValueEnumConst(wireName: 'SignInException')
  static const ExceptionClassType loginException = _$loginException;

  const ExceptionClassType._(String name) : super(name);

  static BuiltSet<ExceptionClassType> get values => _$exceptionClassTypeValues;

  static ExceptionClassType valueOf(String name) =>
      _$exceptionClassTypeValueOf(name);

  static Serializer<ExceptionClassType> get serializer =>
      _$exceptionClassTypeSerializer;
}

abstract class ValidationFieldError
    implements Built<ValidationFieldError, ValidationFieldErrorBuilder> {
  String get message;

  ValidationFieldError._();

  factory ValidationFieldError(
          [void Function(ValidationFieldErrorBuilder) updates]) =
      _$ValidationFieldError;

  static Serializer<ValidationFieldError> get serializer =>
      _$validationFieldErrorSerializer;
}
