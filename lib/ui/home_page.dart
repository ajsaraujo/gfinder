import 'dart:convert';

import 'package:flutter/material.dart';
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
      url = 'https://api.giphy.com/v1/gifs/trending?api_key=01BdxRWujnufHK49HzxbDee0BSilRkwI&limit=20&rating=R'; 
    } else {
      url = 'https://api.giphy.com/v1/gifs/search?api_key=01BdxRWujnufHK49HzxbDee0BSilRkwI&q=${_search}&limit=25&offset=${_offset}&rating=G&lang=en';
    }

    final response = await http.get(url);
    final decoded = json.decode(response.body);
    
    return decoded;
  }
  
  @override 
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}