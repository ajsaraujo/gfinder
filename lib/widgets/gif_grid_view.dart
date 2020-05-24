import 'package:flutter/material.dart';
import '../control/navigation_mode.dart';
import 'gif_grid_item.dart';
import 'load_more_gifs_button.dart';

class GifGridView extends StatefulWidget {
  final List gifList;
  final Function redrawHomePage;
  final Function redrawFavoritesPage;
  final NavigationMode navigationMode;
  int _itemCount;

  GifGridView(
      {this.gifList,
      this.redrawFavoritesPage,
      this.redrawHomePage,
      this.navigationMode}) {
    _itemCount = gifList.length;

    // The last item will be the "Load More" button.
    if (navigationMode == NavigationMode.search) _itemCount++;
  }

  @override
  _GifGridViewState createState() => _GifGridViewState();
}

class _GifGridViewState extends State<GifGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: this.widget._itemCount,
      itemBuilder: (context, index) {
        if (this.widget.navigationMode == NavigationMode.search &&
            index == this.widget._itemCount - 1) {
          return LoadMoreGifsButton(
            redrawHomePage: this.widget.redrawHomePage,
          );
        }

        return GifGridItem(
            gif: this.widget.gifList[index],
            redrawFavoritesPage: this.widget.redrawFavoritesPage);
      },
      padding: EdgeInsets.all(10.0),
    );
  }
}
