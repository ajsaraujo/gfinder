import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileController {
  static Future<File> _getFavoriteGifsFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/favorites.json');
  }

  static Future<File> saveFavoriteGifs(Map<String, dynamic> favoriteGifs) async {
    String data = json.encode(favoriteGifs);
    final file = await _getFavoriteGifsFile();
    return file.writeAsString(data);
  }

  static Future<String> parseFavoriteGifsFile() async {
    try {
      final file = await _getFavoriteGifsFile();
      return file.readAsString();
    } catch (err) {
      print(err);
      return '{}';
    }
  }
}