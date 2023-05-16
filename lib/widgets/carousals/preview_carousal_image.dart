import 'package:flutter/material.dart';

class PreviewCarousalImage extends StatefulWidget {
  final double radius;
  final List<String> images;
  const PreviewCarousalImage(
      {required this.radius, required this.images, super.key});

  @override
  State<PreviewCarousalImage> createState() => _PreviewCarousalImage();
}

class _PreviewCarousalImage extends State<PreviewCarousalImage> {
  late PageController _pageController;
  int activePage = 1;
  // List<String> images = [
  //   'assets/images/paris.jpg',
  //   'assets/images/newyork.jpg',
  //   'assets/images/venice.jpg',
  // ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        // setting Bouncing when you want animation
        // physics: BouncingScrollPhysics(),
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
          return Padding(
            padding: EdgeInsets.only(
                right:
                    setRightPadding((widget.images.length - 1), pagePosition)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius),
              child: Image(
                image: AssetImage(widget.images[pagePosition]),
                fit: BoxFit.fill,
              ),
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
}
