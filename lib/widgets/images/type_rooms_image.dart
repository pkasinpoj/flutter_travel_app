import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/widgets/images/gallery_widget.dart';

class TypeRoomsImage extends StatefulWidget {
  List<String> images;
  TypeRoomsImage({super.key, required this.images});

  @override
  State<TypeRoomsImage> createState() => _TypeRoomsImage();
}

class _TypeRoomsImage extends State<TypeRoomsImage> {
  late PageController _pageController;
  int activePage = 1;
  // List<String> images = [
  //   'assets/images/hotel_demo_1.jpg',
  //   'assets/images/hotel_demo_3.jpg',
  //   'assets/images/hotel_demo_4.jpg',
  // ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        // setting Bouncing when you want animation
        // physics: BouncingScrollPhysics(),
        // physics: new ClampingScrollPhysics(),
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padEnds: false,
        itemCount: widget.images.length,
        pageSnapping: true,
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            activePage = page;
          });
        },
        itemBuilder: (context, pagePosition) {
          return InkWell(
            onTap: () {
              print(pagePosition);
              openGalleryWidger(pagePosition);
            },
            child: Image(
              image: AssetImage(widget.images[pagePosition]),
              fit: BoxFit.fill,
            ),
          );
        });
  }

  double setRightPadding(int length, int pagePosition) {
    if (pagePosition == length) {
      return 0;
    }
    return 6;
  }

  void openGalleryWidger(pagePosition) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GalleryWidget(
                urlImages: widget.images, pagePosition: pagePosition)),
      );
}
