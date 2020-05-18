import 'package:flutter/material.dart';
import 'package:gfinder/widgets/gif_actions_row.dart';
import 'package:gfinder/widgets/my_scaffold.dart';

class SingleGifPage extends StatelessWidget {
  final String gifUrl;
  final String gifId;
  final String gifTitle;

  SingleGifPage({this.gifUrl, this.gifId, this.gifTitle});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(gifTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                )),
            SizedBox(height: 20.0),
            Image.network(gifUrl),
            SizedBox(height: 20.0),
            GifActionsRow(
              gifTitle: this.gifTitle,
              gifUrl: this.gifUrl,
              gifId: this.gifId,
            ),
          ],
        ));
  }
}
