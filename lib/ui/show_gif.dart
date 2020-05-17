import 'package:flutter/material.dart';

class ShowGif extends StatelessWidget {
  final Map gifData;
  
  ShowGif({this.gifData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gifData['title']),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(gifData['images']['fixed_height']['url'])
      )
    );
  }
}