import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PhoneCertEvent extends Equatable {
  const PhoneCertEvent();

  @override
  List<Object> get props => [];
}

class PhoneCertReq extends PhoneCertEvent {
  final String phoneNember;

  const PhoneCertReq({
    @required this.phoneNember,
  });

  @override
  List<Object> get props => [phoneNember];

  @override
  String toString() => 'PhoneCertReq';
}

class PhoneCertConfirm extends PhoneCertEvent {
  final String phoneNember;
  final String certNumber;

  const PhoneCertConfirm({
    @required this.phoneNember,
    @required this.certNumber,
  });

  @override
  List<Object> get props => [phoneNember, certNumber];

  @override
  String toString() => 'PhoneCertConfirm';
}
