import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';

class SingleInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  final double heightAppBar;
  const SingleInfoAppBar(
      {super.key, required this.name, required this.heightAppBar});

  @override
  Size get preferredSize => Size.fromHeight(heightAppBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '$name',
          style: TextStyle(
              color: Colors.white,
              fontSize:
                  MediaQuery.of(context).size.width * FontSize.textHeader),
          overflow: TextOverflow.ellipsis,
        ));
  }
}
