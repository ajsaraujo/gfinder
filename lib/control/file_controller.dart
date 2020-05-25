
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileController {
  static Future<File> _favoriteGifsFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/favorites.json';
    return File(path);
  }

  static Future<File> writeFavoriteGifs(favoriteGifs) async {
    final String encoded = json.encode(favoriteGifs);
    final file = await _favoriteGifsFile();
    return file.writeAsString(encoded);
  }

  static Future<Map<String, dynamic>> readFavoriteGifs() async {
    try {
      final file = await _favoriteGifsFile();
      String content = await file.readAsString();
      final decoded = json.decode(content);
      return decoded;
    } catch (e) {
      return {};
    }
  }
}