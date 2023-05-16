import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';
import 'package:intl/intl.dart';

class BottomSheetWidget extends StatefulWidget {
  final String title;
  final VoidCallback onClickedConfirm;
  final VoidCallback onClickedClose;
  final int totalRooms;

  const BottomSheetWidget(
      {required this.title,
      required this.onClickedConfirm,
      required this.onClickedClose,
      required this.totalRooms,
      Key? key})
      : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  // late DateTime startDate;
  // late DateTime endDate;
  String startDate = "";
  String endDate = "";
  int totalDate = 0;
  final bookingFilterCon = bookingFilterController();
  @override
  initState() {
    super.initState();
    bookingFilterCon.getStartDate().then((val) => setState(() {
          startDate = DateFormat('MMMMEd').format(val);
        }));
    bookingFilterCon.getEndDate().then((val) => setState(() {
          endDate = DateFormat('MMMMEd').format(val);
        }));
    bookingFilterCon.getTotalDate().then((val) => setState(() {
          totalDate = val;
        }));
    // totalDate = endDate.difference(startDate).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.03),
        height: MediaQuery.of(context).size.width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "ราคารวม",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "- ไม่มีข้อมูล - (" '${widget.totalRooms}' " ห้อง)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            "จองได้สูงสุด 6 ห้องต่อการจอง",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          Text(
                            "${startDate} - ${endDate} (${totalDate} คืน)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.025,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.015),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange,
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const TaxInvoice()),
                            // );
                            widget.onClickedConfirm();
                          },
                          child: Text(
                            'ถัดไป',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        )
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: <Widget>[
        //     const SizedBox(height: 25),
        //     Text(
        //       widget.title,
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        //     ),
        //     Text(
        //       '${widget.totalRooms}',
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //           fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        //     ),
        //     // const SizedBox(height: 16),
        //     // buildButtons(widget.onClickedClose, widget.onClickedConfirm),r
        //   ],
        // ),
        );
  }
}

Widget buildButtons(onClickClose, onClickedConfirm) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: onClickClose,
          child: Text("CLOSE"),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(shape: StadiumBorder()),
            onPressed: onClickedConfirm,
            child: Text("CONFIRM"))
      ],
    );
