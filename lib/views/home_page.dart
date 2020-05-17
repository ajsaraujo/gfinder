import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gfinder/control/navigation_mode.dart';
import 'package:gfinder/widgets/gif_grid_view.dart';

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
    final _myAppBar = AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Text(
        'Gfinder',
        style: GoogleFonts.roboto(),
      ),
    );

    final _searchField = Padding(
        padding: EdgeInsets.all(10.0),
        child: TextField(
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: 'Search GIFs',
              labelStyle: TextStyle(color: Colors.white),
              border: OutlineInputBorder(),
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

    return Scaffold(
        appBar: _myAppBar,
        backgroundColor: Colors.black,
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
                              snapshot: snapshot,
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
