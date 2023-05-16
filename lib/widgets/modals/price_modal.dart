import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';

class PriceModal extends StatefulWidget {
  const PriceModal({super.key});

  @override
  State<PriceModal> createState() => _PriceModalState();
}

class _PriceModalState extends State<PriceModal> {
  final bookingFilterCon = bookingFilterController();
  int start_price = 0;
  int end_price = 0;
  double start = 0.0;
  double end = 100.0;
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
    return GestureDetector(
      onTap: () {
        priceModal();
      },
      child: Row(
        children: [
          Text(
            "ราคา",
            style: TextStyle(
                fontSize:
                    MediaQuery.of(context).size.width * FontSize.textBody),
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

  void priceModal() {
    int start_int = 0;
    int end_int = 100;

    Future<void> future = showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.1),
            topRight: Radius.circular(MediaQuery.of(context).size.width * 0.1)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Container(
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                  height: MediaQuery.of(context).size.width * 0.46,
                  // color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.25,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.23,
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "ต่ำสุด",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              FontSize.textBody,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.125,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  FontSize.radius_box),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("B",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              FontSize
                                                                  .textBody)),
                                              Text("$start_price",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              FontSize
                                                                  .textBody))
                                            ],
                                          ),
                                        ),
                                        // color: Colors.black,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.width * 0.23,
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "สูงสุด",
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              FontSize.textBody,
                                          // fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.125,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.002),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "B",
                                                style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            FontSize.textBody),
                                              ),
                                              Text("$end_price",
                                                  style: TextStyle(
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              FontSize
                                                                  .textBody))
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
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Palette.bluetheme,
                            onPrimary: Colors.white,
                            // shadowColor: Colors.greenAccent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            minimumSize: Size(
                                double.infinity,
                                MediaQuery.of(context).size.width *
                                    FontSize.button), //////// HERE
                          ),
                          onPressed: () => {Navigator.pop(context)},
                          child: Text(
                            'ยืนยัน',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody),
                          ),
                        )
                      ],
                    ),
                  )));
        });
      },
    );
  }
}
