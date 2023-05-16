import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';
import 'package:intl/intl.dart';
import 'package:thamturakit_mobile/models/room_model.dart';

class DetailInvoiceWidget extends StatefulWidget {
  final String hotalName;
  final String hotalAddress;
  final List<Rooms> rooms;
  const DetailInvoiceWidget(
      {required this.hotalName,
      required this.hotalAddress,
      required this.rooms});

  @override
  State<DetailInvoiceWidget> createState() => _DetailInvoiceWidget();
}

class _DetailInvoiceWidget extends State<DetailInvoiceWidget> {
  final bookingFilterCon = bookingFilterController();
  String startDate = "";
  String endDate = "";
  int totalDate = 0;
  // int roomPrice = widget.rooms.fold(0, (sum, item) => sum + item.roomPrice);
  @override
  initState() {
    super.initState();
    bookingFilterCon.getStartDate().then((val) => setState(() {
          startDate = DateFormat('yMd').format(val);
        }));
    bookingFilterCon.getEndDate().then((val) => setState(() {
          endDate = DateFormat('yMd').format(val);
        }));
    bookingFilterCon.getTotalDate().then((val) => setState(() {
          totalDate = val;
        }));
  }

  @override
  Widget build(BuildContext context) {
    _detailText(message) {
      return Text(
        "$message",
        style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * FontSize.textBody),
      );
    }

    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.width * 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.45,
                // decoration: BoxDecoration(color: Colors.blue),
                child: Image(
                  image: AssetImage('assets/images/paris.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.05,
                          bottom: MediaQuery.of(context).size.width * 0.02),
                      child: Text(
                        widget.hotalName,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textHeader),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.width * 0.02),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.place,
                              color: Colors.red[600],
                              size: MediaQuery.of(context).size.width *
                                  FontSize.icon,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text(
                              widget.hotalAddress,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody),
                            ),
                          ],
                        )),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.01,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.046),
                      height: MediaQuery.of(context).size.width * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _detailText("เช็คอิน"),
                              _detailText(startDate)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _detailText("เช็คเอาท์"),
                              _detailText(endDate)
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.02,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.046),
                      height: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _detailText("จำนวนคืน"),
                              _detailText("${totalDate} คืน")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _detailText("จำนวนยูนิต"),
                              _detailText("${widget.rooms.length} ยูนิต")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _detailText("ราคาทั้งหมด"),
                              _detailText(
                                  "B ${(widget.rooms.fold(0, (int sum, item) => sum + item.roomPrice)) * totalDate}")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _detailText("ราคา VAT (7%)"),
                              _detailText(
                                  "B ${((widget.rooms.fold(0, (int sum, item) => sum + item.roomPrice) * totalDate) * 0.07).toInt()}")
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.01,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.046),
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ราคาสุทธิ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textHeader),
                          ),
                          Text(
                            "B ${((widget.rooms.fold(0, (int sum, item) => sum + item.roomPrice)) * totalDate) + ((widget.rooms.fold(0, (int sum, item) => sum + item.roomPrice) * totalDate) * 0.07).toInt()}",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textHeader),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          ],
        ));
  }
}
