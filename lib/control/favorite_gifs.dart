import 'file_controller.dart';

class FavoriteGifs {
  Map<String, dynamic> favoriteGifs;
  
  static final FavoriteGifs _singleton = FavoriteGifs._internal();

  factory FavoriteGifs() {
    return _singleton;
  }

  FavoriteGifs._internal();

  bool isFavorite(String gifId) {
    return favoriteGifs[gifId] != null;
  }

  void markGifAsFavorite(String gifId, String gifUrl, String gifTitle) {
    favoriteGifs[gifId] = {};
    favoriteGifs[gifId]['url'] = gifUrl;
    favoriteGifs[gifId]['title'] = gifTitle;

    FileController.writeFavoriteGifs(favoriteGifs);
  }

  void removeGifFromFavorites(String gifId) {
    favoriteGifs.remove(gifId);
    FileController.writeFavoriteGifs(favoriteGifs);
  }
}