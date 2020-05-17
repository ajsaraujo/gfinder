import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

class SingleGifPage extends StatelessWidget {
  final Map gifData;
  
  SingleGifPage({this.gifData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Gfinder', style: GoogleFonts.roboto()),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(gifData['images']['fixed_height']['url']);
            }
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(gifData['title'], textAlign: TextAlign.center, style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          )),
          SizedBox(height: 10.0),
          Center(
            child: Image.network(gifData['images']['fixed_height']['url'])
          )
        ],
      )
    );
  }
}