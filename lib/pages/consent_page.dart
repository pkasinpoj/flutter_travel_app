import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/pages/guest_info.dart';
import 'package:thamturakit_mobile/widgets/consent_detail.dart';
import 'package:thamturakit_mobile/widgets/single_info_appbar.dart';

class ConsentPage extends StatefulWidget {
  const ConsentPage({super.key});

  @override
  State<ConsentPage> createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  List detailText = [
    "“ข้อมูลส่วนบุคคล” หมายถึง ข้อมูลเกี่ยวกับบุคคลซึ่งทำให้ สามารถระบุตัวบุคคลนั้นได้ไม่ว่าทางตรงหรือทางอ้อม แต่ไม่ รวมถึงข้อมูลผู้ถึงแก่กรรมโดยเฉพาะ",
    "1.1 ข้อมูลส่วนบุคคลที่ท่านมอบให้แก่ธรรมธุรกิจโดยตรง ได้แก่ ชื่อ-สกุล ข้อมูลจดหมายอิเล็กทรอนิกส์ (Email) กำหนดรหัสผ่าน หมายเลขโทรศัพท์ และช่องทางอื่นที่ สามารถติดต่อได้",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleInfoAppBar(
          name: "หนังสือยินยอมข้อมูลส่วนตัว",
          heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Container(
            height: MediaQuery.of(context).size.width * 1.66,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.045),
            child: ListView(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.215,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ความยินยอมข้อมูลส่วนบุคคลของท่าน",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textSubHeader),
                      ),
                      Text(
                        "นโยบายคุ้มครองข้อมูลส่วนบุคคลของธรรมธุรกิจ",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textSubHeader),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: ConsentDetail(
                    detailText: detailText,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width *
                      FontSize.bottomSheetHeight,
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * FontSize.bottomSheetHeight,
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
                  borderRadius: BorderRadius.circular(5),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GuestInfo()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Palette.bluetheme,
                  borderRadius: BorderRadius.circular(5),
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
      ),
    );
  }
}
