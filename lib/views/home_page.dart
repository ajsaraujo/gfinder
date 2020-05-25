import 'package:flutter/material.dart';
import 'package:gfinder/widgets/search_field.dart';
import '../control/favorite_gifs.dart';
import '../control/file_controller.dart';
import '../widgets/my_scaffold.dart';
import '../widgets/gif_grid_view.dart';
import '../control/gif_requester.dart';
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
    final _searchField = SearchField(updateSearchValue: (String value) {
      setState(() {
        _search = value;
      });
    });
    
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
