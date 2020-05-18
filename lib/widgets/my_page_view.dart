import 'package:flutter/material.dart';
import 'package:gfinder/views/favorite_gifs_page.dart';
import 'package:gfinder/views/home_page.dart';

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: PageController(initialPage: 0),
      children: <Widget>[HomePage(), FavoriteGifsPage()],
    );
  }
}
