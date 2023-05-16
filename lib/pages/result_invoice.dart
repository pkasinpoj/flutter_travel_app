import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/models/invoice_model.dart';
import 'package:thamturakit_mobile/models/room_model.dart';
import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/pages/my_bookings.dart';
import 'package:thamturakit_mobile/widgets/invoice/detail_invoice_widget.dart';
import 'package:thamturakit_mobile/widgets/hotel_info_appbar.dart';

class ResultInvoice extends StatefulWidget {
  final String hotalName;
  final String hotalAddress;
  final List<Rooms> rooms;
  final InvoiceModel invoiceInfo;
  const ResultInvoice(
      {super.key,
      required this.hotalName,
      required this.hotalAddress,
      required this.rooms,
      required this.invoiceInfo});

  @override
  State<ResultInvoice> createState() => _ResultInvoiceState();
}

class _ResultInvoiceState extends State<ResultInvoice> {
  _detailText(message) {
    return Text(
      "$message",
      style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * FontSize.textBody),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HotelInfoAppBar(
        heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
        hotalName_: widget.hotalName,
      ),
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          DetailInvoiceWidget(
            hotalName: widget.hotalName,
            hotalAddress: widget.hotalAddress,
            rooms: widget.rooms,
          ),
          Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  Divider(
                    height: 0,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    // color: Colors.green,
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.width * 0.25,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "หมายเลขการจอง",
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textHeader,
                                fontWeight: FontWeight.w500),
                          ),
                          Text("9556506300",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textHeader,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.bluetheme)),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    // color: Colors.green,
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.width * 0.34,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.02),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("รอชำระเงิน",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textSubHeader,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.orange[700])),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: MediaQuery.of(context).size.width *
                                          FontSize.thinBorder,
                                      color: Palette.bluetheme),
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width *
                                          FontSize.borderRadius),
                                ),
                                child: InkWell(
                                  onTap: () => {},
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.width *
                                            0.009),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.download,
                                          color: Palette.bluetheme,
                                        ),
                                        Text("ดาวน์โหลดใบแจ้งหนี้",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody,
                                                color: Palette.bluetheme))
                                      ],
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.08),
                              child: Text(
                                  "เราได้ทำการส่งหมายเลขการจองไปที่อีเมลของท่านสามารถตรวจสอบได้ที่อีเมลของท่าน",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.035,
                                      color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              color: Colors.white,
              // height: MediaQuery.of(context).size.height * 1.2,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.12),
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.blue[700],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Flexible(
                          child: Text("ที่อยู่ใบกำกับภาษี/ใบเสร็จรับเงิน",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Palette.bluetheme,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textSubHeader)),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.53,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _detailText("ชื่อผู้ติดต่อ"),
                            _detailText(widget.invoiceInfo.nameTaxInvoice),
                            _detailText("เลขประจำตัวผู้เสียภาษี"),
                            _detailText(
                                widget.invoiceInfo.cardNumberTaxInvoice),
                            _detailText("สาขา"),
                            _detailText(
                                widget.invoiceInfo.branchNameTaxInvoice),
                            _detailText("ที่อยู่"),
                            _detailText(widget.invoiceInfo.addressTaxInvoice),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.blue[700],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Flexible(
                          child: Text("กรอกข้อมูลผู้ติดต่อ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Palette.bluetheme,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textSubHeader)),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.02,
                          horizontal: MediaQuery.of(context).size.width * 0.1),
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.53,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _detailText("ชื่อจริง"),
                            _detailText(widget.invoiceInfo.firstNameInvoice),
                            _detailText("นามสกุล"),
                            _detailText(widget.invoiceInfo.lastNameInvoice),
                            _detailText("อีเมล"),
                            _detailText(widget.invoiceInfo.emailInvoice),
                            _detailText("เบอร์โทร"),
                            _detailText(widget.invoiceInfo.telInvoice),
                            // _detailText("ความต้องการพิเศษ"),
                            // _detailText("- ไม่มีข้อมูล -"),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: Colors.blue[700],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Flexible(
                          child: Text("ข้อมูลยูนิต",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Palette.bluetheme,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textSubHeader)),
                        )
                      ],
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.rooms.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.04,
                              left: MediaQuery.of(context).size.width * 0.047,
                              right: MediaQuery.of(context).size.width * 0.047,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  // color: Colors.black,
                                  height:
                                      MediaQuery.of(context).size.width * 0.15,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                              child: Text(
                                            ("ประเภทห้อง"),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody),
                                          )),
                                          Flexible(
                                              child: Text(
                                            (widget.rooms[index].roomType),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody),
                                          )),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                              child: Text(
                                            ("จำนวนห้อง"),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody),
                                          )),
                                          Flexible(
                                              child: Text(
                                            ("1 ห้อง"),
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.textBody),
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // color: Colors.green,
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.width *
                                          0.02),
                                  child: GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 1,
                                      gridDelegate:
                                          new SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              // mainAxisExtent: 100.0,
                                              mainAxisSpacing: 15,
                                              crossAxisSpacing: 30,
                                              childAspectRatio:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      (MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          1.4)),
                                      itemBuilder:
                                          (BuildContext context, int cardId) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,

                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius
                                                      .circular(MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          FontSize
                                                              .radius_button),
                                                  border: Border.all(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              FontSize
                                                                  .radius_box)),
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .bedroom_child_outlined,
                                                      size:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.08,
                                                      color: Colors.black,
                                                    ),
                                                    Text(
                                                        "ยูนิต ${widget.rooms[index].roomId}",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                FontSize
                                                                    .textBody)),
                                                  ],
                                                ),
                                              ),
                                              // ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ))
        ]))),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * FontSize.bottomSheetHeight,
        color: Palette.bluetheme,
        child: InkWell(
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                // title: const Text('คุณต้องการกลับหน้าไหน'),
                // content: const Text('AlertDialog description'),
                actions: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('คุณต้องการกลับหน้าไหน?',
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.36,
                              child: TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.borderRadius),
                                            side: BorderSide(
                                                color: Palette.bluetheme)))),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Mybookings()),
                                ),
                                child: Text('หน้าประวัติการจอง',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                FontSize.textBody)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.36,
                              child: TextButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll<Color>(
                                            Palette.bluetheme),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              FontSize.borderRadius),
                                    ))),
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const BookingFilterScreen(
                                            whereFrom_: FontSize.toPage,
                                          )),
                                ),
                                child: Text(
                                  'หน้าหลัก',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          child: Center(
            child: Text(
              "เสร็จสิ้น",
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
