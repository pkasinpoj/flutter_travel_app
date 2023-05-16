// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:hive_flutter/hive_flutter.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/pages/destination_list.dart';
import 'package:thamturakit_mobile/pages/home.dart';
import 'package:thamturakit_mobile/pages/price_filter.dart';
import 'package:thamturakit_mobile/pages/resident_filter.dart';
import 'package:thamturakit_mobile/pages/search_location.dart';
import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/pages/account_setting.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';
import 'my_bookings.dart';

class BookingFilterScreen extends StatefulWidget {
  final String whereFrom_;
  const BookingFilterScreen({Key? key, required this.whereFrom_})
      : super(
          key: key,
        );

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingFilterScreen> {
  final bookingFilterCon = bookingFilterController();
  String destinationName = "";
  String residentInfo = "";
  int startPrice = 0;
  int endPrice = 0;
  DateTime _startdate = DateTime.now();
  DateTime _enddate = DateTime.now().add(const Duration(days: 1));
  @override
  initState() {
    super.initState();
    bookingFilterCon.getDestination().then((val) => setState(() {
          destinationName = val;
        }));
    bookingFilterCon.getResidentInfo().then((val) => setState(() {
          residentInfo = val;
        }));
    bookingFilterCon.getRoomPrice().then((val) => setState(() {
          startPrice = val.startPrice;
          endPrice = val.endPrice;
        }));
    bookingFilterCon.getStartDate().then((val) => setState(() {
          _startdate = val;
        }));
    bookingFilterCon.getEndDate().then((val) => setState(() {
          _enddate = val;
        }));
  }

  int _selected_Index = 0;
  // List _selected_Page = [BookingFilterScreen(), Mybookings(), AccountSetting()];

  // _BookingScreenState() {
  //   bookingFilterCon.getDestination().then((val) => setState(() {
  //         destinationName = val;
  //       }));
  //   bookingFilterCon.getResidentInfo().then((val) => setState(() {
  //         print(val);
  //         residentInfo = val;
  //       }));
  // }

  _buttonStartDate() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white70.withOpacity(0.4),
        onPrimary: Colors.white,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.4,
            MediaQuery.of(context).size.width * 0.129), //////// HERE
      ),
      onPressed: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: _startdate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (newDate == null) return;
        setState(() => {
              _startdate = newDate,
              _enddate = _startdate.add(const Duration(days: 1))
            });
        bookingFilterCon.setEndDate(_enddate);
        bookingFilterCon.setStartDate(_startdate);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${_startdate.day}/${_startdate.month}/${_startdate.year}',
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width * FontSize.textBody,
                  color: Colors.white),
            ),
            Column(
              children: [
                Icon(Icons.calendar_today_outlined, color: Colors.white)
              ],
            ),
          ]),
    );
  }

  _buttonEndDate() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white70.withOpacity(0.4),
        onPrimary: Colors.white,
        minimumSize: Size(MediaQuery.of(context).size.width * 0.4,
            MediaQuery.of(context).size.width * 0.129), //////// HERE
      ),
      onPressed: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: _enddate,
          firstDate: _startdate.add(const Duration(days: 1)),
          lastDate: DateTime(2100),
        );
        if (newDate == null) return;
        setState(() => _enddate = newDate);
        bookingFilterCon.setEndDate(_enddate);
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '${_enddate.day}/${_enddate.month}/${_enddate.year}',
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width * FontSize.textBody,
                  color: Colors.white),
            ),
            Icon(Icons.calendar_today_outlined, color: Colors.white)
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      // ),
      body: SafeArea(
          // child: ListView(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/app-hotels-bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        // child: Center(
        child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  // Container(
                  //   // decoration: BoxDecoration(
                  //   //   color: Colors.deepOrange[50],
                  //   //   borderRadius: new BorderRadius.all(Radius.circular(25.0)),
                  //   //   shape: BoxShape.rectangle,
                  //   // ),
                  //   child: ClipRRect(
                  //       //clipBehavior: Clip.antiAlias,
                  //       child: Image.asset(
                  //           "assets/images/thamturakit-logo-2.png",
                  //           height: MediaQuery.of(context).size.width * 0.2,
                  //           width: MediaQuery.of(context).size.width * 0.5,
                  //           fit: BoxFit.fitWidth)),
                  // ),
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white),
                      onPressed: () => {
                            widget.whereFrom_ == "ToPage"
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                  )
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DestinationLists()),
                                  )
                          }),

                  Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.01),
                      height: widget.whereFrom_ == "ToPage"
                          ? MediaQuery.of(context).size.width * 1.30
                          : MediaQuery.of(context).size.width * 0.73,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widget.whereFrom_ == "ToPage"
                                ? Text("สถานที่",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody,
                                    ))
                                : Container(),
                            widget.whereFrom_ == "ToPage"
                                ? Container(
                                    // margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                                    child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white70.withOpacity(0.4),
                                      onPrimary: Colors.white,
                                      minimumSize: Size(
                                          double.infinity,
                                          MediaQuery.of(context).size.width *
                                              0.129), //////// HERE
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SearchLocation()),
                                      );
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child:
                                                  // _buildText("destination")
                                                  Text(
                                                destinationName,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          FontSize.textBody,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                          Column(
                                            children: [
                                              Icon(Icons.search,
                                                  color: Colors.white)
                                            ],
                                          ),
                                        ]),
                                  ))
                                : Container(),
                            Container(
                              // margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              height: MediaQuery.of(context).size.width * 0.2,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.41,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("เช็คอิน",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            FontSize.textBody)),
                                            _buttonStartDate()
                                          ],
                                        )),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.41,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("เช็คเอาท์",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            FontSize.textBody)),
                                            _buttonEndDate()
                                          ],
                                        )),
                                  ]),
                            ),
                            Text("ผเู้ข้าพัก",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody)),
                            Container(
                                // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white70.withOpacity(0.4),
                                onPrimary: Colors.white,
                                minimumSize: Size(
                                    double.infinity,
                                    MediaQuery.of(context).size.width *
                                        0.129), //////// HERE
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResidentFilter(
                                            whereFrom_: widget.whereFrom_,
                                          )),
                                );
                              },
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      // '${_enddate.day}/${_enddate.month}/${_enddate.year}',
                                      // '2 ผู้ใหญ่,0 เด็ก,1 ห้อง',
                                      residentInfo,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              FontSize.textBody,
                                          color: Colors.white),
                                    ),
                                    //   ],
                                    // ),
                                    Column(
                                      children: [
                                        Icon(Icons.people_alt_outlined,
                                            color: Colors.white)
                                      ],
                                    ),
                                  ]),
                            )),
                            widget.whereFrom_ == "ToPage"
                                ? Text("ช่วงราคา",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                FontSize.textBody))
                                : Container(),
                            widget.whereFrom_ == "ToPage"
                                ? Container(
                                    // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                    child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white70.withOpacity(0.4),
                                      onPrimary: Colors.white,
                                      minimumSize: Size(
                                          double.infinity,
                                          MediaQuery.of(context).size.width *
                                              FontSize.button), //////// HERE
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PriceFilter()),
                                      );
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          // _buildPrice(),
                                          Text(
                                            'B $startPrice-$endPrice',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Column(
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.07,
                                              )
                                            ],
                                          ),
                                        ]),
                                  ))
                                : Container(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.yellow[700],
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                minimumSize: Size(
                                    double.infinity,
                                    MediaQuery.of(context).size.width *
                                        FontSize.button), //////// HERE
                              ),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DestinationLists()),
                              ),
                              child: Text(
                                'ค้นหาโรงเเรม',
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ])),
                ],
              ),
            )),
        // ),
      )),
    );
  }
}

Widget _buildText(text) {
  return ValueListenableBuilder(
    valueListenable: Hive.box('testBox').listenable(),
    builder: (context, box, widget) {
      return Text(
        box.get(text),
        style: TextStyle(
          color: Colors.white,
          fontSize: MediaQuery.of(context).size.width * FontSize.textBody,
        ),
        overflow: TextOverflow.ellipsis,
      );
    },
  );
}

Widget _buildPrice() {
  return ValueListenableBuilder(
    valueListenable: Hive.box('testBox').listenable(),
    builder: (context, box, widget) {
      return Text(
        'B ${box.get("price")["start_price"]}-${box.get("price")["end_price"]}',
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * FontSize.textBody),
        overflow: TextOverflow.ellipsis,
      );
    },
  );
}


// Future<dynamic> _storageMultiText(_headtext, _subtext) async {
//   var box = await Hive.openBox('testBox');
//   final price = await box.get(_headtext);
//   print('Loki is ${price?[_subtext]} years old.');
//   return price[_subtext];
// }
