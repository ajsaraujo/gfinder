import 'package:flutter/material.dart';
import 'package:gfinder/widgets/gif_actions_row.dart';
import 'package:gfinder/widgets/my_scaffold.dart';

class SingleGifPage extends StatelessWidget {
  final Map gifData;

  SingleGifPage({this.gifData});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(gifData['title'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
            SizedBox(height: 20.0),
            Image.network(gifData['images']['fixed_height']['url']),
            SizedBox(height: 20.0),
            GifActionsRow(
              gifTitle: gifData['title'],
              gifUrl: gifData['images']['fixed_height']['url'],
              gifId: gifData['id'],
            ),
          ],
        ));
  }
}
