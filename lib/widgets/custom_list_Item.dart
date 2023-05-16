import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/widgets/article_description.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.022),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.016),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("หมายเลขการจอง : 9556506300",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                      )),
                  Text("฿ 44,000",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.038,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: MediaQuery.of(context).size.width * 0.00225,
                    child: Column(
                      children: [
                        Image.asset("assets/images/hotel_demo_1.jpg",
                            fit: BoxFit.fitWidth),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.width * 0.01),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.access_time_rounded,
                                  size: MediaQuery.of(context).size.width *
                                      0.055),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Flexible(
                                child: Text("วันอังคาร 23 ส.ค. 2565 เวลา 12:53",
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.028,
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.022,
                          0.0,
                          MediaQuery.of(context).size.width * 0.003,
                          0.0),
                      child: ArticleDescription(
                        title: title,
                        subtitle: subtitle,
                        author: author,
                        publishDate: publishDate,
                        readDuration: readDuration,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
