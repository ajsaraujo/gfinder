import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gfinder/widgets/my_page_view.dart';
Future main() async {
  await DotEnv().load('.env');

  runApp(MaterialApp(
    home: MyPageView(),
    theme: ThemeData(hintColor: Colors.white)
  ));
}
