import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget leading;

  MyScaffold({this.leading, this.body, this.title='Gfinder'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: this.leading,
          centerTitle: true,
          title: Text(this.title, style: GoogleFonts.roboto()),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: this.body);
  }
}
