import 'package:flutter/material.dart';

import '../control/favorite_gifs.dart';
import '../control/file_controller.dart';
import '../control/gif_requester.dart';
import '../control/navigation_mode.dart';
import '../widgets/search_field.dart';
import '../widgets/my_scaffold.dart';
import '../widgets/gif_grid_view.dart';
import '../widgets/my_progress_indicator.dart';
import '../models/gif.dart';

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

  NavigationMode _getNavigationMode() {
    if (this._search == null) {
      return NavigationMode.trending;
    }

    return NavigationMode.search;
  }

  @override
  Widget build(BuildContext context) {
    final _searchField = SearchField(updateSearchValue: (String value) {
      setState(() {
        _search = value;
      });
    });

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
                          navigationMode: _getNavigationMode(),
                          redrawHomePage: (() {
                            setState(() {});
                          }));
                    default:
                      return MyProgressIndicator();
                  }
                }))
      ],
    ));
  }
}
