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

  _checkAll() {
    if (_agreeService && _agreeSecurity && _agreeMarketing) {
    } else {
      _agreeAll = true;
    }
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
                                      if (!value) {
                                        _agreeAll = false;
                                      }
                                      _agreeService = value;
//                                      _checkAll();
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
                            Container(
                              height: 200,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '제 1 조 (목적)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '본 약관은 주식회사 위플레이 라이트(이하 "회사")가 운영하는 어플리케이션(이하 "위드")에서 제공하는 인터넷 관련 서비스를 이용함에 있어, 위드와 회원 간의 이용 조건 및 제반 절차, 기타 필요한 사항을 규정함을 목적으로 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 2 조 (용어의 정의)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '이 약관에서 사용하는 용어의 정의는 아래와 같다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "위드"라 함은 회사가 서비스를 "회원"에게 제공하기 위하여 핸드폰, 컴퓨터 등 정보 통신 설비를 이용하여 설정한 가상의 영업장 또는 회사가 운영하는 어플리 케이션(회사가 동일한 서비스를 제공하기 위하여 운영하는 웹사이트 및 모바일 웹 등도 모두 포함한다)을 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "서비스"라 함은 회사가 운영하는 위드를 통해 개인이 등록한 자료를 관리하여 구단 및 기업 정보를 제공하는 서비스, 구직 등의 목적으로 등록하는 자료를 DB화하여 각각의 목적에 맞게 분류 가공, 집계하여 정보를 제공하는 서비스와 위드에서 제공하는 모든 부대 서비스를 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회원"이라 함은 회사에 개인정보를 제공하여 회원등록을 한 자로서, 회사의 정보를 지속적으로 제공받고 회사가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말하며, 서비스를 이용하기 위하여 동 약관에 동의하거나 카카오톡, 네이버, 구글, 페이스북 등 연동 된 서비스를 통해 "회사"와 이용 계약을 체결한 자를 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. “이용자”란 위드에 접속하여 이 약관에 따라 위드가 제공하는 서비스를 받는 회원 및 비회원을 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '5. "아이디"라 함은 회원의 식별과 회원의 서비스 이용을 위하여 "회원"이 가입 시 사용한 이메일 주소를 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '6. "비밀번호"라 함은 "회사"의 서비스를 이용하려는 사람이 아이디를 부여 받은 자와 동일인임을 확인하고 "회원"의 권익을 보호하기 위하여 "회원"이 선정한 문자와 숫자 또는 특수문자의 조합 또는 이와 동일한 용도로 쓰이는 “위드”에서 자동 생성된 인증코드를 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '7. "비회원"이라 함은 회원등록을 하지 않고 "회사"가 제공하는 서비스를 이용하는 자를 말한다. 비회원은 서비스 이용에 제한이 있을 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '8. “해지”란 회사 또는 회원이 서비스 이용 계약을 장래에 대하여 종료시키는 행위를 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '9. “파트너”란 회사와 전략적으로 제휴를 맺은 업체를 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '10. “WIKEN”이란 회사가 블록체인의 스마트 컨트랙트를 통해 발행한 토큰을 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 3 조 (약관의 명시와 개정)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처 등을 "회원"이 알 수 있도록 초기 화면에 게시하거나 기타의 방법으로 "회원"에게 공지해야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회사"는 약관의 규제 등에 관한 법률, 전자문서 및 전자거래기본법, 전자서명법, 전기통신기본법, 전기통신사업법, 전자금융거래법, 전자상거래 등에서의 소비자보호에 관한 법률, 정보통신망이용촉진 및 정보보호 등에관한법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지한다. 단 "회원"의 권리, 의무에 중대한 영향을 주는 변경의 경우에는 적용일자 30일 전부터 공지하도록 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. "회원"은 변경된 약관에 대해 거부할 권리가 있다. "회원"은 변경된 약관이 공지된 지 15일 이내에 거부의사를 표명할 수 있다. "회원"이 거부하는 경우 본 서비스 제공자인 "회사"는 15일의 기간을 정하여 "회원"에게 사전 통지 후 당해 "회원"과의 계약을 해지할 수 있다. 만약, "회원"이 거부의사를 표시하지 않거나, 전항에 따라 시행일 이후에 "서비스"를 이용하는 경우에는 동의한 것으로 간주한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 4 조 (약관의 해석)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. 이 약관에서 규정하지 않은 사항에 관해서는 약관의규제등에관한법률, 전기통신기본법, 전기통신사업법, 정보통신망이용촉진등에관한법률 등의 관계법령에 따른다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회원"이 "회사"와 개별 계약을 체결하여 서비스를 이용하는 경우에는 개별 계약이 우선한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 5 조 (이용계약의 성립)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"의 서비스 이용계약(이하 "이용계약")은 서비스를 이용하고자 하는 자가 본 약관과 개인정보취급방침을 읽고 "동의" 또는 "확인" 버튼을 누른 경우 본 약관에 동의한 것으로 간주한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 제1항 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있다. "회원"은 본인인증에 필요한 이름, 생년월일, 연락처 등을 제공하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회원"이 이용신청(회원가입 신청) 작성 후에 "회사"가 웹 상의 안내 및 전자메일로 "회원"에게 통지함으로써 이용계약이 성립된다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. 카카오톡 등 외부서비스와의 연동을 통해 이용계약을 신청할경우, 본 약관과 개인정보취급방침, 서비스 제공을 위해 “회사”가 “회원”의 외부 서비스 계정 정보 접근 및 활용에 “동의” 또는 “확인”버튼을 누르면 “회사”가 웹 상의 안내 및 전자메일로 “회원”에게 통지함으로써 이용계약이 성립된다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 6 조 (이용신청의 승낙과 제한)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"는 전조의 규정에 의한 이용신청 고객에 대하여 업무수행 상 또는 기술상 지장이 없는 경우에는 원칙적으로 접수 순서에 따라 서비스 이용을 승낙한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회사"는 아래 사항에 해당하는 경우에 대해서는 이용 신청을 승낙하지 아니하며, 추후 아래 사항에 해당함이 확인된 경우 “회사”는 이용계약을 해지할 수 있으며, 미성년자가 서비스를 이용하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 개별 서비스 이용 계약을 취소할 수 있다는 내용을 고지하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 실명이 아니거나 타인의 명의를 이용하여 신청한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 이용계약 신청서의 내용을 허위로 기재한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '다. 만 14세 미만의 개인 또는 사업자가 신청한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '라. 회원의 거주지에서 효력이 있는 대한민국 외의 법률에 따라 본 서비스 이용행위가 해당 법률이 위반을 구성하거나 현저한 위험이 있는 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '마. 기타 이 약관에 위배되거나 위법 또는 부당한 이용신청임이 확인된 경우 및 회사가 합리적인 판단에 이하여 필요하다고 인정하는 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회사"는 아래 사항에 해당하는 경우에는 그 신청에 대하여 승낙 제한 사유가 해소될 때까지 승낙을 유보할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. "회사"가 설비의 여유가 없는 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. "회사"의 기술상 지장이 있는 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '다. 기타"회사"의 귀책사유로 이용승낙이 곤란한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. 위 각 항에 위반된 회원가입사실이 확인된 경우 당해 회원은 법적 보호를 받을 수 없으며 이에 따른 민, 형사상책임을 부담한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 7 조 (서비스의 내용)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"는 제2조 2항의 서비스를 제공할 수 있으며 그 내용은 다음 각호와 같다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 구단, 기업의 구인정보 등록과 조회서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 구단, 기업 정보조회와 관련된 제반서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '다. 이용자 간의 교류와 소통에 관련한 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '마. 프로필 등록 및 이력서 게재 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '바. 온라인 입사 및 스카우팅지원 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '사. 에이전트 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '아. 구인/구직과 관련된 제반 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '자. 교육과 관련된 제반 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '차. 자료거래에 관련한 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '카. 광고 집행 및 프로모션 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '하. 기타 "회사"가 추가 개발하거나 제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2."회사"는 필요한 경우 서비스의 내용을 추가 또는 변경 할 수 있다. 단, 이 경우 "회사"는 추가 또는 변경내용을 "회원"에게 회원등록시 제공한 이메일로 공지해야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. 불특정다수의 회원에 대한 통지는 초기서비스화면, 푸시알람 혹은 게시판에 공지함으로써 제2항의 공지에 갈음할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 8 조 (서비스 이용시간)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"는 특별한 사유가 없는 한 연중무휴, 1일 24시간 서비스를 제공한다. 다만, "회사"는 서비스의 종류나 성질에 따라 제공하는 서비스 중 일부에 대해서는 별도로 이용시간을 정할 수 있으며, 이 경우 "회사"는 그 이용시간을 사전에 "회원"에게 공지 또는 통지하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회사"는 자료의 가공과 갱신을 위한 시스템 작업시간, 장애해결을 위한 보수작업 시간, 회선 장애 등이 발생한 경우 일시적으로 서비스를 중단할 수 있으며 계획된 작업의 경우 공지란에 서비스 중단 시간과 작업 내용을 알려야 한다. 다만, "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 9조 ("회원" 정보, 이력서 노출)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회원"의 이력서는 개인이 회원가입 또는 프로필 작성 및 수정시 희망한 내용을 바탕으로 노출된다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회사"는 "회원"이 회원정보, 이력서의 공개/비공개 지정, 이력서상의 연락처 공개/비공개를 자유롭게 선택할 수 있도록 하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회사"는 "회원"이 이력서 공개를 희망했을 경우, 기업회원의 이력서 열람에 동의한것으로 간주하며 "회사"는 이들 회원에게 무료/유료로 이력서 열람 서비스를 제공할 수 있다. 다만, 연락처 각 항목이 비공개로 지정된 경우 해당 항목별 연락처를 노출할 수 없다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. "회사"는 안정적인 서비스를 제공하기 위해 테스트 및 모니터링 용도로 "위드" 운영자가 이력서 정보를 열람하도록 할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 10조 (제휴를 통한 서비스)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"는 제휴 관계를 체결한 여타 인터넷 웹 사이트 및 축구대회 또는 신문, 잡지 등의 오프라인 매체를 통해 위드에 등록한 "회원"의 이력서 정보가 열람될 수 있도록 서비스를 제공할 수 있다. 단, 제휴 서비스를 통해 노출되는 이력서의 연락처 정보는 제9조의 각 항에 따른다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회사"는 제휴를 통해 타 사이트 및 매체에 등록될 수 있음을 고지해야 하며, 제휴 사이트 목록을 위드내에서 상시 열람할 수 있도록 해야 한다. 단, 등록의 형태가 "회사"가 직접 구축하지 않고, 제휴사가 csv 또는 DB 형태로 "회사"로부터 제공 받아 구축한 매체 목록은 본 약관외 별도의 제휴리스트에서 열람할 수 있도록 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회사"는 위드와 제휴를 통해 "회원"이 공개를 요청한 이력서에 한해 이력서 정보를 제공한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. 본조 제3호 제휴를 통한 위드의 변동사항 발생시 공지사항을 통해 고지 후 진행한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 11 조 (서비스의 요금)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회원" 가입은 무료이다. 다만 기업회원 또는 위드에 방문한 기업체에게 자신의 이력서 정보를 보다 효과적으로 노출시키기 위한 유료서비스 및 프로필 및 동영상 위드 공식 인증서 발급 등 회원 가입 목적 외 기타 서비스를 이용하기 위한 별도의 서비스는 유료로 제공될 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회사"는 유료서비스를 제공할 경우 위드에 요금에 대해서 공지를 하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회사"는 유료서비스 이용금액을 서비스의 종류 및 기간에 따라 "회사"가 예고 없이 변경할 수 있다. 다만, 변경 이전에 적용 또는 계약한 금액은 소급하여 적용하지 아니한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. 유료 서비스 신청 후 "회원" 사정에 의해 서비스가 취소될 경우, 정부가 고시하는 "디지털콘텐츠 이용자보호지침"에 따라 "회사"는 본 지침이 제시하는 범위 내에서 환불 수수료를 부과할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 12 조 (토큰 규정)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. “WIKEN”은 [프로필 페이지]의 정보를 등재하는 것 등의 사유로 적립된다. 적립된 “WIKEN” 은 유료상품 결제, [피드 페이지] 게시글 열람, 스카우팅 및 리쿠르팅 정보 열람 시 사용할 수 있으며, 현금으로 출금되지 않는다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 위의 적립 사유가 해제되었을 경우, ‘적립된 “WIKEN”’을 회원 보유분에서 차감한다. 블록체인의 특성상 한번 지불된 “WIKEN”은 회수될 수 없다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. 서비스 운영 정책에 따라 “WIKEN”의 상품별 적립기준, 적립비율, 사용조건 및 제한 등은 달라질 수 있으며, 이에 대한 사항은 서비스 화면에 게시하거나 통지한다. “WIKEN”적립 시 별도의 유효기간을 정한 바가 없으면 적립 일로부터 12개월의 유효기간을 보장한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 13조 (서비스 제공의 중지)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"는 다음 각호에 해당하는 경우 서비스의 제공을 중지할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 설비의 보수 등 "회사"의 필요에 의해 사전에 "회원"들에게 통지한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 기간통신사업자가 전기통신서비스 제공을 중지하는 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '다. 기타 불가항력적인 사유에 의해 서비스 제공이 객관적으로 불가능한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 본조 제1항의 경우, 회사는 회원 또는 제3자가 입은 손해에 대하여 배상하지 않는다. 단, 회사의 고의 또는 중과실이 있는 경우에는 그러하지 아니하다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 14 조 (정보의 제공 및 광고의 게재)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"는 "회원"에게 서비스 이용에 필요가 있다고 인정되거나 서비스 개선 및 회원대상의 서비스 소개 등의 목적으로 하는 각종 정보에 대해서 전자우편이나 서신우편을 이용한 방법으로 제공할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회사"는 제공하는 서비스와 관련되는 정보 또는 광고를 서비스 화면, 홈페이지 등에 게재할 수 있으며, 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "회사"에게 할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회사"는 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 "회원"이 참여하거나 교신 또는 거래를 함으로써 발생하는 모든 손실과 손해에 대해 책임을 지지 않는다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. 본 서비스의 "회원"은 서비스 이용시 노출되는 광고게재에 대해 동의하는 것으로 간주한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 15조 (콘텐츠의 책임과 "회사"의 정보 수정 권한)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. 콘텐츠는 "회원"이 등록한 개인정보 및 이력서와 위드에 게시한 게시물을 말한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회원"은 콘텐츠를 사실에 근거하여 성실하게 작성해야 하며, “회원” 본인이 작성하는 것을 원칙으로 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회사"는 "회원"이 작성한 콘텐츠를 검토하여 “콘텐츠 삭제 규칙”및 제18조의 회원의 의무로 명시된 조건에 문제가 없을 경우 “위드”에 게시하는 방식의 필터링 작업을 수행하며, 이 작업에서 “콘텐츠 삭제 규칙” 및 회원의 의무 위반으로 판단되어 게시가 허락되지 않을 경우 “회원”에게 사전 통보 없이 “위드”에 게시되지 않는다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. 콘텐츠 내용에 오자, 탈자 또는 사회적 통념에 어긋나는 문구와 내용, 명백하게 허위의 사실에 기초한 내용이 있을 경우 “회사”는 이를 언제든지 삭제하거나 수정할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '5. "회원"이 등록한 자료로 인해 타인(또는 타법인)으로부터 저작권 등 권리 침해, 허위사실 및 명예훼손 등으로 삭제 요청이 접수된 경우 "회사"는 "회원"에게 사전 통지 없이 본 자료를 삭제 혹은 비노출 처리 할 수 있으며, 삭제 혹은 비노출 처리 후 메일 등의 방법으로 통지할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 16 조 (콘텐츠의 권한 및 활용)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회원"이 입력한 콘텐츠는 부분적으로 익명으로 공개될 수 있으며, 모든 콘텐츠는 게시와 동시에 “회사”가 해당 “회원”에 대한 위드 서비스 제공을 위하여 “회원”이 게시한 콘텐츠의 전부 또는 일부를 그대로 또는 편집, 가공, 수정, 삭제, 추가 등(이하 “편집 등”)을 거쳐 복제, 전송, 공중송신, 2차적저작물작성 등의 방법으로 이용할 수 있는 권리를 획득하게 된다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2.“회원”이 입력한 콘텐츠는 스카우팅 현황 및 관련 동향의 통계자료로 활용될 수 있고 그 자료는 매체를 통해 언론에 배포될 수 있다. 단, 활용되는 정보에는 개인을 식별할 수 있는 개인정보는 제외한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "위드"에서 정당한 절차를 거쳐 기업회원이 열람한 "회원"의 이력서 정보는 해당 기업의 인사자료이며 이에 대한 관리 권한은 해당 기업의 정책에 의한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. "회사"는 "위드"의 온라인 지원 시스템을 통해 지원한 "회원"의 이력서 열람 여부 및 기업회원이 제공한 채용정보에 입사지원한 구직자들의 각종 통계데이터를 "회원"에게 제공할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 17 조 ("회사"의 의무)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"는 본 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다해야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회사"는 서비스와 관련한 "회원"의 불만사항이 접수되는 경우 이를 즉시 처리하여야 하며, 즉시 처리가 곤란한 경우에는 그 사유와 처리일정을 서비스 화면 또는 기타 방법을 통해 동 "회원"에게 통지하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. 천재지변 등 예측하지 못한 일이 발생하거나 시스템의 장애가 발생하여 서비스가 중단될 경우 이에 대한 손해에 대해서는 "회사"가 책임을 지지 않는다. 다만 자료의 복구나 정상적인 서비스 지원이 되도록 최선을 다할 의무를 진다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. "회사"는 유료 결제와 관련한 결제 사항 정보를 1년 이상 보존한다. 다만 회원 자격이 없는 회원은 예외로 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 18 조 (회원의 의무)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회원"은 관계법령과 본 약관의 규정 및 기타 "회사"가 통지하는 사항을 준수하여야 하며, 기타 "회사"의 업무에 방해되는 행위를 해서는 안 된다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회원"은 서비스를 이용하여 얻은 정보를 "회사"의 사전동의 없이 복사, 복제, 번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. "회원"은 본 서비스를 기업정보 확인 및 건전한 취업 이외의 목적으로 사용해서는 안되며 이용 중 다음 각 호의 행위를 해서는 안 된다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 다른 회원의 아이디 또는 개인정보, 콘텐츠를 부정 사용하는 행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '다. 타인의 명예를 훼손하거나 모욕하는 행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '라. 타인의 지적재산권 등의 권리를 침해하는 행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '마. 해킹행위 또는 바이러스의 유포 행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '바. 타인의 의사에 반하여 광고성 정보등 일정한 내용을 계속적으로 전송하는 행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '사. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있다고 판단되는 행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '아. 위드의 정보 및 서비스를 이용한 영리행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '자. 그밖에 선량한 풍속, 기타 사회질서를 해하거나 관계법령에 위반하는 행위',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. "회원"이 신청한 유료서비스는 등록 또는 신청과 동시에 "회사"와 채권, 채무 관계가 발생하며, "회원"은 이에 대한 요금을 지정한 기일 내에 납부하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 19조 (이용계약 해지 및 회원탈퇴와 회원자격 상실)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. 회원은 회사에 언제든지 이용계약 해지 또는 회원 탈퇴를 요청할 수 있으며, 이용계약 해지 및 탈퇴 요청은 with.official@projectwith.io를 통해 할 수 있으며 탈퇴 요청은 이용계약 해지 의사 통지로 간주된다. 다만, 탈퇴 요청 통지하기 전에 탈퇴 시점 당시 진행 중인 모든 서비스 관련 법률행위를 철회 또는 취소하여야 하며, 법률행위의 취소 또는 철회로 인한 불이익은 회원 본인이 부담하여야 하며, 회사는 일절 책임을 지지 않는다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 회원이 회원탈퇴를 하는 경우 작성한 게시물 및 “회사”가 서비스를 위하여 편집 등을 한 콘텐츠는 이 약관 제16조 제1항에 근거하여 삭제되지 않으며, 전호에 따라 탈퇴 요청한 회원이 행한 의사표시로 인해 발생한 불이익에 대한 책임은 회원 본인 부담으로 하며, 이용계약 해지 또는 탈퇴 요청을 통지한 시점부터 회원자격을 상실하게 되고, 이용계약이 해지 또는 탈퇴로 종료되면 회사는 회원에게 부가적으로 제공한 각종 혜택을 회수할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. 회사는 회원이 이 약관 및 개별서비스 이용약관을 위반한 경우 경고, 일시적 이용정지, 영구적 이용정지 등의 단계로 서비스 이용을 제한하거나 이용계약을 해지할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. 회원은 제 3항에 따른 서비스 이용정지 기타 서비스이용과 관련된 이용제한에 대한 회사가 정한 절차에 따라 이의신청을 할 수 있으며, 회사는 회원의 이의신청이 정당하다고 판단되는 경우 즉시 서비스이용을 재개한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '5. 회원의 의사로 이용계약을 해지하거나 탈퇴한 후, 추후 재이용을 희망할 경우에는 재이용 의사가 회사에 통지되고, 이에 대한 회사의 승낙이 있는 경우에만 서비스 재이용이 가능하다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제20조(회사의 해지로 인한 이용계약 종료)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. 회사는 다음과 같은 사유가 발생하거나 확인된 경우 이용계약을 해지할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 다른 회원 또는 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 대한민국 법령 또는 공서양속에 위배되는 행위를 한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 회사가 제공하는 서비스의 원활한 진행을 방해하는 행위를 하거나 시도한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '다. 제6조 제2항의 승낙거부사유가 있음이 확인된 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '라. 비실명으로 회원등록을 한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '마. 회원의 나이가 만 14세 미만으로 확인된 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '바. 다른 회원의 ID를 부정하게 사용한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '사. 범죄와 결부된다고 객관적으로 판단되는 행위를 한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '아. 회사가 제공하는 서비스의 원활한 진행을 방해하는 행위를 하거나 시도한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '자. 본 약관의 내용을 위반한 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '차. 일정기간 이상 사용하지 않아, 개인정보보호를 위해서 필요하다고 판단되는 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '카. 기타 회사가 합리적인 판단에 기하여 서비스의 제공을 거부할 필요가 있다고 인정할 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 회사가 해지를 하는 경우 회사는 회원에게 e-mail, 전화, 기타의 방법을 통하여 해지사유를 밝혀 해지의사를 통지합니다. 이용계약은 회사의 해지의사를 회원에게 통지한 시점에 종료됩니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. 본 항에 의하여 회사가 이용계약을 해지하더라도, 해지 이전에 이미 체결된 서비스 관련 회원과 타 회원 등과의 각종 계약의 완결과 관련해서는 이 약관이 계속 적용됩니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '5. 본 항에서 정한 바에 따라 이용계약이 종료될 시에는 회사는 회원에게 부가적으로 제공한 각종 혜택을 회수할 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '6. 본 항에서 정한 바에 따라 이용계약이 종료된 경우에는, 회원의 재이용신청에 대하여 회사는 이에 대한 승낙을 거절할 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 21조 (손해배상)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"가 "회원"에게 손해를 입히거나 기타 "회사"가 제공하는 모든 서비스와 관련하여 "회사"의 책임있는 사유로 인해 이용자에게 손해가 발생한 경우 "회사"는 그 손해를 배상하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. "회원"이 이 약관의 규정에 위반한 행위로 "회사" 및 제3자에게 손해를 입히거나 "회원"의 책임 있는 사유에 의해 "회사" 및 제3자에게 손해를 입힌 경우에는 "회원"은 그 손해를 배상하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. 타 회원(개인회원, 기업회원 모두 포함)의 귀책사유로 "회원"의 손해가 발생한 경우 "회사"는 이에 대한 배상 책임이 없다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 22 조 ("회원"의 개인정보보호)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"회사"는 "회원"의 개인정보보호를 위하여 노력해야 한다. "회원"의 개인정보보호에 관해서는 정보통신망이용촉진 및 정보보호 등에 관한 법률에 따르고, "위드"에 "개인정보처리방침"을 고지한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 23조 (이용요금 오류의 조정)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"회사"는 이용요금과 관련하여 오류가 있는 경우에 "회원"의 요청, 또는 "회사"의 사전 통지에 의하여 다음에 해당하는 조치를 취한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 제12조 1항에 따라 “회원”에게 지급되어야 할 “WIKEN”이 지급되지 않았을 경우 “회사”는 “회원”이 동의할 경우 “회원”에게 “WIKEN”을 지급한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 과다 납입한 “WIKEN”에 대하여는 그 “WIKEN”을 반환한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 24 조 (신용정보의 제공 활용 동의)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"가 회원가입과 관련하여 취득한 "회원"의 개인신용정보를 타인에게 제공하거나 활용하고자 할 때에는 신용정보의 이용 및 보호에 관한 법률 제23조의 규정에 따라 사전에 그 사유 및 해당기관 또는 업체명 등을 밝히고 해당 "회원"의 동의를 얻어야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 본 서비스와 관련하여 "회사"가 "회원"으로부터 신용정보의 이용 및 보호에 관한 법률에 따라 타인에게 제공 활용에 동의를 얻은 경우 "회원"은 "회사"가 신용정보 사업자 또는 신용정보 집중기관에 정보를 제공하여 "회원"의 신용을 판단하기 위한 자료로 활용하거나, 공공기관에서 정책자료로 활용되도록 정보를 제공하는 데 동의한 것으로 간주한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제 25 조 (분쟁의 해결)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Bold",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. "회사"와 "회원"은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 전항의 노력에도 불구하고, 동 분쟁에 관한 소송발생시 적용법률은 대한민국법으로 하고 소송은 민사소송법상 의 관할에  의한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제26조(기타 조항)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. 회사는 필요한 경우 특정 서비스(혹은 그 일부)를 서비스 초기화면에 미리 공지한 후 일시적 또는 영구적으로 수정하거나 중단할 수 있다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 회사와 회원은 상대방의 명백한 동의 없이 이 약관상의 권리와 의무를 제3자에게 양도할 수 없다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. 이 약관과 관련하여 당사자 간의 합의에 의하여 추가로 작성된 계약서, 협정서, 통보서 등과 회사의 정책변경, 법령의 개정, 제정 또는 공공기관의 고시, 지침 등에 의하여 회사가 위드를 통해 회원에게 공지하는 내용도 본 약관의 일부를 구성한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '부칙',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '제1조(적용일자)',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '이 약관은 2019년 12월 16일부터 시행한다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                  ],
                                ),
                              ),
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
                                      if (!value) {
                                        _agreeAll = false;
                                      }
                                      _agreeSecurity = value;
//                                      _checkAll();
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
                            Container(
                              height: 200,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '- ㈜ 위플레이라이트(이하 “회사”)는 이용자의 개인정보를 안전하게 보호하기 위하여 최선의 노력을 다하고 있으며, 개인정보보호관련 법규 및 정부기관의 가이드라인을 준수하고 있습니다.  회원 가입시 그리고 홈페이지(www.projectwith.io) 또는 위드 애플리케이션(이하 통칭 "위드") 방문 시에 수시로 확인하여 주시기 바랍니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '- 회사는 개인정보 처리방침을 통하여 이용자의 개인정보가 어떻게 이용되고 있고, 이용 시 어떠한 보호조치가 취해지고 있는지 알려드립니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '- 개인정보 처리방침은 법령의 변경이나 보다 나은 서비스의 제공을 위하여 내용이 변경될 수 있습니다. 이 경우 회사는 홈페이지 및 위드 공지사항 또는 이메일을 통해서 공지하고 있습니다. 개인정보 처리방침은 회사 홈페이지 첫 화면의 맨 아래에 굵은 글씨로 표시되어 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '개인정보 처리방침과 이용 약관의 개인정보 관련한 내용의 경우 이용약관이 우선 순위를 갖습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1. 개인정보의 수집 및 이용목적',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '회사는 다음 목적을 위하여 개인정보를 수집하고 있으며 다음 목적 이외의 용도로는 수집한 개인정보를 이용하지 않습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1) 회원관리',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '회원제 서비스 이용에 따른 본인확인, 본인의 의사확인, 고객문의에 대한 응답, 새로운 정보의 소개 및 고지사항 전달',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2) 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '본인인증, 채용정보 매칭 및 컨텐츠 제공을 위한 개인식별, 회원간의 상호 연락, 구매 및 요금 결제, 물품 및 증빙발송, 부정 이용방지와 비인가 사용방지',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3) 서비스 개발 및 마케팅ㆍ광고 활용',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '맞춤 서비스 제공, 서비스 안내 및 이용권유, 서비스 개선 및 신규 서비스 개발을 위한 통계 및 접속빈도 파악, 통계학적 특성에 따른 광고 게재, 이벤트 정보 및 참여기회 제공',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4) 고용 및 스카우팅동향 파악을 위한 통계학적 분석, 서비스 고도화를 위한 데이터 분석',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2. 수집하는 개인정보 항목 및 수집방법',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 수집하는 개인정보의 항목',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1) 회원가입시 수집하는 항목',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '① 개인 회원',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '필수항목: 이름, 닉네임, 비밀번호, e-메일, 카카오톡, 페이스북, 네이버, 구글 등 외부 서비스와의 연동을 통해 이용자가 설정한 계정 정보',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '선택항목: 전화번호, 프로필 사진, 회원이 등재하는 하이라이트 영상',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '② 기업 회원',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '필수항목: 가입자명, 중복가입확인정보(DI), 비밀번호, 전화번호, e-메일, 사업자등록번호, 회사명, 회사주소, 직책 또는 팀, 설립연도, 산업군, 직원수, 매출액 또는 투자금액, 회사/서비스 소개',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2) 유료 정보 이용 시 수집하는 항목',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '토큰 결제 시 : 전화번호, 외부 지갑 서비스와의 연동을 위해 이용자가 설정한 계정 정보',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3) 모바일 서비스 이용 시 수집되는 항목',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '모바일 서비스의 특성상 단말기 모델 정보가 수집될 수 있으나, 이는 개인을 식별할 수 없는 형태입니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4) 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      'IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록, 광고 ID, (검색 키워드, 페이스북 - 좋아요 및 북마크 정보, 채용정보 조회) 접속 환경',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 개인정보 수집방법',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '홈페이지, 서비스 이용, 이벤트 응모, 팩스, 우편, 전화, 고객센터 문의하기',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3. 개인정보의 제공 및 처리위탁 및 국외이전',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"회사"는 개인정보를 1. 개인정보의 수집 및 이용목적에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이 동 범위를 초과하여 이용하지 않습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 처리 위탁',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"회사"는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 변동사항 발생 시 공지사항 또는 개인정보취급방침을 통해 고지하도록 하겠습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '수탁업체	위탁업무내용	개인정보 이용기간',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      'Amazon Web Service',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '회원 개인정보 보관을 위한 데이터센터 제공 및 보안 솔루션	2019. 12. 16 ~ 2020. 12. 16',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 다음의 경우에는 합당한 절차를 통한 이용자의 동의를 얻어 개인정보를 제공 또는 이용할 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1) 제휴관계: 본 개인정보취급방침 시행일 현재 아래와 같이 개인회원의 개인정보를 제공하는 제휴관계가 있으며, 제휴를 통한 변동사항 발생 시 사전공지 합니다. 이 경우 개별적인 동의를 구하는 절차를 거치며, 동의가 없는 경우에는 제공하지 않습니다. 단, 기업회원은 기업회원 약관 제 9조에 따릅니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '개인정보를 제공받는자	개인정보를 제공받는 자의 개인정보 이용 목적	제공하는 개인정보의 항목	개인정보를 제공받는 자의 개인정보 보유 및 이용 기간',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '위드 재팬	일본내 서비스 제공	제2조 가. 1) 2)	회원 탈퇴시 혹은 제휴계약 종료시까지',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2) 매각, 인수합병: 서비스 제공자의 권리, 의무가 승계 또는 이전되는 경우 이를 반드시 사전에 고지하며 이용자의 개인정보에 대한 동의철회의 선택권을 부여합니다',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3) 다만, 아래의 경우에는 예외로 합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '관계법령에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4. 개인정보의 보유 및 이용기간',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"위드"는 회원가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다.개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되거나 이용기간이 종료한 경우 개인정보를 지체 없이 파기합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '단, 다음의 경우에 대해서는 각각 명시한 이유와 기간 동안 보존합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1) 상법 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 법령에서 규정한 보존기간 동안 거래내역과 최소한의 기본정보를 보유합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '① 계약 또는 청약철회 등에 관한 기록: 5년',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '② 대금결제 및 재화 등의 공급에 관한 기록: 5년',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '③ 소비자의 불만 또는 분쟁처리에 관한 기록: 3년',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '④ 부정이용 등에 관한 기록: 5년',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '⑤ 웹사이트 방문기록(로그인 기록, 접속기록): 1년',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2) 회원 탈퇴 요청 시, 회사는 탈퇴처리와 동시에 지체 없이 개인정보를 파기하는 것을 원칙으로 합니다. 단, 회사를 통한 지원 이력이 있는 회원의 탈퇴 시, 회사는 다음과 같은 보존 이유로 탈퇴 후 5년 동안 지원내역 및 지원 내역과 관련된 개인정보를 보관합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '① 회사를 통해 스카우팅 및 취업이 완료되었음에도 기업 및 구단과의 담합을 통해 취업 사실을 공유하지않고 기업의 부정이용에 동참하는 것 방지.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '② 회사의 서비스 제공에 관한 기업과의 계약 이행을 완료하기 위해 회원의 지원정보를 보관할 필요가 있음',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3) 보유기간을 미리 공지하고 그 보유기간이 경과하지 아니한 경우와 개별적으로 동의를 받은 경우에는 약정한 기간 동안 보유합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4) 개인정보보호를 위하여 이용자가 1년 동안 "위드"를 이용하지 않은 경우, 이메일(또는 페이스북 등 외부 서비스와의 연동을 통해 이용자가 설정한 계정 정보)를 "휴면계정"로분리하여 해당 계정의 이용을 중지할 수 있습니다. 이 경우"회사"는 "휴면계정 처리 예정일"로부터 30일 이전에 해당사실을 전자메일, 서면, SMS 중 하나의 방법으로 사전통지하며 이용자가 직접 본인확인을 거쳐, 다시 "위드" 이용 의사표시를 한 경우에는 "위드" 이용이 가능합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '5. 개인정보 파기절차 및 파기방법',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. "회사"의 개인정보 파기절차 및 방법은 다음과 같습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1) 파기절차',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련법령에 의해 정보보호 사유에 따라 일정 기간 저장된 후 파기됩니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2) 파기방법',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통해 파기합니다. 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '6. 개인정보 자동 수집 장치의 설치, 운영 및 거부에 관한 사항',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1) 쿠키란',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에 보내는 작은 텍스트 파일로 이용자의 하드디스크에 저장됩니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2) 쿠키의 사용 목적',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"위드"가 쿠키를 통해 수집하는 정보는 2. 수집하는 개인정보 항목 및 수집방법 과 같으며 1. 개인정보의 수집 및 이용목적 외의 용도로는 이용되지 않습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3) 쿠키 설치, 운영 및 거부',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)은 다음과 같습니다. 예)웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '단, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 일부 서비스 이용에 어려움이 있을 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '6. 회원의 권리와 그 행사 방법',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 이용자는 언제든지 회사에 대하여 이용자의 개인정보를 조회하거나 수정할 수 있으며 회원 탈퇴 절차를 통하여 개인정보 이용에 대한 동의 등을 철회할 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 개인정보의 조회/수정을 위해서는 위드의 [프로필페이지]에서 확인 가능하며, 회원 탈퇴(동의 철회)는 [프로필페이지]내의 [설정] 항목 하단의 "회원 탈퇴"를 통하여 탈퇴하실 수 있습니다. 이 외에도 회사의 고객센터 및 개인정보 보호책임자에게 서면, 전화 또는 이메일로 연락하여 열람/정정/삭제/처리정지 등을 요청하실 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '다. 이용자의 개인정보 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 개인정보를 이용 또는 제공하지 않습니다. 그리고 이용자의 요청에 의해 해지 또는 삭제된 개인정보는 『4. 개인정보의 보유 및 이용기간』에 명시된 바에 따라 취급하고 그 외의 용도로 열람 또는 이용할 수 없도록 조치하고 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '라. 만 14세 이상인 경우에만 회원가입이 가능하며 개인정보의 수집/이용에 법정대리인의 동의가 필요한 만 14세 미만 아동의 개인정보는 원칙적으로 수집하지 않습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '라. 가항에 따른 권리 행사는 이용자의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '마. 개인정보 열람 및 처리 정지 요구는 개인정보보호법 제35조 제4항, 동 시행령 제42조 제1항에 의하여 이용자의 권리가 제한 될 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '바. 개인정보의 수정/정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '사. 회사는 이용자의 권리에 따른 열람의 요구, 정정.삭제의 요구, 처리 정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '7. 회원의 의무',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '가. 이용자는 자신의 개인정보를 보호할 의무가 있으며, 이용자 본인의 부주의 등으로 개인정보가 유출되어 발생한 문제에 대해서는 회사는 일체의 책임을 지지 않습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '나. 이용자의 개인정보를 최신의 상태로 정확하게 입력하시기 바랍니다. 이용자의 부정확한 정보입력으로 발생하는 문제의 책임은 이용자 본인에게 있으며, 타인의 개인정보를 도용하여 회원가입 또는 서비스 이용 시 회원자격 상실과 함께 개인정보에 관한 법률에 의거하여 처벌될 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '다. 이용자는 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 아이디, 비밀번호를 포함한 이용자의 개인정보가 유출되지 않도록 조심하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '라. 이용자는 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보보호법』 등 기타 개인정보에 관한 법률을 준수하여야 합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '8. 개인정보의 기술적, 관리적, 물리적 보호대책',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '1) 개인정보 암호화',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '이용자의 개인정보는 비밀번호에 의해 보호되며, 파일 및 각종 데이터는 암호화하거나 파일 잠금 기능을 통해 별도의 보안기능을 통해 보호하고 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '2) 해킹 등에 대비한 대책',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '모든 데이터가 고도의 보안이 유지되는 데이터 센터에 보관되고 있습니다. 개인정보 데이터의 접근을 사용 권한을 나눠 제한하고 있으며, 개인PC나 외부 침입이 우려되는 오프라인 공간에 저장하지 않습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '3) 개인정보 처리 직원의 교육',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '개인정보관련 처리 직원은 최소한의 인원으로 구성되며, 새로운 보안기술 습득 및 개인정보보호 의무에 관해 정기적인 교육을 실시하며 내부 감사 절차를 통해 보안이 유지되도록 시행하고 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '4) 개인 아이디와 비밀번호 관리',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"회사"는 이용자의 개인정보를 보호하기 위하여 최선의 노력을 다하고 있습니다. 단, 이용자의 개인적인 부주의로 이메일(또는 페이스북 등 외부 서비스와의 연동을 통해 이용자가 설정한 계정 정보), 비밀번호등 개인정보가 유출되어 발생한 문제와 기본적인 인터넷의 위험성 때문에 일어나는 일들에 대해 책임을 지지 않습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '5) 전산실, 자료보관실 등의 접근을 통제합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '9. 링크',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"위드"는 다양한 배너와 링크를 포함할 수 있습니다. 많은 경우 타 사이트의 페이지와 연결되어 있으며 이는 광고주와의 계약관계에 의하거나 제공받은 컨텐츠의 출처를 밝히기 위한 조치입니다. "위드"가 포함하고 있는 링크를 클릭하여 타 사이트의 페이지로 옮겨갈 경우 해당 사이트의 개인정보취급방침은 “위드”와 무관하므로 새로 방문한 사이트의 정책을 검토해 보시기 바랍니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '10. 아동의 개인정보 보호',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"회사"는 인터넷 스카우팅 및 리쿠르팅의 특성으로 볼 때 만14세 이상인 경우에만 회원가입이 가능하며 개인정보의 수집/이용에 법정대리인의 동의가 필요한 만14세 미만 아동의 개인정보는 원칙적으로 수집하지 않으며 만 14세 미만 아동은 법정대리인의 동의 하에 채용 및 스카우팅을 진행합니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '11. 비회원의 개인정보 보호',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"위드"에서는 회원 가입을 하지 않아도 공개를 희망하지 않는 개인정보와 이력서 주요 정보를 제외한 대부분의 컨텐츠를 열람할 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '12. 개인정보 보호책임자 및 민원서비스',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '"회사"는 이용자의 개인정보를 보호하고 개인정보와 관련한 고충처리를 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '개인정보 보호책임자',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '이름: 이웅장',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '소속: 대표이사',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '직책/직급 : 대표이사/대표이사',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '연락처 : with.official@projectwith.io',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '기타 개인정보에 관한 상담이 필요한 경우에는 아래 기관에 문의하실 수 있습니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '개인정보침해신고센터 http://privacy.kisa.or.kr/ 국번없이 118',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '대검찰청 사이버수사과 http://www.spo.go.kr/ 국번없이 1301',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '경찰청 사이버안전국 http://www.ctrc.go.kr/ 국번없이 182',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '13. 부칙',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                    Text(
                                      '현 개인정보취급방침은 법령, 정책 또는 보안기술의 변경 등에 따라 내용 추가, 삭제 및 수정이 있을 시에는 시행일의 7일 전부터 홈페이지의 공지사항을 통하여 고지할 것입니다.',
                                      style: const TextStyle(
                                          color: Color.fromRGBO(88, 88, 88, 1),
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "NotoSansCJKkr-Regular",
                                          fontStyle: FontStyle.normal,
                                          fontSize: 9.0),
                                    ),
                                  ],
                                ),
                              ),
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
                                      if (!value) {
                                        _agreeAll = false;
                                      }
//                                      _checkAll();
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "개인정보보호법 제22조 제4항에 의해 선택정보 사항에 대해서는 기재하지 않으셔도 서비스를 이용하실 수 있습니다.",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Bold",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.0),
                                ),
                                Text(
                                  "가. 개인정보 수집 항목에 대한 마케팅 및 광고 활용",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "1) 신규 서비스 관련 소식, 이벤트, 본 서비스 관련 소식 등 광고성 정보 전달 시 활용됩니다.",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "2) 경품 및 쇼핑몰 물품 배송에 대한 정확한 배송 정보 확보 시 활용됩니다.",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "3) 개인별 맞춤 서비스, 인구통계학적 특성에 따른 서비스 제공 및 광고를 게재하기 위한 자료로 활용됩니다.",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "4) 접속 빈도 파악 또는 회원의 본 서비스 이용과 관련된 통계 자료로 활용됩니다.",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "나. 문자메시지, 이메일 및 DM 등 기타 정보 수신과 관련된 동의 및 철회",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "1) 당사는 회원이 수신에 동의한 경우, 제4조에 의하여 수집된 이름, 주소, 연락처, E-mail 정보를 활용하여 DM, SMS, LMS, MMS 및 E-mail을 발송할 수 있습니다.",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "2) 회원이 전항의 서비스를 원하지 않을 경우 고객상담실 또는 당사 인터넷 홈페이지 및 어플리케이션을 통해 동의를 철회할 수 있습니다.",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "다. 개인정보 활용 기간",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Medium",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                                Text(
                                  "1) 개인정보 활용 동의 시부터 회원 탈퇴 또는 동의 철회 시까지 활용됩니다.",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(88, 88, 88, 1),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "NotoSansCJKkr-Regular",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 9.0),
                                ),
                              ],
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
