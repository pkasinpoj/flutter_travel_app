import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/widgets/single_info_appbar.dart';

class SecuritySetting extends StatefulWidget {
  const SecuritySetting({super.key});

  @override
  State<SecuritySetting> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<SecuritySetting> {
  final _passwordKey = GlobalKey<FormState>();
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
                  horizontal: MediaQuery.of(context).size.width * 0.025),
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
        name: "ความปลอดภัย",
        heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
      ),
      body: SafeArea(
        child: Container(
            // height: MediaQuery.of(context).size.height * 0.23,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 15),

                    height: MediaQuery.of(context).size.width * 0.75,
                    child: Form(
                      // ใช้งาน Form
                      key: _passwordKey, // กำหนด key
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // กำหนด widget ที่จะใช้งานกับฟอร์ม
                          Text("การเปลี่ยนรหัสผ่าน",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textSubHeader)),
                          Text("รหัสผ่านปัจจุบัน",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody)),
                          setMessageTextFormField("กรุณากรอกรหัสผ่านปัจจุบัน"),
                          Text("รหัสผ่านใหม่",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody)),
                          setMessageTextFormField("รหัสผ่านใหม่"),
                          Text("ยืนยันรหัสผ่านใหม่",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody)),
                          setMessageTextFormField("ยืนยันรหัสผ่านใหม่")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * 0.13,
        color: Palette.bluetheme,
        child: InkWell(
          onTap: () {
            if (_passwordKey.currentState!.validate()) {
              Navigator.of(context).pop();
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

void setDestination(start_price, end_price) async {
  //Hive.init('somePath') -> not needed in browser

  var box = await Hive.openBox('testBox');
  box.put('price', {'start_price': start_price, 'end_price': end_price});
  // final name_box = await box.get('name');
  // print('Loki is ${name_box?['name']} years old.');
}
