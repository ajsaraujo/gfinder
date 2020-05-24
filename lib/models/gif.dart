import 'package:flutter/material.dart';

class Gif {
  String id;
  String title;
  String url;

  Gif({this.id, this.title, this.url});

  static List<Gif> gifListFromSnapshot(AsyncSnapshot snapshot) {
    final objectList = snapshot.data['data'];
    final gifList = List<Gif>();

    objectList.forEach((object) {
      var newGif = Gif(
          id: object['id'],
          url: object['images']['fixed_height']['url'],
          title: object['title']);
      gifList.add(newGif);
    });

    return gifList;
  }
}
