import 'package:flutter/material.dart';
import 'package:gfinder/widgets/my_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border,
                      color: Colors.white, size: 50.0),
                  onPressed: () {
                    print('${gifData['title']} was marked as a favorite!');
                  },
                ),
                IconButton(
                    icon: Icon(Icons.share, color: Colors.white, size: 50.0),
                    onPressed: () {
                      Share.share(gifData['images']['fixed_height']['url']);
                    })
              ],
            )
          ],
        ));
  }
}
