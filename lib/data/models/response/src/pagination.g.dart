// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pagination<Object?>> _$paginationSerializer =
    new _$PaginationSerializer();

class _$PaginationSerializer
    implements StructuredSerializer<Pagination<Object?>> {
  @override
  final Iterable<Type> types = const [Pagination, _$Pagination];
  @override
  final String wireName = 'Pagination';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, Pagination<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[];
    Object? value;
    value = object.count;
    if (value != null) {
      result
        ..add('count')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.next;
    if (value != null) {
      result
        ..add('next')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.previous;
    if (value != null) {
      result
        ..add('previous')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.results;
    if (value != null) {
      result
        ..add('results')
        ..add(serializers.serialize(value,
            specifiedType: new FullType(BuiltList, [parameterT])));
    }
    return result;
  }

  @override
  Pagination<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new PaginationBuilder<Object?>()
        : serializers.newBuilder(specifiedType) as PaginationBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'next':
          result.next = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'previous':
          result.previous = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'results':
          result.results.replace(serializers.deserialize(value,
                  specifiedType: new FullType(BuiltList, [parameterT]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Pagination<T> extends Pagination<T> {
  @override
  final int? count;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  final BuiltList<T>? results;

  factory _$Pagination([void Function(PaginationBuilder<T>)? updates]) =>
      (new PaginationBuilder<T>()..update(updates)).build();

  _$Pagination._({this.count, this.next, this.previous, this.results})
      : super._() {
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('Pagination', 'T');
    }
  }

  @override
  Pagination<T> rebuild(void Function(PaginationBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationBuilder<T> toBuilder() => new PaginationBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pagination &&
        count == other.count &&
        next == other.next &&
        previous == other.previous &&
        results == other.results;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, count.hashCode), next.hashCode), previous.hashCode),
        results.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pagination')
          ..add('count', count)
          ..add('next', next)
          ..add('previous', previous)
          ..add('results', results))
        .toString();
  }
}

class PaginationBuilder<T>
    implements Builder<Pagination<T>, PaginationBuilder<T>> {
  _$Pagination<T>? _$v;

  int? _count;

  int? get count => _$this._count;

  set count(int? count) => _$this._count = count;

  String? _next;

  String? get next => _$this._next;

  set next(String? next) => _$this._next = next;

  String? _previous;

  String? get previous => _$this._previous;

  set previous(String? previous) => _$this._previous = previous;

  ListBuilder<T>? _results;

  ListBuilder<T> get results => _$this._results ??= new ListBuilder<T>();

  set results(ListBuilder<T>? results) => _$this._results = results;

  PaginationBuilder();

  PaginationBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _next = $v.next;
      _previous = $v.previous;
      _results = $v.results?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pagination<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Pagination<T>;
  }

  @override
  void update(void Function(PaginationBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pagination<T> build() {
    _$Pagination<T> _$result;
    try {
      _$result = _$v ??
          new _$Pagination<T>._(
              count: count,
              next: next,
              previous: previous,
              results: _results?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'results';
        _results?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Pagination', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
