import 'package:flutter/material.dart';
import '../control/navigation_mode.dart';
import 'gif_grid_item.dart';
import 'load_more_gifs_button.dart';

class GifGridView extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final NavigationMode navigationMode;
  final Function redrawHomePage;
  int _itemCount;

  GifGridView({this.snapshot, this.redrawHomePage, this.navigationMode}) {
    _itemCount = snapshot.data['data'].length;

    // The last item will be the "Load More" button.
    if (navigationMode == NavigationMode.search) _itemCount++;
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
      itemBuilder: (context, index) {
        if (navigationMode == NavigationMode.search &&
            index == _itemCount - 1) {
          return LoadMoreGifsButton(
            redrawHomePage: this.redrawHomePage,
          );
        }
        return GifGridItem(gifData: snapshot.data['data'][index]);
      },
      padding: EdgeInsets.all(10.0),
    );
  }
}
