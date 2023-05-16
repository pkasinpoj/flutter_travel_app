import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/widgets/lists/gender_list_item.dart';
import 'package:thamturakit_mobile/widgets/lists/nationality_list_item.dart';
import 'package:thamturakit_mobile/widgets/single_info_appbar.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class GuestInfo extends StatefulWidget {
  const GuestInfo({super.key});

  @override
  State<GuestInfo> createState() => _GuestInfoState();
}

class _GuestInfoState extends State<GuestInfo> {
  DateTime _startdate = DateTime.now();
  String? selectedValue = null;
  final _formKey = GlobalKey<FormState>();
  Widget _birthDayPicket() {
    return InkWell(
      onTap: () async {
        DateTime? newDate = await showDatePicker(
          context: context,
          initialDate: _startdate,
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (newDate == null) return;
        setState(() => {
              _startdate = newDate,
            });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: MediaQuery.of(context).size.width * FontSize.thinBorder,
          ),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.009),
        ),
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.025,
            horizontal: MediaQuery.of(context).size.width * 0.025),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "${_startdate.day}/${_startdate.month}/${_startdate.year}",
                style: TextStyle(
                    fontSize:
                        MediaQuery.of(context).size.width * FontSize.textBody,
                    color: Colors.black),
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget setMessageTextFormField(hintText) => TextFormField(
          validator: (value) => (value == null || value.isEmpty) ? '' : null,
          decoration: InputDecoration(
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              errorStyle: TextStyle(height: 0),
              contentPadding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width * 0.03,
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width:
                      MediaQuery.of(context).size.width * FontSize.thinBorder,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                // เมื่อ focus
                borderSide: BorderSide(
                    width: MediaQuery.of(context).size.width *
                        FontSize.thinBorder),
              ),
              enabledBorder: OutlineInputBorder(
                // สถานะปกติ
                borderSide: BorderSide(
                    width: MediaQuery.of(context).size.width *
                        FontSize.thinBorder), // กำหนดสีในนี้ได้
              ),
              hintText: hintText,
              floatingLabelBehavior: FloatingLabelBehavior.always),
        );
    return Scaffold(
        appBar: SingleInfoAppBar(
            name: "ข้อมูลผู้เข้าพัก",
            heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar),
        body: SafeArea(
          child: Container(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.045),
                child: Container(
                  height: double.infinity,
                  child: ListView(
                    children: [
                      Form(
                        // ใช้งาน Form
                        key: _formKey, // กำหนด key
                        child: Container(
                          height: MediaQuery.of(context).size.width * 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // กำหนด widget ที่จะใช้งานกับฟอร์ม
                              Text("ข้อมูลผู้เข้าพัก",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textSubHeader)),
                              Text("เลขที่บัตรประชาชน / เลขพาสปอร์ต",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              setMessageTextFormField(
                                  "กรุณากรอกเลขที่บัตรประชาชน / เลขพาสปอร์ต"),
                              Text("ชื่อจริง",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              setMessageTextFormField("กรุณากรอกชื่อจริง"),
                              Text("นามสกุล",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              setMessageTextFormField("กรุณากรอกนามสกุล"),
                              Text("เพศ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              GenderListItem(),
                              Text("วันเกิด",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              _birthDayPicket(),
                              Text("สัญชาติ",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 128, 125, 125),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              NationalityListItem(),
                              Text("เบอร์โทรศัพท์",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              setMessageTextFormField("กรุณาเบอร์โทรศัพท์"),
                              Text("อีเมล",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              setMessageTextFormField("กรุณากรอกอีเมล์"),
                              Text(
                                  "ช่องทางการติดต่ออื่นๆ (Line ID, We Chat ID,อื่น",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              setMessageTextFormField(
                                  "กรุณากรอกช่องทางการติดต่ออื่นๆ"),
                              SizedBox(
                                height: MediaQuery.of(context).size.width *
                                    FontSize.bottomSheetHeight,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        bottomSheet: Container(
          height:
              MediaQuery.of(context).size.width * FontSize.bottomSheetHeight,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.015),
                  ),
                  child: Center(
                    child: Text(
                      "ไม่ยอมรับ",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width *
                              FontSize.textBody),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                            height: MediaQuery.of(context).size.width * 0.062,
                            child: Text('กรุณากรอกข้อมูลให้ครบ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody))),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  // Navigator.of(context).pop();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: Palette.bluetheme,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.015),
                  ),
                  child: Center(
                    child: Text(
                      "ยอมรับ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width *
                              FontSize.textBody),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
