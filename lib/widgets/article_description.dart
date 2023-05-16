import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';

class ArticleDescription extends StatelessWidget {
  const ArticleDescription({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.038),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0)),
              Row(
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: MediaQuery.of(context).size.width * 0.055,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.013),
                    child: Row(
                      children: [
                        Text("เช็คอิน :",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.034)),
                        Text("23/08/2565 07:00",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.034))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.calendar_month_outlined,
                      size: MediaQuery.of(context).size.width * 0.055),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.013),
                    child: Row(
                      children: [
                        Text("เช็คเอาท์ :",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.034)),
                        Text("24/08/2565 07:00",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.034))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.people,
                      size: MediaQuery.of(context).size.width * 0.055),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.013),
                    child: Row(
                      children: [
                        Text("จำนวนผู้เข้าพัก :",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.034)),
                        Text("2 คน",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.034))
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.hotel,
                      size: MediaQuery.of(context).size.width * 0.055),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.013),
                    child: Row(
                      children: [
                        Text("จำนวนยูนิต :",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.034)),
                        Text("2 ยูนิต",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.034))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.width * 0.01),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.download,
                    size: MediaQuery.of(context).size.width * 0.055),
                Text("ดาวน์โหลดใบแจ้งหนี้",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width *
                            FontSize.textBody)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
