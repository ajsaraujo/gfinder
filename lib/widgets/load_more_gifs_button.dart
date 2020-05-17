import 'package:flutter/material.dart';

class LoadMoreGifsButton extends StatelessWidget {
  final Function redrawHomePage;

  LoadMoreGifsButton({this.redrawHomePage});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: redrawHomePage,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.add, color: Colors.white, size: 70.0),
                Text('Load more...',
                    style: TextStyle(color: Colors.white, fontSize: 17.0))
              ],
            )));
  }
}
