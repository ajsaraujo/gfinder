import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gfinder/ui/show_gif.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset = 0;

  _getGifs() async {
    String url;

    if (_search == null) {
      url =
          'https://api.giphy.com/v1/gifs/trending?api_key=01BdxRWujnufHK49HzxbDee0BSilRkwI&limit=19&rating=G';
    } else {
      url =
          'https://api.giphy.com/v1/gifs/search?api_key=01BdxRWujnufHK49HzxbDee0BSilRkwI&q=${_search}&limit=25&offset=${_offset}&rating=G&lang=en';
    }

    final response = await http.get(url);
    final decoded = await json.decode(response.body);

    return decoded;
  }

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
                        _offset = 0;
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
                    future: _getGifs(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                        case ConnectionState.active:
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
                        case ConnectionState.done:
                          return _createGifTable(context, snapshot);
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
          return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowGif(
                              gifData: snapshot.data['data'][index],
                            )));
              },
              child: Image.network(
                  snapshot.data['data'][index]['images']['fixed_height']['url'],
                  height: 300.0,
                  fit: BoxFit.cover));
        } else {
          return Container(
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _offset += 19;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.add, color: Colors.white, size: 70.0),
                      Text('Load more...',
                          style: TextStyle(color: Colors.white, fontSize: 17.0))
                    ],
                  )));
        }
      },
      padding: EdgeInsets.all(10.0),
    );
  }
}
