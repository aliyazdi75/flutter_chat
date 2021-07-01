import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_chat/data/models/account/src/serializers.dart';

import 'user.dart';

part 'account.g.dart';

abstract class Account implements Built<Account, AccountBuilder> {
  User get user;

  Account._();

  factory Account([void Function(AccountBuilder) updates]) = _$Account;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Account.serializer, this)
        as Map<String, dynamic>;
  }

  static Account fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Account.serializer, json)!;
  }

  static Serializer<Account> get serializer => _$accountSerializer;
}
