import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/widgets/single_info_appbar.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key});

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  String payment = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SingleInfoAppBar(
        name: "เลือกวิธีการชำระเงิน",
        heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
      ),
      body: SafeArea(
        child: Container(
          // height: MediaQuery.of(context).size.height * 0.23,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    payment = "Cash";
                  });
                },
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.width * 0.16,
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
                                Icons.monetization_on_outlined,
                                size: MediaQuery.of(context).size.width * 0.065,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.025,
                              ),
                              Text(
                                "เงินสด",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child:
                                payment == "Cash" ? Icon(Icons.check) : null),
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
        height: MediaQuery.of(context).size.width * FontSize.app_bar,
        color: Palette.bluetheme,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Center(
            child: Text(
              "ยืนยันข้อมูล",
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
