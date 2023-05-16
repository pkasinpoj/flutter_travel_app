import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryWidget extends StatefulWidget {
  final PageController pageController;
  final List<String> urlImages;
  final int pagePosition;
  GalleryWidget({super.key, required this.urlImages, this.pagePosition = 0})
      : pageController = PageController(initialPage: pagePosition);

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late int pagePosition = widget.pagePosition;
  @override
  Widget build(BuildContext context) {
    double image_width = MediaQuery.of(context).size.width * 1;
    double image_height = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      body: Stack(alignment: Alignment.bottomLeft, children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: PhotoViewGallery.builder(
              pageController: widget.pageController,
              itemCount: widget.urlImages.length,
              builder: ((context, index) {
                final urlImage = widget.urlImages[index];
                return PhotoViewGalleryPageOptions(
                    imageProvider: ResizeImage(
                      AssetImage(urlImage),
                      width: image_width.toInt(),
                      height: image_height.toInt(),
                    ),
                    initialScale: PhotoViewComputedScale.contained,
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.contained * 4);
              }),
              onPageChanged: (index) => setState(() {
                    pagePosition = index;
                  })),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: Text(
            "Image ${pagePosition + 1}/${widget.urlImages.length} ",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height * 0.02),
          ),
        )
      ]),
    );
  }
}
