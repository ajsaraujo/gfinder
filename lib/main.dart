import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'views/home_page.dart';

Future main() async {
  await DotEnv().load('.env');
  
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(hintColor: Colors.white)
  ));
}