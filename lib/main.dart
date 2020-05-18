import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gfinder/control/favorite_gifs.dart';
import 'views/home_page.dart';

Future main() async {
  await DotEnv().load('.env');
  final _favoriteGifs = FavoriteGifs();

  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(hintColor: Colors.white)
  ));
}