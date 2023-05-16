import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';

class SortModal extends StatefulWidget {
  const SortModal({super.key});

  @override
  State<SortModal> createState() => _SortModalState();
}

class _SortModalState extends State<SortModal> {
  int sort_by = 0;
  List<String> sortName = [
    "จัดเรียงปกติ",
    "ราคาต่ำสุด",
    "ราคามากสุด",
    "ระยะเวลาจำกัด",
  ];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        sortModal();
      },
      child: Row(
        children: [
          Text(
            "เรียงลำดับ",
            style: TextStyle(
                fontSize:
                    MediaQuery.of(context).size.width * FontSize.textBody),
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }

  void sortModal() {
    Future<void> future = showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.1),
            topRight: Radius.circular(MediaQuery.of(context).size.width * 0.1)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            initialChildSize: 0.35,
            minChildSize: 0.2,
            maxChildSize: 0.35,
            expand: false,
            builder: (_, controller) => Container(
                    // height: MediaQuery.of(context).size.width * 0.35,
                    child: Container(
                        // height: MediaQuery.of(context).size.width * 0.23,
                        // color: Colors.white,
                        child: Container(
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text("เรียงลำดับโดย :",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody))),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.04),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                              controller: controller,
                              itemCount: sortName.length,
                              itemBuilder: (_, index) {
                                return listTypeSort(sortName[index], index);
                              })),
                    ],
                  ),
                ))));
        // StatefulBuilder(builder:
        //     (BuildContext context, void Function(void Function()) setState) {
        //   return Container(
        //       height: MediaQuery.of(context).size.height * 0.35,
        //       child: Container(
        //           height: MediaQuery.of(context).size.height * 0.23,
        //           // color: Colors.white,
        //           child: Container(
        //             margin: EdgeInsets.all(15),
        //             child: Column(
        //               // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Center(
        //                     child: Text("เรียงลำดับโดย :",
        //                         style: TextStyle(
        //                             fontWeight: FontWeight.bold,
        //                             fontSize:
        //                                 MediaQuery.of(context).size.height *
        //                                     0.02))),
        //                 listTypeSort("จัดเรียงปกติ", 0),
        //                 listTypeSort("ราคาต่ำสุด", 1),
        //                 listTypeSort("ราคามากสุด", 2),
        //                 listTypeSort("ระยะเวลาจำกัด", 3),
        //                 Divider(
        //                   height: 1,
        //                   thickness: 1,
        //                   color: Colors.grey,
        //                 ),
        //               ],
        //             ),
        //           )));
        // });
      },
    );
  }

  Widget listTypeSort(String namesort, int _sort_by) => Container(
        // color: Colors.amber,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(
                  () {
                    sort_by = _sort_by;
                  },
                );
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.032),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(namesort,
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textBody)),
                    sort_by == _sort_by ? Icon(Icons.check) : Container()
                  ],
                ),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            ),
          ],
        ),
      );
}
