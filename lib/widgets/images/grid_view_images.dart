import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridViewImages extends StatelessWidget {
  final String text;
  // constuctor
  GridViewImages({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      // ),
      child: StaggeredGrid.count(
        crossAxisCount: 6,
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: myPhotoList("assets/images/paris.jpg"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 2,
            child: myPhotoList("assets/images/paris.jpg"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: myPhotoList("assets/images/paris.jpg"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: myPhotoList("assets/images/paris.jpg"),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: myPhotoGallery("assets/images/paris.jpg"),
          ),
        ],
      ),
    );
  }

  Widget myPhotoList(String img) {
    return Image(
      image: AssetImage(img),
      fit: BoxFit.fill,
    );
  }

  Widget myPhotoGallery(String img) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.black87,
            image: new DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: new AssetImage(img),
              fit: BoxFit.fill,
            )),
      ),
      Container(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Text(
          'See all photos',
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      )),
    ]);
  }
}
