import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'dart:math';

class RegisterAgreeForm extends StatefulWidget {
  State<RegisterAgreeForm> createState() => _RegisterAgreeFormState();
}

class _RegisterAgreeFormState extends State<RegisterAgreeForm> {
  RegisterBloc _registerBloc;

  bool _agreeAll = false;
  bool _agreeService = false;
  bool _agreeSecurity = false;
  bool _agreeMarketing = false;

  String foos = 'One';
  int _key;

  void _collapse() {
    int newKey;
    do {
      _key = Random().nextInt(10000);
    } while (newKey == _key);
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _collapse();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {},
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                      child: Checkbox(
                        value: _agreeAll,
                        activeColor: Theme.of(context).primaryColor,
                        onChanged: (bool value) {
                          setState(() {
                            _agreeAll = value;
                            _agreeService = value;
                            _agreeSecurity = value;
                            _agreeMarketing = value;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "전체 약관 동의",
                        style: const TextStyle(
                            color: Color.fromRGBO(88, 88, 88, 1),
                            fontWeight: FontWeight.w400,
                            fontFamily: "NotoSansCJKkr-Medium",
                            fontStyle: FontStyle.normal,
                            fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    children: <Widget>[
                      ExpansionTile(
                          key: Key("agreeService"),
                          initiallyExpanded: false,
                          title: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                                child: Checkbox(
                                  value: _agreeService,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _agreeService = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "회원 가입 및 운영약관 동의 (필수)",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor:
                              Theme.of(context).accentColor.withOpacity(0.025),
                          children: [
                            ListTile(
                              title: Text('약관내용'),
                              onTap: () {},
                            ),
                          ]),
                      ExpansionTile(
                          key: Key("agreeSecurity"),
                          initiallyExpanded: false,
                          title: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                                child: Checkbox(
                                  value: _agreeSecurity,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _agreeSecurity = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "개인정보 수집 및 이용 동의 (필수)",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor:
                              Theme.of(context).accentColor.withOpacity(0.025),
                          children: [
                            ListTile(
                              title: Text('One'),
                              onTap: () {},
                            ),
                          ]),
                      ExpansionTile(
                          key: Key("agreeMarketing"),
                          initiallyExpanded: false,
                          title: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                                child: Checkbox(
                                  value: _agreeMarketing,
                                  activeColor: Theme.of(context).primaryColor,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _agreeMarketing = value;
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "마케팅 정보 수신 동의 (선택)",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.0),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor:
                              Theme.of(context).accentColor.withOpacity(0.025),
                          children: [
                            ListTile(
                              title: Text('One'),
                              onTap: () {},
                            ),
                          ]),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
