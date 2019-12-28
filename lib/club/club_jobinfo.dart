import 'package:flutter/material.dart';
import 'package:with_flutter/common/jobinfo_util.dart';
import 'package:with_flutter/joninfo/jobinfo_screen.dart';
import 'package:with_flutter/model/jobInfo.dart';

class ClubJobInfo extends StatelessWidget {
  final List<JobInfo> _jobInfos;

  ClubJobInfo({
    Key key,
    @required List<JobInfo> jobInfos,
  })  : assert(jobInfos != null),
        _jobInfos = jobInfos,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("모집 포지션",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "NotoSansCJKkr-Bold",
                fontStyle: FontStyle.normal,
                fontSize: 15.0,
              )),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              children: createChildrenJobInfos(context),
            ),
          )
        ],
      ),
    );
  }

  List<Container> createChildrenJobInfos(BuildContext context) {
    return _jobInfos
        .map((jobInfo) => Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 5),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(48, 190, 157, 1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${jobInfo.title}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Bold",
                      fontStyle: FontStyle.normal,
                      fontSize: 17.0,
                    ),
                  ),
                  Text(
                    makeJobInfoDate(jobInfo.startedAt, jobInfo.endedAt),
                    style: TextStyle(
                      color: Color.fromRGBO(65, 65, 65, 1),
                      fontWeight: FontWeight.w400,
                      fontFamily: "NotoSansCJKkr-Regular",
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobInfoScreen(
                                    jobInfoId: jobInfo.id,
                                  )),
                        );
                      },
                      child: Text(
                        "자세한 스카우팅 정보 보러 가기",
                        style: TextStyle(
                          color: Color.fromRGBO(48, 190, 157, 1),
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Regular",
                          fontStyle: FontStyle.normal,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }
}
