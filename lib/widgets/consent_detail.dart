import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';

class ConsentDetail extends StatelessWidget {
  const ConsentDetail({super.key, required this.detailText});

  final List detailText;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (BuildContext context, int headText) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.width * 0.02),
                    child: Text("Header $headText",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textBody))),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int subText) {
                      return Text(
                        detailText[subText],
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textBody),
                      );
                    }),
              ],
            ),
          );
        });
  }
}
