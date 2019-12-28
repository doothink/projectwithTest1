import 'package:meta/meta.dart';
import 'package:with_flutter/model/profile.dart';

@immutable
class PhoneCertState {
  final bool isLoading;
  final bool isRequest;
  final bool isCertLoading;
  final bool isCerted;
  final bool isFailure;
  final String failureMessage;

  PhoneCertState({
    @required this.isLoading,
    @required this.isRequest,
    @required this.isCertLoading,
    @required this.isCerted,
    @required this.isFailure,
    this.failureMessage,
  });

  factory PhoneCertState.empty() {
    return PhoneCertState(
      isLoading: false,
      isRequest: false,
      isCertLoading: false,
      isCerted: false,
      isFailure: false,
    );
  }

  factory PhoneCertState.loading() {
    return PhoneCertState(
      isLoading: true,
      isRequest: false,
      isCertLoading: false,
      isCerted: false,
      isFailure: false,
    );
  }

  factory PhoneCertState.failure() {
    return PhoneCertState(
      isLoading: false,
      isRequest: false,
      isCertLoading: false,
      isCerted: false,
      isFailure: false,
    );
  }

  factory PhoneCertState.success() {
    return PhoneCertState(
      isLoading: false,
      isRequest: true,
      isCertLoading: false,
      isCerted: false,
      isFailure: false,
    );
  }

  factory PhoneCertState.certLoading() {
    return PhoneCertState(
      isLoading: false,
      isRequest: true,
      isCertLoading: true,
      isCerted: false,
      isFailure: false,
    );
  }

  factory PhoneCertState.certFailure(String failureMessage) {
    return PhoneCertState(
      isLoading: false,
      isRequest: true,
      isCertLoading: false,
      isCerted: false,
      isFailure: true,
      failureMessage: failureMessage,
    );
  }

  factory PhoneCertState.certSuccess() {
    return PhoneCertState(
      isLoading: false,
      isRequest: true,
      isCertLoading: false,
      isCerted: true,
      isFailure: false,
    );
  }
}
