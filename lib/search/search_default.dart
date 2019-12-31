import 'package:flutter/material.dart';

class SearchDefault extends StatelessWidget {
  final Function _onPressed;

  SearchDefault({
    Key key,
    Function onPressed,
  })  : _onPressed = onPressed,
        super(key: key);

  List<SearchCategory> searchCategories = [
    new SearchCategory(
      'assets/images/catiaClimovichOjfkbHsnEacUnsplash@3x.png',
      "지도자",
      0,
    ),
    new SearchCategory(
      'assets/images/edgarChaparroCpoXIs2WygkUnsplash@3x.png',
      "에이전트",
      1,
    ),
    new SearchCategory(
      'assets/images/waldemarBrandtPx5VSvyIcbwUnsplash@3x.png',
      "구단",
      1,
    ),
    new SearchCategory(
      'assets/images/vidarNordliMathisenAqSfmgxGmeaUnsplash@3x.png',
      "골키퍼",
      1,
    ),
    new SearchCategory(
      'assets/images/svenKucinicZ0KjmjxUsKsUnsplash@3x.png',
      "미드필더",
      1,
    ),
    new SearchCategory(
      'assets/images/shutterstock289802363@3x.png',
      "공격수",
      1,
    ),
    new SearchCategory(
      'assets/images/danGoldNY0KbnXhhUUnsplash@3x.png',
      "수비수",
      1,
    ),
    new SearchCategory(
      'assets/images/arsenyTogulevGklq8PJuCzIUnsplash@3x.png',
      "U-12",
      1,
    ),
    new SearchCategory(
      'assets/images/marcelStraussQyZGw4YeAGkUnsplash@3x.png',
      "U-23",
      1,
    ),
    new SearchCategory(
      'assets/images/alecMooreRbAnExeyApcUnsplash1@3x.png',
      "성인",
      1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(bottom: 13),
                alignment: Alignment.centerLeft,
                child: Text(
                  "관심 분야를 탐색해 보세요",
                  style: const TextStyle(
                    color: Color.fromRGBO(79, 79, 79, 1),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr-Medium",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0,
                  ),
                )),
            GridView.count(
              shrinkWrap: true,
              primary: false,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              childAspectRatio: 1.35,
              children: List.generate(searchCategories.length, (index) {
                return GestureDetector(
                  onTap: () {
//                    _searchValue = searchCategories[index].title;
                    _onPressed(searchCategories[index].title);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(searchCategories[index].imagePath),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      width: double.infinity,
                      color: Color.fromRGBO(16, 16, 16, 0.5),
                      child: Text(
                        searchCategories[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "NotoSansCJKkr-Bold",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchCategory {
  final String imagePath;
  final String title;
  final int category;

  SearchCategory(
    this.imagePath,
    this.title,
    this.category,
  );
}
