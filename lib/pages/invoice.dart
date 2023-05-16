import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/form/invoice_form.dart';
import 'package:thamturakit_mobile/models/invoice_model.dart';
import 'package:thamturakit_mobile/models/room_model.dart';
import 'package:thamturakit_mobile/pages/consent_page.dart';
import 'package:thamturakit_mobile/pages/payment_list.dart';
import 'package:thamturakit_mobile/pages/result_invoice.dart';
import 'package:thamturakit_mobile/widgets/invoice/detail_invoice_widget.dart';
import 'package:thamturakit_mobile/widgets/hotel_info_appbar.dart';

class Invoice extends StatefulWidget {
  final String hotalName;
  final String hotalAddress;
  final List<Rooms> rooms;
  const Invoice(
      {super.key,
      required this.hotalName,
      required this.hotalAddress,
      required this.rooms});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final _taxInvoiceKey = GlobalKey<FormState>();
  final _addressKey = GlobalKey<FormState>();
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.grey;
    }
    return Palette.bluetheme;
  }

  // _detailText(message) {
  //   return Text(
  //     "$message",
  //     style: TextStyle(
  //         fontSize: MediaQuery.of(context).size.width * FontSize.textBody),
  //   );

  // }
  InvoiceForm invoiceForm = InvoiceForm();
  InvoiceModel invoiceInfo = InvoiceModel(
      nameTaxInvoice: "- ไม่มีข้อมูล -",
      cardNumberTaxInvoice: "- ไม่มีข้อมูล -",
      branchNameTaxInvoice: "- ไม่มีข้อมูล -",
      addressTaxInvoice: "- ไม่มีข้อมูล -",
      firstNameInvoice: "- ไม่มีข้อมูล -",
      lastNameInvoice: "- ไม่มีข้อมูล -",
      cardNumberInvoice: "- ไม่มีข้อมูล -",
      emailInvoice: "- ไม่มีข้อมูล -",
      telInvoice: "- ไม่มีข้อมูล -");
  @override
  Widget build(BuildContext context) {
    Widget setMessageTextFormField(labelText, hintText, radiusBorder, con) =>
        TextFormField(
          controller: con,
          validator: (value) => (value == null || value.isEmpty) ? '' : null,
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(height: 0),
              contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: radiusBorder,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // เมื่อ focus
                borderSide: BorderSide(width: radiusBorder),
              ),
              enabledBorder: OutlineInputBorder(
                // สถานะปกติ
                borderSide: BorderSide(width: radiusBorder), // กำหนดสีในนี้ได้
              ),
              labelText: labelText,
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always),
        );
    return Scaffold(
      appBar: HotelInfoAppBar(
        heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
        hotalName_: widget.hotalName,
      ),
      body: SafeArea(
          child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DetailInvoiceWidget(
                hotalName: widget.hotalName,
                hotalAddress: widget.hotalAddress,
                rooms: widget.rooms,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.width * 0.02),
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info,
                                  color: Colors.blue[700],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                                Flexible(
                                  child: Text(
                                      "ที่อยู่ใบกำกับภาษี/ใบเสร็จรับเงิน",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Palette.bluetheme,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              FontSize.textBody)),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.33,
                            child: Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                ),
                                Flexible(
                                  child: Text("ต้องการใบกำกับภาษี",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[850],
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              FontSize.textBody)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        // margin: EdgeInsets.all(15),
                        child: isChecked
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.65,
                                child: Form(
                                  // ใช้งาน Form
                                  key: _taxInvoiceKey, // กำหนด key
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      // กำหนด widget ที่จะใช้งานกับฟอร์ม
                                      setMessageTextFormField(
                                          "ชื่อ-นามสกุล / นิติบุคคล",
                                          "กรุณากรอกชื่อ-นามสกุล / นิติบุคคล",
                                          MediaQuery.of(context).size.width *
                                              FontSize.radius_box,
                                          invoiceForm.nameTaxInvoice),
                                      setMessageTextFormField(
                                          "เลขที่บัตรประชาชน/เลขประจำตัวผู้เสียภาษี",
                                          "กรุณาเลขที่บัตรประชาชน/เลขประจำตัวผู้เสียภาษี",
                                          MediaQuery.of(context).size.width *
                                              FontSize.radius_box,
                                          invoiceForm.cardNumberTaxInvoice),
                                      setMessageTextFormField(
                                          "สาขา",
                                          "กรุณากรอกสาขา (ไม่บังคับ)",
                                          MediaQuery.of(context).size.width *
                                              FontSize.radius_box,
                                          invoiceForm.branchNameTaxInvoice),
                                      setMessageTextFormField(
                                          "ที่อยู่",
                                          "กรุณากรอกที่อยู่",
                                          MediaQuery.of(context).size.width *
                                              FontSize.radius_box,
                                          invoiceForm.addressTaxInvoice),
                                    ],
                                  ),
                                ),
                              )
                            : null,
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
                            child: Text("กรุณากรอกข้อมูลผู้ติดต่อ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Palette.bluetheme,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody)),
                          )
                        ],
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 15),

                        height: MediaQuery.of(context).size.width * 0.65,
                        child: Form(
                          // ใช้งาน Form
                          key: _addressKey, // กำหนด key
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // กำหนด widget ที่จะใช้งานกับฟอร์ม
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: setMessageTextFormField(
                                        "ชื่อ",
                                        "กรุณากรอกชื่อจริง",
                                        MediaQuery.of(context).size.width *
                                            FontSize.radius_box,
                                        invoiceForm.firstNameInvoice),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: setMessageTextFormField(
                                        "นามสกุล",
                                        "กรุณากรอกนามสกุล",
                                        MediaQuery.of(context).size.width *
                                            FontSize.radius_box,
                                        invoiceForm.lastNameInvoice),
                                  ),
                                ],
                              ),
                              setMessageTextFormField(
                                  "เลขที่บัตรประชาชน",
                                  "กรุณากรอก เลขที่บัตรประชาชน",
                                  MediaQuery.of(context).size.width *
                                      FontSize.radius_box,
                                  invoiceForm.cardNumberInvoice),
                              setMessageTextFormField(
                                  "Email",
                                  "กรุณากรอกEmail ",
                                  MediaQuery.of(context).size.width *
                                      FontSize.radius_box,
                                  invoiceForm.emailInvoice),
                              setMessageTextFormField(
                                  "เบอร์โทร",
                                  "กรุณากรอกเบอร์โทร ",
                                  MediaQuery.of(context).size.width *
                                      FontSize.radius_box,
                                  invoiceForm.telInvoice),
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
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody)),
                          )
                        ],
                      ),
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.rooms.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.width * 0.04,
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.047),
                              child: Column(
                                children: [
                                  Container(
                                    // color: Colors.black,
                                    height: MediaQuery.of(context).size.width *
                                        0.15,
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
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          FontSize.textBody),
                                            )),
                                            Flexible(
                                                child: Text(
                                              (widget.rooms[index].roomType),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
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
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          FontSize.textBody),
                                            )),
                                            Flexible(
                                                child: Text(
                                              ("1 ห้อง"),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
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
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 1,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
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
                                                            1.05)),
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
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            FontSize
                                                                .radius_box)),
                                                child: Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .bedroom_child_outlined,
                                                        size: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.08,
                                                        color: Colors.black,
                                                      ),
                                                      Text(
                                                          "ยูนิต ${widget.rooms[index].roomId}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
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
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ConsentPage()),
                                                  );
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius
                                                          .circular(MediaQuery
                                                                      .of(
                                                                          context)
                                                                  .size
                                                                  .width *
                                                              FontSize
                                                                  .radius_button),
                                                      border: Border.all(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              FontSize
                                                                  .radius_box,
                                                          color: Colors.blue)),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.01),
                                                    child: Center(
                                                        child: Text(
                                                      "ลงทะเบียนห้อง",
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              FontSize
                                                                  .textBody),
                                                    )),
                                                  ),
                                                ),
                                              )
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
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.width * 0.27,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentList()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.monetization_on_outlined,
                                    color: Colors.blue[700],
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  Text("เลือกวิธีการชำระเงิน",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Palette.bluetheme,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              FontSize.textBody)),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: MediaQuery.of(context).size.width *
                                  FontSize.icon,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.width * 0.008,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1),
                          child: Text(
                            "ชำระด้วยเงินสด",
                            style: TextStyle(
                                // fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              )
            ],
          ),
        ),
      )),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * 0.13,
        color: Palette.bluetheme,
        child: InkWell(
          onTap: () {
            if (isChecked) {
              if (_taxInvoiceKey.currentState!.validate() &&
                  _addressKey.currentState!.validate()) {
                setState(() {
                  invoiceInfo.nameTaxInvoice = invoiceForm.nameTaxInvoice.text;
                  invoiceInfo.cardNumberTaxInvoice =
                      invoiceForm.cardNumberTaxInvoice.text;
                  invoiceInfo.branchNameTaxInvoice =
                      invoiceForm.branchNameTaxInvoice.text;
                  invoiceInfo.addressTaxInvoice =
                      invoiceForm.addressTaxInvoice.text;
                  invoiceInfo.firstNameInvoice =
                      invoiceForm.firstNameInvoice.text;
                  invoiceInfo.lastNameInvoice =
                      invoiceForm.lastNameInvoice.text;
                  invoiceInfo.cardNumberInvoice =
                      invoiceForm.cardNumberInvoice.text;
                  invoiceInfo.emailInvoice = invoiceForm.emailInvoice.text;
                  invoiceInfo.telInvoice = invoiceForm.telInvoice.text;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultInvoice(
                            hotalName: widget.hotalName,
                            hotalAddress: widget.hotalAddress,
                            rooms: widget.rooms,
                            invoiceInfo: invoiceInfo,
                          )),
                );
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Processing Data')),
                // );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                        height: MediaQuery.of(context).size.width * 0.062,
                        child: Text('กรุณากรอกข้อมูลให้ครบ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody))),
                    backgroundColor: Colors.red,
                  ),
                );
              }
              //หากผ่าน
              // แสดงข้อความจำลอง ใน snackbar
            } else {
              if (_addressKey.currentState!.validate()) {
                setState(() {
                  invoiceInfo.firstNameInvoice =
                      invoiceForm.firstNameInvoice.text;
                  invoiceInfo.lastNameInvoice =
                      invoiceForm.lastNameInvoice.text;
                  invoiceInfo.cardNumberInvoice =
                      invoiceForm.cardNumberInvoice.text;
                  invoiceInfo.emailInvoice = invoiceForm.emailInvoice.text;
                  invoiceInfo.telInvoice = invoiceForm.telInvoice.text;
                });
                print(invoiceInfo.firstNameInvoice);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultInvoice(
                            hotalName: widget.hotalName,
                            hotalAddress: widget.hotalAddress,
                            rooms: widget.rooms,
                            invoiceInfo: invoiceInfo,
                          )),
                );
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Processing Data')),
                // );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Container(
                        height: MediaQuery.of(context).size.width * 0.062,
                        child: Text('กรุณากรอกข้อมูลให้ครบ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody))),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            }
          },
          child: Center(
            child: Text(
              "ตกลง",
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
