import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:with_flutter/home/bloc/bloc.dart';
import 'package:with_flutter/model/profile.dart';

import 'jobInfo.dart';
import 'mediaCollection.dart';
import 'member.dart';

part 'account.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Account extends Equatable {
  final int id;

  final int memberId;
  final double accountBalanceWiken;

  const Account({
    this.id,
    this.memberId,
    this.accountBalanceWiken,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Account { id: $id }';
}
