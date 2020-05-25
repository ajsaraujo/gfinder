import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Function updateSearchValue;

  SearchField({this.updateSearchValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
      textInputAction: TextInputAction.search,
      style: TextStyle(color: Colors.white, fontSize: 18.0),
      textAlign: TextAlign.left,
      decoration: InputDecoration(
          hintText: 'Search GIFs',
          hintStyle: TextStyle(fontSize: 14.0),
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.search, color: Colors.white),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
      onSubmitted: this.updateSearchValue,
    ));
  }
}
