import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;

  MyScaffold({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Gfinder', style: GoogleFonts.roboto()),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: this.body);
  }
}
