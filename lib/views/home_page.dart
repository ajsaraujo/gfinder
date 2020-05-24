import 'package:flutter/material.dart';
import 'package:gfinder/control/favorite_gifs.dart';
import 'package:gfinder/control/file_controller.dart';
import 'package:gfinder/widgets/my_scaffold.dart';
import 'package:gfinder/widgets/gif_grid_view.dart';
import 'package:gfinder/control/gif_requester.dart';
import '../models/gif.dart';
import '../control/navigation_mode.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  final _gifRequester = GifRequester();

  @override
  void initState() {
    super.initState();

    final _favoriteController = FavoriteGifs();
    FileController.readFavoriteGifs().then((data) {
      _favoriteController.favoriteGifs = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _searchField = Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
            textInputAction: TextInputAction.search,
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: 'Search GIFs',
              hintStyle: TextStyle(fontSize: 14.0),
              labelStyle: TextStyle(color: Colors.white),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
            ),
            onSubmitted: (String value) {
              setState(() {
                _search = value;
              });
            }));

    final _progressIndicatorContainer = Container(
      width: 200.0,
      height: 200.0,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 5.0,
      ),
    );

    return MyScaffold(
        body: Column(
      children: <Widget>[
        _searchField,
        Expanded(
            child: FutureBuilder(
                future: _gifRequester.fetchGifs(_search),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.done:
                      return GifGridView(
                          gifList: Gif.gifListFromSnapshot(snapshot), 
                          navigationMode: _search == null
                              ? NavigationMode.trending
                              : NavigationMode.search,
                          redrawHomePage: (() {
                            setState(() {});
                          }));
                    default:
                      return _progressIndicatorContainer;
                  }
                }))
      ],
    ));
  }
}
