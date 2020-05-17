import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GifRequester {
  String _lastSearch;
  int _offset = 0;

  final int _numOfGifs = 19;
  final _apiKey = DotEnv().env['API_KEY'];
  
  static final GifRequester _singleton = GifRequester._internal();

  factory GifRequester() {
    return _singleton;
  }

  GifRequester._internal();

  String _trendingGifsEndpoint() {
    return 'https://api.giphy.com/v1/gifs/trending?api_key=$_apiKey&limit=${_numOfGifs}&rating=G';
  }

  String _searchGifsEndpoint() {
    return 'https://api.giphy.com/v1/gifs/search?api_key=$_apiKey&q=${_lastSearch}&limit=${_numOfGifs}&offset=${_offset}&rating=G&lang=en';
  }

  void _updateOffsetAndSearch(String search) {
    if (search == _lastSearch) {
      _offset += _numOfGifs;
    } else {
      _offset = 0;
      _lastSearch = search;
    }
  }

  String _getRequestUrl(String search) {
    if (search == null || search.isEmpty) {
      return _trendingGifsEndpoint();
    }

    _updateOffsetAndSearch(search);

    return _searchGifsEndpoint();
  }
  
  fetchGifs(String search) async {
    final url = _getRequestUrl(search);
    final response = await http.get(url);
    final decoded = await json.decode(response.body);
    
    return decoded;
  }
}