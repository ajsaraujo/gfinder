import 'dart:convert';

import './file_controller.dart';

class FavoriteGifs {
  Map<String, dynamic> favoriteGifs;
  
  static final FavoriteGifs _singleton = FavoriteGifs._internal();

  factory FavoriteGifs() {
    return _singleton;
  }

  FavoriteGifs._internal();
  
  void loadGifsFromFile() {
    FileController.parseFavoriteGifsFile().then((jsonData) {
      favoriteGifs = json.decode(jsonData);
    });
  }

  void markGifAsFavorite(String gifUrl, String gifTitle) {
    favoriteGifs[gifUrl] = gifTitle; 
    FileController.saveFavoriteGifs(favoriteGifs);
  }

  void removeGifFromFavorites(String gifUrl) {
    favoriteGifs.remove(gifUrl);
    FileController.saveFavoriteGifs(favoriteGifs);
  }
}