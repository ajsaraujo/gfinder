import 'package:flutter/material.dart';
import 'package:gfinder/control/navigation_mode.dart';
import 'package:gfinder/views/single_gif_page.dart';
import 'package:gfinder/widgets/gif_grid_item.dart';
import 'package:gfinder/widgets/gif_grid_view.dart';
import 'package:gfinder/widgets/load_more_gifs_button.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:gfinder/control/gif_requester.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  final _gifRequester = GifRequester();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('GFINDER',
              style: TextStyle(
                color: Colors.white,
              )),
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                    onSubmitted: (String value) {
                      setState(() {
                        _search = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Search GIFs',
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                    textAlign: TextAlign.center)),
            Expanded(
                child: FutureBuilder(
                    future: _gifRequester.fetchGifs(_search),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          return GifGridView(
                              snapshot: snapshot,
                              navigationMode: _search == null
                                  ? NavigationMode.trending
                                  : NavigationMode.search,
                              redrawHomePage: (() {
                                setState(() {});
                              }));
                        default:
                          return Container(
                            width: 200.0,
                            height: 200.0,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              strokeWidth: 5.0,
                            ),
                          );
                      }
                    }))
          ],
        ));
  }

  _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    int _itemCount = snapshot.data['data'].length;
    if (_search != null) _itemCount++;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: _itemCount,
      itemBuilder: (context, index) {
        if (_search == null || index < snapshot.data['data'].length) {
          return GifGridItem(gifData: snapshot.data['data'][index]);
        } else {
          return LoadMoreGifsButton(redrawHomePage: () {
            setState(() {});
          });
        }
      },
      padding: EdgeInsets.all(10.0),
    );
  }
}
