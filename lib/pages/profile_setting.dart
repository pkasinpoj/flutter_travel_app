import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/widgets/single_info_appbar.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final _passwordKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleInfoAppBar(
        name: "บัญชีของฉัน",
        heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
      ),
      body: SafeArea(
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  height: MediaQuery.of(context).size.width * 0.75,
                  child: Form(
                    // ใช้งาน Form
                    key: _passwordKey, // กำหนด key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // กำหนด widget ที่จะใช้งานกับฟอร์ม
                        Text("ข้อมูลส่วนตัว",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textSubHeader)),
                        Text("ชื่อจริง",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody)),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.025),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: MediaQuery.of(context).size.width *
                                      FontSize.thinBorder,
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
                              errorBorder: OutlineInputBorder(
                                // เมื่อ focus
                                borderSide: BorderSide(
                                    width: MediaQuery.of(context).size.width *
                                        FontSize.thinBorder,
                                    color: Colors.red),
                              ),
                              hintText: "กรุณากรอกรหัสผ่านปัจจุบัน",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        Text("นามสกุล",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody)),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.025),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: MediaQuery.of(context).size.width *
                                      FontSize.thinBorder,
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
                              errorBorder: OutlineInputBorder(
                                // เมื่อ focus
                                borderSide: BorderSide(
                                    width: MediaQuery.of(context).size.width *
                                        FontSize.thinBorder,
                                    color: Colors.red),
                              ),
                              hintText: "รหัสผ่านใหม่",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                        Text("อีเมล",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textBody)),
                        TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width *
                                          0.025),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: MediaQuery.of(context).size.width *
                                      FontSize.thinBorder,
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
                              errorBorder: OutlineInputBorder(
                                // เมื่อ focus
                                borderSide: BorderSide(
                                    width: MediaQuery.of(context).size.width *
                                        FontSize.thinBorder,
                                    color: Colors.red),
                              ),
                              hintText: "ยืนยันรหัสผ่านใหม่",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * FontSize.bottomSheetHeight,
        color: Palette.bluetheme,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Text(
              "ยืนยันการเปลี่ยนข้อมูลส่วนตัว",
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
