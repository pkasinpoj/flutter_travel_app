import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/pages/account_setting.dart';
import 'package:thamturakit_mobile/pages/home.dart';
import 'package:thamturakit_mobile/widgets/custom_list_Item.dart';

class Mybookings extends StatefulWidget {
  const Mybookings({super.key});

  @override
  State<Mybookings> createState() => _MybookingsState();
}

class _MybookingsState extends State<Mybookings> {
  int _selected_Index = 1;
  List _selected_Page = [HomeScreen(), Mybookings(), AccountSetting()];
  int _booking_status = 0;

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

  _StatusRoom(message, status) {
    return InkWell(
      onTap: () {
        setState(() {
          _booking_status = status;
        });
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: status == _booking_status ? Colors.white : Colors.blue[800],
          ),
          child: Center(
              child: Text(message,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          FontSize.textSubHeader,
                      // fontWeight: FontWeight.bold,
                      color: status == _booking_status
                          ? Palette.bluetheme
                          : Colors.white)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
              MediaQuery.of(context).size.width * FontSize.app_bar),
          child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Text(
                "การจองของฉัน",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width *
                        FontSize.textHeader),
                overflow: TextOverflow.ellipsis,
              )),
        ),
        body: SafeArea(
            child: Container(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.width * 0.15,
            child: Row(
              children: [
                Container(child: _StatusRoom("การจอง", 0)),
                Container(
                  child: _StatusRoom("ประวัติการจอง", 1),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Column(
                        // color: Colors.red,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.04),
                            child: CustomListItem(
                              thumbnail: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.pink,
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: 'โรงแรมดาราเทวี เชียงใหม่',
                              subtitle:
                                  'Flutter continues to improve and expand its horizons. '
                                  'This text should max out at two lines and clip',
                              author: 'Dash',
                              publishDate: 'Dec 28',
                              readDuration: '5 mins',
                            ),
                          ),
                          Divider(
                            height: 0,
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ]),
                  );
                }),
          )
        ]))),
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
