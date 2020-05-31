import 'package:flutter/material.dart';
import '../control/navigation_mode.dart';
import 'gif_grid_item.dart';
import 'load_more_gifs_button.dart';

class GifGridView extends StatelessWidget {
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

  Widget _buildItem(context, index) {
    final isLastTile = index == _itemCount - 1;
    final searchMode = navigationMode == NavigationMode.search;

    if (searchMode && isLastTile) {
      return LoadMoreGifsButton(
        redrawHomePage: redrawHomePage,
      );
    }

    return GifGridItem(
        gif: gifList[index], redrawFavoritesPage: redrawFavoritesPage);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: _itemCount,
      itemBuilder: _buildItem,
      padding: EdgeInsets.all(10.0),
    );
  }
}
