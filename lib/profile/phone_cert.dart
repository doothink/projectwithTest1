import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/profile/bloc/bloc_phone_cert.dart';
import 'package:with_flutter/profile/phone_cert_form.dart';

class PhoneCert extends StatelessWidget {
  TextEditingController _phoneNumberController;

  PhoneCert({Key key, @required TextEditingController phoneNumberController})
      : assert(phoneNumberController != null),
        _phoneNumberController = phoneNumberController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        return PhoneCertBloc(
          authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
        );
      },
      child: PhoneCertForm(phoneNumberController: _phoneNumberController),
    );
  }
}
