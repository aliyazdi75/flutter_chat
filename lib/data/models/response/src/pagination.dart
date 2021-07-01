import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'pagination.g.dart';

abstract class Pagination<T>
    implements Built<Pagination<T>, PaginationBuilder<T>> {
  int? get count;

  String? get next;

  String? get previous;

  BuiltList<T>? get results;

  Pagination._();

  factory Pagination([Function(PaginationBuilder<T>) updates]) =
      _$Pagination<T>;

  static Pagination<T> fromJson<T>(Map<String, dynamic> json) {
    final specifiedType = FullType(Pagination, [FullType(T)]);
    final serializersWithBuilder = (serializers.toBuilder()
          ..addBuilderFactory(specifiedType, () => PaginationBuilder<T>())
          ..addBuilderFactory(
              FullType(BuiltList, [FullType(T)]), () => ListBuilder<T>()))
        .build();
    return serializersWithBuilder.deserialize(json,
        specifiedType: specifiedType) as Pagination<T>;
  }

  static Serializer<Pagination> get serializer => _$paginationSerializer;
}
