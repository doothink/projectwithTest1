// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as int,
    memberId: json['memberId'] as int,
    accountBalanceWiken: (json['accountBalanceWiken'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'memberId': instance.memberId,
      'accountBalanceWiken': instance.accountBalanceWiken,
    };
