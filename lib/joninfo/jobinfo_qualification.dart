import 'package:flutter/material.dart';
import 'package:with_flutter/model/jobInfo.dart';

class JobInfoQualification extends StatelessWidget {
  final JobInfo _jobInfo;

  JobInfoQualification({
    Key key,
    @required JobInfo jobInfo,
  })  : assert(jobInfo != null),
        _jobInfo = jobInfo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
//    debugPrint(
//        "]-----] _jobInfo [----- [ ${_jobInfo.jobPreferenceQualifications}");
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _jobInfo.jobRequiredQualifications != null &&
                  _jobInfo.jobRequiredQualifications.length > 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "모집자격",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Bold",
                        fontStyle: FontStyle.normal,
                        fontSize: 15.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            _jobInfo.jobRequiredQualifications.map((item) {
                          return Text(
                            "• ${item.qualification}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontFamily: "NotoSansCJKkr-Regular",
                              fontStyle: FontStyle.normal,
                              fontSize: 13.0,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 0,
                  child: Text(""),
                ),
          _jobInfo.jobPreferenceQualifications != null &&
                  _jobInfo.jobPreferenceQualifications.length > 0
              ? Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "우대사항",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Bold",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              _jobInfo.jobPreferenceQualifications.map((item) {
                            return Text(
                              "• ${item.qualification}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 0,
                  child: Text(""),
                ),
          _jobInfo.jobBenefits != null && _jobInfo.jobBenefits.length > 0
              ? Container(
                  padding: EdgeInsets.only(bottom: 0),
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "제공사항",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Bold",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _jobInfo.jobBenefits.map((item) {
                            return Text(
                              "• ${item.benefit}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 0,
                  child: Text(""),
                ),
          _jobInfo.jobPositions != null && _jobInfo.jobPositions.length > 0
              ? Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "모집포지션",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Bold",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          children: _jobInfo.jobPositions.map((item) {
                            return Text(
                              "• ${item.positionName} : ${item.positionCondition}",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "NotoSansCJKkr-Regular",
                                fontStyle: FontStyle.normal,
                                fontSize: 13.0,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  height: 0,
                  child: Text(""),
                ),
          Container(
            padding: EdgeInsets.only(bottom: 0),
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "연봉 및 수당",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Bold",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Column(children: [
                    Text(
                      "• ${_jobInfo.baseSalary}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Regular",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0,
                      ),
                    ),
                    Text(
                      "• ${_jobInfo.etcSalary}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr-Regular",
                        fontStyle: FontStyle.normal,
                        fontSize: 13.0,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
