import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';
import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/widgets/single_info_appbar.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  int start_int = 0;
  int end_int = 100;
  int start_price = 0;
  int end_price = 0;
  double start = 0;
  double end = 100.0;
  final bookingFilterCon = bookingFilterController();
  @override
  initState() {
    super.initState();
    bookingFilterCon.getRoomPrice().then((val) => setState(() {
          start_price = val.startPrice;
          end_price = val.endPrice;
          start = (start_price / 50000) * 100;
          end = (end_price / 50000) * 100;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleInfoAppBar(
        name: "เลือกช่วงราคาที่ต้องการ",
        heightAppBar:
            MediaQuery.of(context).size.width * FontSize.bottomSheetHeight,
      ),
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.width * 0.49,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ต่ำสุด",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.128,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                FontSize.radius_box),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.03),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("B",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody)),
                                        Text("$start_price",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody))
                                      ],
                                    ),
                                  ),
                                  // color: Colors.black,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 0.3,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "สูงสุด",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.128,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                FontSize.radius_box),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.03),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "B",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  FontSize.textBody),
                                        ),
                                        Text("$end_price",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                  RangeSlider(
                    values: RangeValues(start, end),
                    labels: RangeLabels(start.toString(), end.toString()),
                    onChanged: (value) {
                      setState(() {
                        start = value.start;
                        end = value.end;
                        start_int = start.toInt();
                        end_int = end.toInt();
                        start_price = start_int * 500;
                        end_price = end_int * 500;
                      });
                    },
                    min: 0.0,
                    max: 100.0,
                  ),
                ],
              ),
            )),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * FontSize.bottomSheetHeight,
        color: Palette.bluetheme,
        child: InkWell(
          onTap: () {
            bookingFilterCon.setRoomPrice(start_price, end_price);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const BookingFilterScreen(whereFrom_: FontSize.toPage)),
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

// void setDestination(start_price, end_price) async {
//   //Hive.init('somePath') -> not needed in browser

//   var box = await Hive.openBox('testBox');
//   box.put('price', {'start_price': start_price, 'end_price': end_price});
//   // final name_box = await box.get('name');
//   // print('Loki is ${name_box?['name']} years old.');
// }
