import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';
import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/pages/home.dart';

class HotelInfoAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double heightAppBar;
  final String? hotalName_;
  final String? byPage_;
  const HotelInfoAppBar(
      {super.key, required this.heightAppBar, this.hotalName_, this.byPage_});

  @override
  State<HotelInfoAppBar> createState() => _HotelInfoAppBar();
  Size get preferredSize => Size.fromHeight(heightAppBar);
}

class _HotelInfoAppBar extends State<HotelInfoAppBar> {
  String hotalName = "";
  String bookingInfo = "";
  String residentInfo = "";
  final bookingFilterCon = bookingFilterController();
  @override
  initState() {
    super.initState();
    bookingFilterCon.getHotelAppBar().then((val) => setState(() {
          hotalName = val.hotalName;
          bookingInfo = val.bookingInfo;
          residentInfo = val.residentInfo;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        onPressed: () => widget.byPage_ == "list"
            ? Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              )
            : Navigator.of(context).pop(),
      ),
      title:
          // GestureDetector(
          //   onTap: (() => {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => BookingFilterScreen(
          //                     whereFrom_: FontSize.fromWidget,
          //                   )),
          //         )
          //       }),
          //   child:
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hotalName_ != null
              ? Text(
                  widget.hotalName_ ?? 'default',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.045),
                  overflow: TextOverflow.ellipsis,
                )
              : Text(
                  hotalName,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.045),
                  overflow: TextOverflow.ellipsis,
                ),
          Row(
            children: [
              Text(
                bookingInfo,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.036),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                ',${residentInfo}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.036),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
      // )
    );
  }
}
