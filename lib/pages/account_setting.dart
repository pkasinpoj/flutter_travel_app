import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/pages/home.dart';
import 'package:thamturakit_mobile/pages/login.dart';
import 'package:thamturakit_mobile/pages/profile_setting.dart';
import 'package:thamturakit_mobile/pages/security_setting.dart';
import 'package:thamturakit_mobile/widgets/single_info_appbar.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleInfoAppBar(
        name: "ตั้งค่า",
        heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
      ),
      body: SafeArea(
        child: Container(
          // height: MediaQuery.of(context).size.width * 0.485,
          height: MediaQuery.of(context).size.width * 0.32,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => const LoginScreen()),
              //     );
              //   },
              //   child: Container(
              //     color: Colors.white,
              //     height: MediaQuery.of(context).size.width * 0.155,
              //     child: Container(
              //       margin: EdgeInsets.symmetric(
              //           horizontal: MediaQuery.of(context).size.width * 0.06),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Container(
              //             child: Row(
              //               children: [
              //                 Icon(
              //                   // Icons.public_outlined,
              //                   Icons.login,
              //                   size: MediaQuery.of(context).size.width * 0.065,
              //                 ),
              //                 SizedBox(
              //                   width:
              //                       MediaQuery.of(context).size.width * 0.025,
              //                 ),
              //                 Text(
              //                   "ทดสอบ login",
              //                   style: TextStyle(
              //                       color: Colors.black,
              //                       fontSize:
              //                           MediaQuery.of(context).size.width *
              //                               FontSize.textBody,
              //                       fontWeight: FontWeight.w500),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Icon(Icons.arrow_forward_ios_rounded),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecuritySetting()),
                  );
                },
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width * 0.155,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.key_outlined,
                                size: MediaQuery.of(context).size.width * 0.065,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025,
                              ),
                              Text(
                                "ความปลอดภัย",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileSetting()),
                  );
                },
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width * 0.155,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_pin_sharp,
                                size: MediaQuery.of(context).size.width * 0.065,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025,
                              ),
                              Text(
                                "บัญชีของฉัน",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textBody,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * FontSize.bottomSheetHeight,
        color: Colors.white,
        child: InkWell(
          onTap: () {
            // Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => LoginScreen())));
          },
          child: Center(
            child: Text(
              "ออกจากระบบ",
              style: TextStyle(
                  color: Colors.grey,
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
