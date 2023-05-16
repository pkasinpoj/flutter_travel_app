import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';

class NationalityListItem extends StatefulWidget {
  const NationalityListItem({super.key});

  @override
  State<NationalityListItem> createState() => _NationalityListItemlState();
}

class _NationalityListItemlState extends State<NationalityListItem> {
  // List<String> image_countrys = [];
  // List<String> countrys = ["a", "b", "c", "d", "e", "f", "g", "j", "k", "y"];
  // int sort_by = 0;
  // int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          width: MediaQuery.of(context).size.width * FontSize.thinBorder,
        ),
        borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * FontSize.borderRadius),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: CountryListPick(
          appBar: AppBar(
            backgroundColor: Palette.greentheme,
            title: const Text('โปรดเลือกสัญชาติของคุณ'),
          ),
          // if you need custom picker use this
          pickerBuilder: (context, CountryCode? countryCode) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        height: MediaQuery.of(context).size.width * 0.075,
                        width: MediaQuery.of(context).size.width * 0.145,
                        fit: BoxFit.fitWidth,
                        countryCode?.flagUri ?? '',
                        package: 'country_list_pick',
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.03),
                          child: Text(countryCode?.dialCode ?? '')),
                      Text(countryCode?.name ?? ''),
                    ],
                  ),
                ),
                Icon(Icons.arrow_drop_down)
              ],
            );
          },
          theme: CountryTheme(
            isShowFlag: true,
            isShowTitle: true,
            isShowCode: true,
            isDownIcon: true,
            showEnglishName: false,
            labelColor: Colors.blueAccent,
          ),
          initialSelection: '+62',
          // or
          // initialSelection: 'US'
          onChanged: (CountryCode? code) {
            print(code?.name);
            print(code?.code);
            print(code?.dialCode);
            print(code?.flagUri);
          },
        ),
      ),
    );
  }

  // void countryList() {
  //   Future<void> future = showModalBottomSheet<void>(
  //     context: context,
  //     isScrollControlled: true,
  //     isDismissible: true,
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
  //     builder: (context) => DraggableScrollableSheet(
  //       initialChildSize: 0.35,
  //       minChildSize: 0.2,
  //       maxChildSize: 0.35,
  //       expand: false,
  //       builder: (_, controller) => Container(
  //         margin: EdgeInsets.all(15),
  //         child: Column(
  //           children: [
  //             Container(
  //               margin: EdgeInsets.only(bottom: 15),
  //               child: Center(
  //                   child: Text("โปรดเลือกประเทศของคุณ :",
  //                       style: TextStyle(
  //                           fontWeight: FontWeight.bold,
  //                           fontSize:
  //                               MediaQuery.of(context).size.height * 0.02))),
  //             ),
  //             Divider(
  //               height: 1,
  //               thickness: 1,
  //               color: Colors.grey,
  //             ),
  //             Expanded(
  //               child: ListView.builder(
  //                 controller: controller,
  //                 itemCount: countrys.length,
  //                 itemBuilder: (_, index) {
  //                   return InkWell(
  //                     onTap: () {
  //                       setState(
  //                         () {
  //                           sort_by = index;
  //                           Navigator.pop(context);
  //                         },
  //                       );
  //                     },
  //                     child: Column(
  //                       children: [
  //                         Container(
  //                           // color: Colors.red,
  //                           child: Container(
  //                             margin: EdgeInsets.symmetric(vertical: 15),
  //                             child: Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Image.network(
  //                                     'https://placeimg.com/640/480/any',
  //                                     width: 70,
  //                                     height: 40,
  //                                     fit: BoxFit.fill),
  //                                 Text(countrys[index],
  //                                     style: TextStyle(
  //                                         fontWeight: FontWeight.bold,
  //                                         fontSize: MediaQuery.of(context)
  //                                                 .size
  //                                                 .height *
  //                                             0.025)),
  //                                 index == sort_by
  //                                     ? Icon(Icons.check)
  //                                     : Container()
  //                               ],
  //                             ),
  //                           ),
  //                         ),
  //                         Divider(
  //                           height: 1,
  //                           thickness: 1,
  //                           color: Colors.grey,
  //                         ),
  //                       ],
  //                     ),
  //                   );
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
