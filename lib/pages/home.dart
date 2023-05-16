// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';
import 'package:thamturakit_mobile/pages/account_setting.dart';
import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/pages/my_bookings.dart';
import 'package:thamturakit_mobile/widgets/carousals/category_carousal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bookingFilterCon = bookingFilterController();
  @override
  initState() {
    super.initState();
    bookingFilterCon.clearALl();
  }

  int _selected_Index = 0;
  List _selected_Page = [HomeScreen(), Mybookings(), AccountSetting()];
  int _selectedIndex = -1;
  List<IconData> _icons = [
    FontAwesomeIcons.hotel,
    FontAwesomeIcons.house,
    FontAwesomeIcons.umbrellaBeach,
    FontAwesomeIcons.mountain,
    Icons.forest,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        // print(_selectedIndex);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Palette.greentheme.withOpacity(0.85)
                : Palette.greentheme.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: Colors.white,
        ),
      ),
    );
  }

  void onTrapped(int index) {
    if (_selected_Index != index) {
      if (index != _selected_Page.length - 1) {
        setState(() {
          _selected_Index = index;
        });
        _JumpToPage(index);
      } else {
        _JumpToPage(index);
      }
    }
  }

  _JumpToPage(page_index) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _selected_Page[page_index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                // ignore: sort_child_properties_last
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: new Container(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 50.0, top: 20.0),
                          child: new Text(
                            'What would you like to find?',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: new TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey.withOpacity(0.4),
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            minimumSize: Size(
                                double.infinity,
                                MediaQuery.of(context).size.height *
                                    0.04), //////// HERE
                          ),
                          onPressed: () {
                            bookingFilterCon.clearDestination();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BookingFilterScreen(
                                        whereFrom_: FontSize.toPage,
                                      )),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'search location',
                                style: new TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(Icons.search)
                            ],
                          ),
                        ),
                      ),
                    ]),
                height: 220.0,
                width: MediaQuery.of(context).size.width - 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                    color: Colors.blue,
                    image: DecorationImage(
                        image:
                            new AssetImage('assets/images/app-hotels-bg.jpg'),
                        fit: BoxFit.fill)),
              ),
              Column(
                children: [
                  // Padding(
                  //     padding: EdgeInsets.all(20),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         new Text(
                  //           'Cetegories',
                  //           overflow: TextOverflow.ellipsis,
                  //           maxLines: 2,
                  //           style: new TextStyle(
                  //             fontSize: 20.0,
                  //             fontFamily: 'Roboto',
                  //             color: Colors.black.withOpacity(0.7),
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: EdgeInsets.only(
                  //             top: MediaQuery.of(context).viewInsets.top + 15,
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: _icons
                  //                 .asMap()
                  //                 .entries
                  //                 .map(
                  //                   (MapEntry map) => _buildIcon(map.key),
                  //                 )
                  //                 .toList(),
                  //           ),
                  //         )
                  //       ],
                  //     )),
                  // Divider(
                  //   height: 1,
                  //   indent: 15,
                  //   endIndent: 15,
                  //   thickness: 1,
                  //   color: Palette.greentheme.withOpacity(0.3),
                  // ),
                  DestinationCarousal(category: "Top Destination"),
                  Divider(
                    height: 1,
                    indent: 15,
                    endIndent: 15,
                    thickness: 1,
                    color: Palette.greentheme.withOpacity(0.3),
                  ),
                  DestinationCarousal(category: "Top Hotel"),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Color(0xff0d47a1)),
          child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.135,
            child: BottomNavigationBar(
              selectedFontSize:
                  MediaQuery.of(context).size.width * FontSize.textAppBar,
              unselectedFontSize:
                  MediaQuery.of(context).size.width * FontSize.textAppBar,
              unselectedItemColor: Colors.white,
              selectedItemColor: Colors.yellow[800],
              type: BottomNavigationBarType.fixed,
              currentIndex: _selected_Index,
              onTap: onTrapped,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  label: "หน้าหลัก",
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.luggage),
                  label: "การจอง",
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.person),
                  label: "ตั้งค่า",
                )
              ],
            ),
          ),
        ));
  }
}
