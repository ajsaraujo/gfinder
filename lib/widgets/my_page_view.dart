import 'package:flutter/material.dart';
import '../views/favorite_gifs_page.dart';
import '../views/home_page.dart';

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(initialPage: 0),
      children: <Widget>[HomePage(), FavoriteGifsPage()],
    );
  }
}
