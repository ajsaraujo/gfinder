import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShowGif extends StatelessWidget {
  final Map gifData;
  
  ShowGif({this.gifData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gifData['title']),
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
      body: Center(
        child: Image.network(gifData['images']['fixed_height']['url'])
      )
    );
  }
}