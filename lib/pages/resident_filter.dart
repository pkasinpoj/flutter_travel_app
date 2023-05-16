import 'package:hive_flutter/hive_flutter.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';
import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/widgets/single_info_appbar.dart';

import '/config/font_size.dart';

class ResidentFilter extends StatefulWidget {
  final String whereFrom_;
  const ResidentFilter({super.key, required this.whereFrom_});

  @override
  State<ResidentFilter> createState() => _ResidentFilterState();
}

class _ResidentFilterState extends State<ResidentFilter> {
  int adult = 0;
  int children = 0;
  int rooms = 0;
  final bookingFilterCon = bookingFilterController();
  // ChangeGender(String _selectedgender, int sort_by) {
  //   setGender(_selectedgender).then((val) => setState(() {
  //         _gender = val;
  //         _sort_by = sort_by;
  //       }));
  // }
  _ResidentFilterState() {
    bookingFilterCon.getAmountInfo().then((val) => setState(() {
          adult = val.adultAmount;
          children = val.childAmount;
          rooms = val.roomAmount;
          // print(val.childAmount);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleInfoAppBar(
        name: "ผู้เข้าพัก",
        heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.width * 0.326,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.width * 0.16,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ผู้ใหญ่",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width *
                              FontSize.textBody,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => {
                                setState(
                                  () {
                                    if (adult > 0) {
                                      adult = adult - 1;
                                    }
                                  },
                                )
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.mathematical_notation,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text(
                              "$adult",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            InkWell(
                              onTap: () => {
                                setState(
                                  () {
                                    adult = adult + 1;
                                  },
                                )
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.mathematical_notation,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.width * 0.16,
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "เด็ก",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width *
                              FontSize.textBody,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(
                                  () {
                                    if (children > 0) {
                                      children = children - 1;
                                    }
                                  },
                                );
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.mathematical_notation,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text(
                              "$children",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody,
                                // fontWeight: FontWeight.bold
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  children = children + 1;
                                });
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.mathematical_notation,
                                  // fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // Container(
              //   color: Colors.white,
              //   height: MediaQuery.of(context).size.width * 0.16,
              //   child: Container(
              //     margin: EdgeInsets.symmetric(
              //         horizontal: MediaQuery.of(context).size.width * 0.06),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text(
              //           "จำนวนห้อง",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: MediaQuery.of(context).size.width *
              //                 FontSize.textBody,
              //             // fontWeight: FontWeight.bold
              //           ),
              //         ),
              //         Container(
              //           width: MediaQuery.of(context).size.width * 0.3,
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               InkWell(
              //                 onTap: () {
              //                   setState(
              //                     () {
              //                       if (rooms > 0) {
              //                         rooms = rooms - 1;
              //                       }
              //                     },
              //                   );
              //                 },
              //                 child: Text(
              //                   "-",
              //                   style: TextStyle(
              //                     color: Colors.grey,
              //                     fontSize: MediaQuery.of(context).size.width *
              //                         FontSize.mathematical_notation,
              //                     // fontWeight: FontWeight.bold
              //                   ),
              //                 ),
              //               ),
              //               Text(
              //                 "$rooms",
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: MediaQuery.of(context).size.width *
              //                       FontSize.textBody,
              //                   // fontWeight: FontWeight.bold
              //                 ),
              //               ),
              //               InkWell(
              //                 onTap: () {
              //                   setState(() {
              //                     rooms = rooms + 1;
              //                   });
              //                 },
              //                 child: Text(
              //                   "+",
              //                   style: TextStyle(
              //                     color: Colors.grey,
              //                     fontSize: MediaQuery.of(context).size.width *
              //                         FontSize.mathematical_notation,
              //                     // fontWeight: FontWeight.bold
              //                   ),
              //                 ),
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * FontSize.bottomSheetHeight,
        color: Palette.bluetheme,
        child: InkWell(
          onTap: () {
            bookingFilterCon.setAdultAmount(adult);
            bookingFilterCon.setChildAmount(children);
            bookingFilterCon.setRoomAmount(rooms);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookingFilterScreen(
                        whereFrom_: widget.whereFrom_,
                      )),
            );
          },
          child: Center(
            child: Text(
              "ยืนยันข้อมูล",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize:
                      MediaQuery.of(context).size.width * FontSize.textBody),
            ),
          ),
        ),
      ),
    );
  }
}

// void testp() async {
//   //Hive.init('somePath') -> not needed in browser
//   print("delete");
//   var box = await Hive.openBox('testBox');
//   await box.delete('name');
// }

Widget _buildChatPage() {
  return ValueListenableBuilder(
    valueListenable: Hive.box('testBox').listenable(),
    builder: (context, box, widget) {
      return Text(
        box.get('name')?['name'],
        style: TextStyle(
            color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold),
      );
    },
  );
}
