import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/login/login.dart';
import 'package:with_flutter/register/register.dart';

class RegisterForm extends StatefulWidget {
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  RegisterBloc _registerBloc;
  LoginBloc _loginBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  bool _lastNameValidError = false;
  bool _firstNameValidError = false;
  bool _nickNameValidError = false;
  bool _emailValidError = false;
  bool _passwordValidError = false;
  bool _confirmPasswordValidError = false;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _loginBloc = LoginBloc(
        authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('등록중...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
//          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          _loginBloc.add(Registered());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
//          Scaffold.of(context)
//            ..hideCurrentSnackBar()
//            ..showSnackBar(
//              SnackBar(
//                content: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: [
//                    Text('Registration Failure'),
//                    Icon(Icons.error),
//                  ],
//                ),
//                backgroundColor: Colors.red,
//              ),
//            );
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(left: 30, right: 30, top: 0),
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Form(
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        "회원가입",
                        style: const TextStyle(
                          color: Color.fromRGBO(88, 88, 88, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Bold",
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 7),
                            child: TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 6.5),
                                labelText: '성(Last name)',
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                  color: const Color.fromRGBO(208, 208, 208, 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(112, 112, 112, 1)),
                                ),
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide(
//                                color: Color.fromRGBO(112, 112, 112, 1)))),
                                        color: Colors.amber)),
                                errorText:
                                    _lastNameValidError ? "필수 입력값 입니다." : null,
                              ),
                              autocorrect: false,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 7),
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(bottom: 6.5),

//                          suffixIcon: Icon(Icons.email),
                                labelText: '이름(First name)',
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                  color: const Color.fromRGBO(208, 208, 208, 1),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(112, 112, 112, 1)),
                                ),
                                errorText:
                                    _firstNameValidError ? "필수 입력값 입니다." : null,
                              ),
                              autocorrect: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        child: TextFormField(
                          controller: _nickNameController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 6.5),
                            labelText: '닉네임(한글 8자, 영문 및 숫자 16자)',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: const Color.fromRGBO(208, 208, 208, 1),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1)),
                            ),
                            errorText:
                                _nickNameValidError ? "필수 입력값 입니다." : null,
                          ),
                          autocorrect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 6.5),
                            labelText: '이메일',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: const Color.fromRGBO(208, 208, 208, 1),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1)),
                            ),
                            errorText:
                                _emailValidError ? "올바른 이메일 형식이 아닙니다" : null,
                          ),
                          autocorrect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        child: TextFormField(
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 6.5),
                            labelText: '비밀번호(8자리 이상)',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: const Color.fromRGBO(208, 208, 208, 1),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1)),
                            ),
                            errorText: _passwordValidError
                                ? "8자리 이상, 영문 소문자,숫자,영문 대문자를 포함해야 합니다."
                                : null,
                          ),
                          autocorrect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Container(
                        child: TextFormField(
                          obscureText: true,
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(bottom: 6.5),
                            labelText: '비밀번호 확인',
                            labelStyle: TextStyle(
                              fontSize: 13,
                              color: const Color.fromRGBO(208, 208, 208, 1),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(112, 112, 112, 1)),
                            ),
                            errorText: _confirmPasswordValidError
                                ? "비밀번호와 일치하지 않습니다."
                                : null,
                          ),
                          autocorrect: false,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.5),
                      child: RegisterAgreeForm(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: Color.fromRGBO(48, 190, 157, 1),
                        onPressed: () {
                          _onFormSubmitted();
                        },
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 11.0,
                            bottom: 12.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "시작하기!",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 13.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: Color.fromRGBO(141, 139, 139, 1),
                        onPressed: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 11.0,
                            bottom: 12.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "취소",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 13.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final RegExp _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)");

  RegExp _passwordRegExp =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^()]{8,25}');

  void _onFormSubmitted() {
    // TODO : validation add
    if (_lastNameController.text.isEmpty) {
      setState(() => _lastNameValidError = true);
    } else {
      setState(() => _lastNameValidError = false);
    }
    if (_firstNameController.text.isEmpty) {
      setState(() => _firstNameValidError = true);
    } else {
      setState(() => _firstNameValidError = false);
    }
    if (_nickNameController.text.isEmpty) {
      setState(() => _nickNameValidError = true);
    } else {
      setState(() => _nickNameValidError = false);
    }

    bool emailValid = _emailRegExp.hasMatch(_emailController.text);
    debugPrint("]-----] emailValid [-----[ $emailValid");
    if (_emailController.text.isEmpty || !emailValid) {
      setState(() => _emailValidError = true);
    } else {
      setState(() => _emailValidError = false);
    }

    bool passwordValid = _passwordRegExp.hasMatch(_passwordController.text);
    debugPrint(
        "]-----] passwordValid [-----[ ${_passwordRegExp.hasMatch(_passwordController.text)}");
    if (_passwordController.text.isEmpty || !passwordValid) {
      setState(() => _passwordValidError = true);
    } else {
      setState(() => _passwordValidError = false);
    }

    bool confirmPasswordValid =
        _passwordRegExp.hasMatch(_confirmPasswordController.text);
    if (_confirmPasswordController.text.isEmpty ||
        !confirmPasswordValid ||
        _passwordController.text != _confirmPasswordController.text) {
      setState(() => _confirmPasswordValidError = true);
    } else {
      setState(() => _confirmPasswordValidError = false);
    }
    if (!_lastNameValidError) {
      _registerBloc.add(
        Submitted(
          lastName: _lastNameController.text,
          firstName: _firstNameController.text,
          nickName: _nickNameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        ),
      );
    }
  }
}
