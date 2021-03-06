// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HttpExceptionModel> _$httpExceptionModelSerializer =
    new _$HttpExceptionModelSerializer();
Serializer<ExceptionDescription> _$exceptionDescriptionSerializer =
    new _$ExceptionDescriptionSerializer();
Serializer<ValidationException> _$validationExceptionSerializer =
    new _$ValidationExceptionSerializer();

class _$HttpExceptionModelSerializer
    implements StructuredSerializer<HttpExceptionModel> {
  @override
  final Iterable<Type> types = const [HttpExceptionModel, _$HttpExceptionModel];
  @override
  final String wireName = 'HttpExceptionModel';

  @override
  Iterable<Object> serialize(Serializers serializers, HttpExceptionModel object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.exceptions;
    if (value != null) {
      result
        ..add('exceptions')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                List, const [const FullType(ExceptionDescription)])));
    }
    return result;
  }

  @override
  HttpExceptionModel deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HttpExceptionModelBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'exceptions':
          result.exceptions = serializers.deserialize(value,
                  specifiedType: const FullType(
                      List, const [const FullType(ExceptionDescription)]))
              as List<ExceptionDescription>;
          break;
      }
    }

    return result.build();
  }
}

class _$ExceptionDescriptionSerializer
    implements StructuredSerializer<ExceptionDescription> {
  @override
  final Iterable<Type> types = const [
    ExceptionDescription,
    _$ExceptionDescription
  ];
  @override
  final String wireName = 'ExceptionDescription';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ExceptionDescription object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'class',
      serializers.serialize(object.method,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ExceptionDescription deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExceptionDescriptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'class':
          result.method = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ValidationExceptionSerializer
    implements StructuredSerializer<ValidationException> {
  @override
  final Iterable<Type> types = const [
    ValidationException,
    _$ValidationException
  ];
  @override
  final String wireName = 'ValidationException';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ValidationException object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'class',
      serializers.serialize(object.method,
          specifiedType: const FullType(String)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'fields',
      serializers.serialize(object.fields,
          specifiedType: const FullType(List, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  ValidationException deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValidationExceptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'class':
          result.method = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fields':
          result.fields = serializers.deserialize(value,
                  specifiedType:
                      const FullType(List, const [const FullType(String)]))
              as List<String>;
          break;
      }
    }

    return result.build();
  }
}

class _$HttpExceptionModel extends HttpExceptionModel {
  @override
  final List<ExceptionDescription> exceptions;

  factory _$HttpExceptionModel(
          [void Function(HttpExceptionModelBuilder) updates]) =>
      (new HttpExceptionModelBuilder()..update(updates)).build();

  _$HttpExceptionModel._({this.exceptions}) : super._();

  @override
  HttpExceptionModel rebuild(
          void Function(HttpExceptionModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HttpExceptionModelBuilder toBuilder() =>
      new HttpExceptionModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HttpExceptionModel && exceptions == other.exceptions;
  }

  @override
  int get hashCode {
    return $jf($jc(0, exceptions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HttpExceptionModel')
          ..add('exceptions', exceptions))
        .toString();
  }
}

class HttpExceptionModelBuilder
    implements Builder<HttpExceptionModel, HttpExceptionModelBuilder> {
  _$HttpExceptionModel _$v;

  List<ExceptionDescription> _exceptions;

  List<ExceptionDescription> get exceptions => _$this._exceptions;

  set exceptions(List<ExceptionDescription> exceptions) =>
      _$this._exceptions = exceptions;

  HttpExceptionModelBuilder();

  HttpExceptionModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _exceptions = $v.exceptions;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HttpExceptionModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HttpExceptionModel;
  }

  @override
  void update(void Function(HttpExceptionModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HttpExceptionModel build() {
    final _$result = _$v ?? new _$HttpExceptionModel._(exceptions: exceptions);
    replace(_$result);
    return _$result;
  }
}

class _$ExceptionDescription extends ExceptionDescription {
  @override
  final String method;
  @override
  final String message;

  factory _$ExceptionDescription(
          [void Function(ExceptionDescriptionBuilder) updates]) =>
      (new ExceptionDescriptionBuilder()..update(updates)).build();

  _$ExceptionDescription._({this.method, this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        method, 'ExceptionDescription', 'method');
    BuiltValueNullFieldError.checkNotNull(
        message, 'ExceptionDescription', 'message');
  }

  @override
  ExceptionDescription rebuild(
          void Function(ExceptionDescriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExceptionDescriptionBuilder toBuilder() =>
      new ExceptionDescriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExceptionDescription &&
        method == other.method &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, method.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExceptionDescription')
          ..add('method', method)
          ..add('message', message))
        .toString();
  }
}

class ExceptionDescriptionBuilder
    implements Builder<ExceptionDescription, ExceptionDescriptionBuilder> {
  _$ExceptionDescription _$v;

  String _method;

  String get method => _$this._method;

  set method(String method) => _$this._method = method;

  String _message;

  String get message => _$this._message;

  set message(String message) => _$this._message = message;

  ExceptionDescriptionBuilder();

  ExceptionDescriptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _method = $v.method;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExceptionDescription other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExceptionDescription;
  }

  @override
  void update(void Function(ExceptionDescriptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExceptionDescription build() {
    final _$result = _$v ??
        new _$ExceptionDescription._(
            method: BuiltValueNullFieldError.checkNotNull(
                method, 'ExceptionDescription', 'method'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'ExceptionDescription', 'message'));
    replace(_$result);
    return _$result;
  }
}

class _$ValidationException extends ValidationException {
  @override
  final String method;
  @override
  final String message;
  @override
  final List<String> fields;

  factory _$ValidationException(
          [void Function(ValidationExceptionBuilder) updates]) =>
      (new ValidationExceptionBuilder()..update(updates)).build();

  _$ValidationException._({this.method, this.message, this.fields})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        method, 'ValidationException', 'method');
    BuiltValueNullFieldError.checkNotNull(
        message, 'ValidationException', 'message');
    BuiltValueNullFieldError.checkNotNull(
        fields, 'ValidationException', 'fields');
  }

  @override
  ValidationException rebuild(
          void Function(ValidationExceptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValidationExceptionBuilder toBuilder() =>
      new ValidationExceptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValidationException &&
        method == other.method &&
        message == other.message &&
        fields == other.fields;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, method.hashCode), message.hashCode), fields.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValidationException')
          ..add('method', method)
          ..add('message', message)
          ..add('fields', fields))
        .toString();
  }
}

class ValidationExceptionBuilder
    implements Builder<ValidationException, ValidationExceptionBuilder> {
  _$ValidationException _$v;

  String _method;

  String get method => _$this._method;

  set method(String method) => _$this._method = method;

  String _message;

  String get message => _$this._message;

  set message(String message) => _$this._message = message;

  List<String> _fields;

  List<String> get fields => _$this._fields;

  set fields(List<String> fields) => _$this._fields = fields;

  ValidationExceptionBuilder();

  ValidationExceptionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _method = $v.method;
      _message = $v.message;
      _fields = $v.fields;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidationException other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValidationException;
  }

  @override
  void update(void Function(ValidationExceptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValidationException build() {
    final _$result = _$v ??
        new _$ValidationException._(
            method: BuiltValueNullFieldError.checkNotNull(
                method, 'ValidationException', 'method'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'ValidationException', 'message'),
            fields: BuiltValueNullFieldError.checkNotNull(
                fields, 'ValidationException', 'fields'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
