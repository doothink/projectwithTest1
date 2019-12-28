import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/profile/bloc/bloc_phone_cert.dart';

import 'bloc/bloc.dart';
import 'bloc/profile_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneCertForm extends StatefulWidget {
  TextEditingController _phoneNumberController;

  PhoneCertForm(
      {Key key, @required TextEditingController phoneNumberController})
      : assert(phoneNumberController != null),
        _phoneNumberController = phoneNumberController,
        super(key: key);

  @override
  _PhoneCertFormState createState() => _PhoneCertFormState();
}

class _PhoneCertFormState extends State<PhoneCertForm> {
  TextEditingController get _phoneNumberController =>
      widget._phoneNumberController;
  var _phoneNemberFormatter = MaskTextInputFormatter(
      mask: "###########", filter: {"#": RegExp(r'[0-9]')});

  PhoneCertBloc _phoneCertBloc;

  ProfileBloc _profileBloc;

  TextEditingController _certNumberController = new TextEditingController();
  var _certFormatter =
      MaskTextInputFormatter(mask: "######", filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
    _phoneCertBloc = BlocProvider.of<PhoneCertBloc>(context);
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneCertBloc, PhoneCertState>(
      listener: (context, state) {
        if (state.isLoading) {}
        if (state.isRequest) {}
        if (state.isCerted) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Text("인증되었습니다."),
                      ],
                    ),
                    Icon(Icons.info_outline)
                  ],
                ),
                backgroundColor: Colors.green,
              ),
            );
          _profileBloc.add(PhoneCerted());
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        Text(state.failureMessage),
                      ],
                    ),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        print("]-----] PhoneCertForm::state [-----[ ${state.isRequest}");
      },
      child: BlocBuilder<PhoneCertBloc, PhoneCertState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "전화번호",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Stack(children: [
                      TextFormField(
                        inputFormatters: [_phoneNemberFormatter],
                        controller: _phoneNumberController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: state.isRequest
                              ? Color.fromRGBO(222, 222, 222, 1)
                              : Colors.black,
                        ),
                        enabled: !state.isRequest,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: -10),
                          hintText: '01012345678',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: const Color.fromRGBO(222, 222, 222, 1),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: FlatButton(
                          color: state.isRequest
                              ? Color.fromRGBO(222, 222, 222, 1)
                              : Color.fromRGBO(48, 190, 157, 1),
                          textColor: Colors.white,
                          onPressed: _phoneCertReq,
                          child: state.isLoading
                              ? Container(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
//                              strokeWidth: 5.0,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                )
                              : state.isRequest ? Text("요청완료") : Text("요청하기"),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              state.isRequest
                  ? Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "인증번호 입력",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Bold",
                              fontStyle: FontStyle.normal,
                              fontSize: 15.0,
                            ),
                          ),
                          Stack(children: [
                            TextFormField(
                              inputFormatters: [_certFormatter],
                              controller: _certNumberController,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                color: state.isCerted
                                    ? Color.fromRGBO(222, 222, 222, 1)
                                    : Colors.black,
                              ),
                              enabled: !state.isCerted,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: -10),
                                hintText: '123456',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: const Color.fromRGBO(222, 222, 222, 1),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: FlatButton(
                                color: state.isCerted
                                    ? Color.fromRGBO(222, 222, 222, 1)
                                    : Color.fromRGBO(48, 190, 157, 1),
                                textColor: Colors.white,
                                onPressed: _phoneCertConfirm,
                                child: state.isCertLoading
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      )
                                    : state.isCerted
                                        ? Text("인증완료")
                                        : Text("인증하기"),
                              ),
                            )
                          ]),
                        ],
                      ),
                    )
                  : Text(
                      "",
                      style: TextStyle(height: 0),
                    ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _phoneCertReq() {
    if (_phoneNumberController.text.isNotEmpty) {
      _phoneCertBloc
          .add(PhoneCertReq(phoneNember: _phoneNumberController.text));
    }
  }

  _phoneCertConfirm() {
    if (_phoneNumberController.text.isNotEmpty &&
        _certNumberController.text.isNotEmpty) {
      _phoneCertBloc.add(PhoneCertConfirm(
        phoneNember: _phoneNumberController.text,
        certNumber: _certNumberController.text,
      ));
    }
  }
}
