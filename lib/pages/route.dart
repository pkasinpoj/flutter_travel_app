// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/pages/login.dart';
import 'bookingfilter.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({Key? key, this.resultlocation}) : super(key: key);
  final resultlocation;
  @override
  _RouteScreenState createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  int _selected_Index = 0;
  PageController pageController = PageController();

  void onTrapped(int index) {
    setState(() {
      _selected_Index = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints.expand(),
        child: Scaffold(
          // backgroundColor: Colors.transparent,
          // appBar: AppBar(title: ThemeBar().getImageLogo()),
          body: PageView(
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              const BookingFilterScreen(
                whereFrom_: FontSize.toPage,
              ),
              Container(color: Colors.red),
              // Container(color: Colors.green),
              const LoginScreen(),
            ],
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Color(0xff08210d)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: BottomNavigationBar(
                selectedFontSize: 10.0,
                unselectedFontSize: 10.0,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.yellow[800],
                type: BottomNavigationBarType.fixed,
                currentIndex: _selected_Index,
                onTap: onTrapped,
                items: [
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.luggage),
                    label: "Bookings",
                  ),
                  // BottomNavigationBarItem(
                  //   icon: new Icon(Icons.airplane_ticket),
                  //   label: "Deals",
                  // ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.person),
                    label: "More",
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
