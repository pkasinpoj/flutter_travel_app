import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/pages/home.dart';
import 'package:thamturakit_mobile/widgets/disable_scroll_behavior.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _loginScreen();
}

class _loginScreen extends State<LoginScreen> {
  final _authenKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool isChecked = false;

  String _password = "";

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // void testp() async {
  //   //Hive.init('somePath') -> not needed in browser

  //   var box = await Hive.openBox('testBox');
  //   box.put('name', {'name': 'Fluffy', 'age': 4});
  //   final name_box = await box.get('name');
  //   print('Loki is ${name_box?['name']} years old.');
  // }

  @override
  Widget build(BuildContext context) {
    Widget setMessageTextFormField(hintText, icon) => TextFormField(
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
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: icon),
        );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06,
                vertical: MediaQuery.of(context).size.width * 0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                    //clipBehavior: Clip.antiAlias,
                    child: Image.asset("assets/images/logo_go_travel.png",
                        height: MediaQuery.of(context).size.width * 0.25,
                        width: MediaQuery.of(context).size.width * 0.7,
                        fit: BoxFit.fitWidth)),
                Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "เข้าสู่ระบบ",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textSubHeader,
                            fontWeight: FontWeight.w500,
                            color: Palette.bluetheme),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(vertical: 15),

                        height: MediaQuery.of(context).size.width * 0.36,
                        child: Form(
                          // ใช้งาน Form
                          key: _authenKey, // กำหนด key
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // กำหนด widget ที่จะใช้งานกับฟอร์ม

                              setMessageTextFormField(
                                  "ระบุอีเมล์", Icon(Icons.person)),
                              TextFormField(
                                validator: (value) =>
                                    (value == null || value.isEmpty)
                                        ? ''
                                        : null,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  errorStyle: const TextStyle(height: 0),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                FontSize.thinBorder),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    // สถานะปกติ
                                    borderSide: BorderSide(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            FontSize
                                                .thinBorder), // กำหนดสีในนี้ได้
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    // เมื่อ focus
                                    borderSide: BorderSide(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                FontSize.thinBorder,
                                        color: Colors.red),
                                  ),
                                  hintText: "ระบุรหัสผ่าน",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  prefixIcon: Icon(Icons.key),
                                  suffixIcon: InkWell(
                                    onTap: _toggle,
                                    child: Icon(
                                      _obscureText
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: MediaQuery.of(context).size.width *
                                          FontSize.icon,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () => {},
                                child: Text(
                                  "ส่่งอีเมล์ยืนยันอีกครั้ง",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody),
                                )),
                            Text("หรือ",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody)),
                            InkWell(
                                onTap: () => {},
                                child: Text("ลืมรหัสผ่าน?",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                FontSize.textBody)))
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.14,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("หากท่านยังไม่มีบัญชี",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody)),
                              InkWell(
                                  onTap: () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()),
                                        )
                                      },
                                  child: Text(
                                    "สร้างบัญชี",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                FontSize.textBody),
                                  ))
                            ]),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Palette.bluetheme,
                          onPrimary: Colors.white,
                          shadowColor: Colors.blueAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width *
                                      FontSize.radius_button)),
                          minimumSize: Size(
                              double.infinity,
                              MediaQuery.of(context).size.width *
                                  FontSize.button), //////// HERE
                        ),
                        onPressed: () => {
                          // if (isChecked)
                          //   {
                          if (_authenKey.currentState!.validate())
                            {
                              // Navigator.pop(context)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              )
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   SnackBar(
                              //       content: Text(
                              //     'กำลังเข้าสู่ระบบ',
                              //     style: TextStyle(
                              //         fontSize:
                              //             MediaQuery.of(context).size.width *
                              //                 FontSize.textBody),
                              //   )),
                              // )
                            }
                          else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.062,
                                      child: Text('กรุณากรอกข้อมูลให้ครบ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  FontSize.textBody))),
                                  backgroundColor: Colors.red,
                                ),
                              )
                            }
                          //หากผ่าน
                          // แสดงข้อความจำลอง ใน snackbar
                          // }
                          // else
                          //   {
                          //     if (_authenKey.currentState!.validate())
                          //       {
                          //         ScaffoldMessenger.of(context)
                          //             .showSnackBar(
                          //           const SnackBar(
                          //               content: Text('Processing Data')),
                          //         )
                          //       }
                          //   }
                        },
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width *
                                  FontSize.textBody),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // ),
        // ),
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
