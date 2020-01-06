import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:with_flutter/authentication_bloc/bloc.dart';
import 'package:with_flutter/home/home_screen.dart';
import 'package:with_flutter/login/login.dart';
import 'package:with_flutter/register/register.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key key,
  }) : super(key: key);

  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  static final FlutterKakaoLogin kakaoSignIn = new FlutterKakaoLogin();

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Row(
                    children: <Widget>[
                      Text(state.failureMessage),
                    ],
                  ), Icon(Icons.error)],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                decoration:
                    BoxDecoration(color: Color.fromRGBO(048, 190, 157, 1)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
//                    height: 66.0,
                      child: Text(
                        "WITH",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr-Bold",
                            fontStyle: FontStyle.normal,
                            fontSize: 45.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "반갑습니다.",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr-Regular",
                            fontStyle: FontStyle.normal,
                            fontSize: 20.0,
                            letterSpacing: 0.1),
                      ),
                    ),
                    Text(
                      "여러분의 경력관리를 도와주는",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                          letterSpacing: 0.1),
                    ),
                    Text(
                      "위드입니다.",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.0,
                          letterSpacing: 0.1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
//                          focusedBorder: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(0.0),
                              ),
                              borderSide: BorderSide(color: Color(0xFFECECEC)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                              borderSide: BorderSide(color: Color(0xFFECECEC)),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.4),
                            contentPadding: EdgeInsets.only(
                                left: 11, bottom: 10, top: 10, right: 11),
                            hintText: '이메일',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 13.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 17.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
//                          focusedBorder: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(0.0),
                              ),
                              borderSide: BorderSide(color: Color(0xFFECECEC)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                              borderSide: BorderSide(color: Color(0xFFECECEC)),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.4),
                            contentPadding: EdgeInsets.only(
                                left: 11, bottom: 10, top: 10, right: 11),
                            hintText: '비밀번호',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 13.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(),
                        color: Color.fromRGBO(48, 124, 245, 1),
                        onPressed: () {
                          _onFormSubmitted();
//                          authenticationBloc.dispatch(LoggedOut());
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => HomeScreen()),
//                          );
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
                                  "로그인",
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
                        onPressed: () {
//                          authenticationBloc.dispatch(LoggedOut());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
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
                                  "회원가입",
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
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                            child: Text(
                          "또는",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Medium",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.0),
                        )),
                        Expanded(
                            child: Divider(
                              color: Colors.white,
                            ),
                            flex: 4),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image(
                            image:
                                AssetImage('assets/images/icons/sns-fb@3x.png'),
                            height: 51.0,
                            width: 51.0,
                          ),
                          Image(
                            image:
                                AssetImage('assets/images/icons/sns-nv@3x.png'),
                            height: 51.0,
                            width: 51.0,
                          ),
                          GestureDetector(
                            onTap: _login,
                            child: Image(
                              image: AssetImage(
                                  'assets/images/icons/sns-kk@3x.png'),
                              height: 51.0,
                              width: 51.0,
                            ),
                          ),
                          Image(
                            image:
                                AssetImage('assets/images/icons/sns-gg@3x.png'),
                            height: 51.0,
                            width: 51.0,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
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

//  void _onEmailChanged() {
//    _loginBloc.add(
//      EmailChanged(email: _emailController.text),
//    );
//  }
//
//  void _onPasswordChanged() {
//    _loginBloc.add(
//      PasswordChanged(password: _passwordController.text),
//    );
//  }

  void _onFormSubmitted() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('이메일 또는 비밀번호를 입력해 주세요.'),
          backgroundColor: Colors.red,
        ),
      );
    }
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  Future<Null> _login() async {
    print(']-----] kakaoSignIn call [-----[');
    final KakaoLoginResult result = await kakaoSignIn.logIn();
//    print(']-----] kakaoSignIn result [-----[ ${result}');
    _processLoginResult(result);
    if (result.account != null && result.status != KakaoLoginStatus.error) {
      final KakaoAccountResult account = result.account;
      _processAccountResult(account);
    }
  }

  void _processLoginResult(KakaoLoginResult result) {
    switch (result.status) {
      case KakaoLoginStatus.loggedIn:
        print('LoggedIn by the user.');

        break;
      case KakaoLoginStatus.loggedOut:
        print('LoggedOut by the user.');

        break;
      case KakaoLoginStatus.error:
        print('This is Kakao error message : ${result.errorMessage}');
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("카카오 로그인이 실패하였습니다."), Icon(Icons.error)],
              ),
              backgroundColor: Colors.red,
            ),
          );
        break;
    }
  }

  void _processAccountResult(KakaoAccountResult account) {
    if (account == null) {
//      _updateAccountMessage('');
    } else {
      final userID = (account.userID == null) ? 'None' : account.userID;
      final userEmail =
          (account.userEmail == null) ? 'None' : account.userEmail;
      final userPhoneNumber =
          (account.userPhoneNumber == null) ? 'None' : account.userPhoneNumber;
      final userDisplayID =
          (account.userDisplayID == null) ? 'None' : account.userDisplayID;
      final userNickname =
          (account.userNickname == null) ? 'None' : account.userNickname;
      final userProfileImagePath = (account.userProfileImagePath == null)
          ? 'None'
          : account.userProfileImagePath;
      final userThumbnailImagePath = (account.userThumbnailImagePath == null)
          ? 'None'
          : account.userThumbnailImagePath;
//      print(']-----] userID [-----[ $userID');
//      print(']-----] userEmail [-----[ $userEmail');
//      print(']-----] userPhoneNumber [-----[ $userPhoneNumber');
//      print(']-----] userDisplayID [-----[ $userDisplayID');
//      print(']-----] userNickname [-----[ $userNickname');
      if (userID.isNotEmpty) {
        _loginBloc.add(
          LoginWithKakaoPressed(
            email: userEmail,
            snsId: userID,
            snsType: "KAKAOTALK",
            snsToken: null,
            phoneNumber: userPhoneNumber,
            nickName: userNickname,
          ),
        );
      }

//      Scaffold.of(context)
//        ..hideCurrentSnackBar()
//        ..showSnackBar(
//          SnackBar(
//            content: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//                Text('$userEmail 님 로그인 되었습니다'),
////                CircularProgressIndicator(),
//              ],
//            ),
//          ),
//        );
    }
  }
}
