// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ExceptionClassType _$validationException =
    const ExceptionClassType._('validationException');
const ExceptionClassType _$loginException =
    const ExceptionClassType._('loginException');

ExceptionClassType _$exceptionClassTypeValueOf(String name) {
  switch (name) {
    case 'validationException':
      return _$validationException;
    case 'loginException':
      return _$loginException;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ExceptionClassType> _$exceptionClassTypeValues =
    new BuiltSet<ExceptionClassType>(const <ExceptionClassType>[
  _$validationException,
  _$loginException,
]);

Serializer<HttpExceptionModel<Object?>> _$httpExceptionModelSerializer =
    new _$HttpExceptionModelSerializer();
Serializer<ExceptionClass<Object?>> _$exceptionClassSerializer =
    new _$ExceptionClassSerializer();
Serializer<ExceptionClassType> _$exceptionClassTypeSerializer =
    new _$ExceptionClassTypeSerializer();
Serializer<ValidationFieldError> _$validationFieldErrorSerializer =
    new _$ValidationFieldErrorSerializer();

class _$HttpExceptionModelSerializer
    implements StructuredSerializer<HttpExceptionModel<Object?>> {
  @override
  final Iterable<Type> types = const [HttpExceptionModel, _$HttpExceptionModel];
  @override
  final String wireName = 'HttpExceptionModel';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HttpExceptionModel<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'exceptions',
      serializers.serialize(object.exceptions,
          specifiedType: new FullType(BuiltList, [
            new FullType(ExceptionClass, [parameterT])
          ])),
    ];

    return result;
  }

  @override
  HttpExceptionModel<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new HttpExceptionModelBuilder<Object?>()
        : serializers.newBuilder(specifiedType)
            as HttpExceptionModelBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'exceptions':
          result.exceptions.replace(serializers.deserialize(value,
              specifiedType: new FullType(BuiltList, [
                new FullType(ExceptionClass, [parameterT])
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ExceptionClassSerializer
    implements StructuredSerializer<ExceptionClass<Object?>> {
  @override
  final Iterable<Type> types = const [ExceptionClass, _$ExceptionClass];
  @override
  final String wireName = 'ExceptionClass';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ExceptionClass<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
      'class',
      serializers.serialize(object.type,
          specifiedType: const FullType(ExceptionClassType)),
    ];
    Object? value;
    value = object.errors;
    if (value != null) {
      result
        ..add('errors')
        ..add(serializers.serialize(value, specifiedType: parameterT));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value, specifiedType: parameterT));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ExceptionClass<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new ExceptionClassBuilder<Object?>()
        : serializers.newBuilder(specifiedType)
            as ExceptionClassBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'errors':
          result.errors =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
        case 'class':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(ExceptionClassType))
              as ExceptionClassType;
          break;
        case 'code':
          result.code =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ExceptionClassTypeSerializer
    implements PrimitiveSerializer<ExceptionClassType> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'validationException': 'ValidationException',
    'loginException': 'SignInException',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ValidationException': 'validationException',
    'SignInException': 'loginException',
  };

  @override
  final Iterable<Type> types = const <Type>[ExceptionClassType];
  @override
  final String wireName = 'ExceptionClassType';

  @override
  Object serialize(Serializers serializers, ExceptionClassType object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ExceptionClassType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ExceptionClassType.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ValidationFieldErrorSerializer
    implements StructuredSerializer<ValidationFieldError> {
  @override
  final Iterable<Type> types = const [
    ValidationFieldError,
    _$ValidationFieldError
  ];
  @override
  final String wireName = 'ValidationFieldError';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ValidationFieldError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ValidationFieldError deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ValidationFieldErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HttpExceptionModel<T> extends HttpExceptionModel<T> {
  @override
  final BuiltList<ExceptionClass<T>> exceptions;

  factory _$HttpExceptionModel(
          [void Function(HttpExceptionModelBuilder<T>)? updates]) =>
      (new HttpExceptionModelBuilder<T>()..update(updates)).build();

  _$HttpExceptionModel._({required this.exceptions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        exceptions, 'HttpExceptionModel', 'exceptions');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('HttpExceptionModel', 'T');
    }
  }

  @override
  HttpExceptionModel<T> rebuild(
          void Function(HttpExceptionModelBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HttpExceptionModelBuilder<T> toBuilder() =>
      new HttpExceptionModelBuilder<T>()..replace(this);

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

class HttpExceptionModelBuilder<T>
    implements Builder<HttpExceptionModel<T>, HttpExceptionModelBuilder<T>> {
  _$HttpExceptionModel<T>? _$v;

  ListBuilder<ExceptionClass<T>>? _exceptions;

  ListBuilder<ExceptionClass<T>> get exceptions =>
      _$this._exceptions ??= new ListBuilder<ExceptionClass<T>>();

  set exceptions(ListBuilder<ExceptionClass<T>>? exceptions) =>
      _$this._exceptions = exceptions;

  HttpExceptionModelBuilder();

  HttpExceptionModelBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _exceptions = $v.exceptions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HttpExceptionModel<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HttpExceptionModel<T>;
  }

  @override
  void update(void Function(HttpExceptionModelBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HttpExceptionModel<T> build() {
    _$HttpExceptionModel<T> _$result;
    try {
      _$result =
          _$v ?? new _$HttpExceptionModel<T>._(exceptions: exceptions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'exceptions';
        exceptions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HttpExceptionModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ExceptionClass<T> extends ExceptionClass<T> {
  @override
  final T? errors;
  @override
  final ExceptionClassType type;
  @override
  final T? code;
  @override
  final String? message;

  factory _$ExceptionClass(
          [void Function(ExceptionClassBuilder<T>)? updates]) =>
      (new ExceptionClassBuilder<T>()..update(updates)).build();

  _$ExceptionClass._({this.errors, required this.type, this.code, this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'ExceptionClass', 'type');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('ExceptionClass', 'T');
    }
  }

  @override
  ExceptionClass<T> rebuild(void Function(ExceptionClassBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExceptionClassBuilder<T> toBuilder() =>
      new ExceptionClassBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExceptionClass &&
        errors == other.errors &&
        type == other.type &&
        code == other.code &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, errors.hashCode), type.hashCode), code.hashCode),
        message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ExceptionClass')
          ..add('errors', errors)
          ..add('type', type)
          ..add('code', code)
          ..add('message', message))
        .toString();
  }
}

class ExceptionClassBuilder<T>
    implements Builder<ExceptionClass<T>, ExceptionClassBuilder<T>> {
  _$ExceptionClass<T>? _$v;

  T? _errors;

  T? get errors => _$this._errors;

  set errors(T? errors) => _$this._errors = errors;

  ExceptionClassType? _type;

  ExceptionClassType? get type => _$this._type;

  set type(ExceptionClassType? type) => _$this._type = type;

  T? _code;

  T? get code => _$this._code;

  set code(T? code) => _$this._code = code;

  String? _message;

  String? get message => _$this._message;

  set message(String? message) => _$this._message = message;

  ExceptionClassBuilder();

  ExceptionClassBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _errors = $v.errors;
      _type = $v.type;
      _code = $v.code;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExceptionClass<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExceptionClass<T>;
  }

  @override
  void update(void Function(ExceptionClassBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ExceptionClass<T> build() {
    final _$result = _$v ??
        new _$ExceptionClass<T>._(
            errors: errors,
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'ExceptionClass', 'type'),
            code: code,
            message: message);
    replace(_$result);
    return _$result;
  }
}

class _$ValidationFieldError extends ValidationFieldError {
  @override
  final String message;

  factory _$ValidationFieldError(
          [void Function(ValidationFieldErrorBuilder)? updates]) =>
      (new ValidationFieldErrorBuilder()..update(updates)).build();

  _$ValidationFieldError._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, 'ValidationFieldError', 'message');
  }

  @override
  ValidationFieldError rebuild(
          void Function(ValidationFieldErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValidationFieldErrorBuilder toBuilder() =>
      new ValidationFieldErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValidationFieldError && message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc(0, message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ValidationFieldError')
          ..add('message', message))
        .toString();
  }
}

class ValidationFieldErrorBuilder
    implements Builder<ValidationFieldError, ValidationFieldErrorBuilder> {
  _$ValidationFieldError? _$v;

  String? _message;

  String? get message => _$this._message;

  set message(String? message) => _$this._message = message;

  ValidationFieldErrorBuilder();

  ValidationFieldErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidationFieldError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ValidationFieldError;
  }

  @override
  void update(void Function(ValidationFieldErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ValidationFieldError build() {
    final _$result = _$v ??
        new _$ValidationFieldError._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'ValidationFieldError', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
