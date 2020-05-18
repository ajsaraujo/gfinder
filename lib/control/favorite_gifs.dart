class FavoriteGifs {
  Map<String, dynamic> favoriteGifs;
  
  static final FavoriteGifs _singleton = FavoriteGifs._internal();

  factory FavoriteGifs() {
    return _singleton;
  }

  FavoriteGifs._internal();

  bool isFavorite(String gifUrl) {
    return favoriteGifs[gifUrl] != null;
  }
}