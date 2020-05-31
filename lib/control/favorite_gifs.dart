import '../models/gif.dart';
import 'file_controller.dart';

class FavoriteGifs {
  Map<String, dynamic> favoriteGifs;

  // Singleton implementation below.
  static final FavoriteGifs _singleton = FavoriteGifs._internal();
  factory FavoriteGifs() {
    return _singleton;
  }
  FavoriteGifs._internal();

  // Class methods.
  List favoriteGifList() {
    final favoriteGifsList = List<Gif>();

    favoriteGifs.forEach((key, value) {
      var newGif = Gif(id: key, title: value['title'], url: value['url']);
      favoriteGifsList.add(newGif);
    });

    return favoriteGifsList;
  }

  bool isFavorite(String gifId) {
    return favoriteGifs[gifId] != null;
  }

  void toggleGifFavoriteState(Gif gif) {
    final id = gif.id;
    
    if (isFavorite(id)) {
      removeGifFromFavorites(id);
    } else {
      markGifAsFavorite(gif);
    }
  }

  void markGifAsFavorite(Gif gif) {
    final id = gif.id;
    final url = gif.url;
    final title = gif.title; 

    favoriteGifs[id] = {};
    favoriteGifs[id]['url'] = url;
    favoriteGifs[id]['title'] = title;

    FileController.writeFavoriteGifs(favoriteGifs);
  }

  void removeGifFromFavorites(String gifId) {
    favoriteGifs.remove(gifId);
    FileController.writeFavoriteGifs(favoriteGifs);
  }
}
