import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/models/destination_list_model.dart';
import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/pages/destination_detail.dart';
import 'package:thamturakit_mobile/widgets/carousals/preview_carousal_image.dart';
import 'package:thamturakit_mobile/widgets/carousals/preview_carousal_detail.dart';
import 'package:thamturakit_mobile/widgets/modals/price_modal.dart';
import 'package:thamturakit_mobile/widgets/modals/sort_modal.dart';
import 'package:thamturakit_mobile/widgets/hotel_info_appbar.dart';

class DestinationLists extends StatefulWidget {
  const DestinationLists({super.key});

  @override
  State<DestinationLists> createState() => _DestinationLists();
}

class _DestinationLists extends State<DestinationLists> {
  List<DestinationListModel> hotels = destinationList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: HotelInfoAppBar(
          heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
          byPage_: "list",
        ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.04,
                    MediaQuery.of(context).size.width * 0.05,
                    MediaQuery.of(context).size.width * 0.04,
                    0),
                height: MediaQuery.of(context).size.width * 0.09,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: MediaQuery.of(context).size.width * 0.003,
                      blurRadius: MediaQuery.of(context).size.width * 0.003,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PriceModal(),
                      Text(
                        "|",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textBody),
                      ),
                      SortModal(),
                      Text(
                        "|",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width *
                                FontSize.textBody),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingFilterScreen(
                                      whereFrom_: FontSize.toWidget,
                                    )),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              "filter",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.06),
              child: ListView.separated(
                  // itemExtent: MediaQuery.of(context).size.width * 1.5,
                  itemCount: hotels.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Activity destination = activities[index];
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.06),
                      // height: MediaQuery.of(context).size.width * 1.02,
                      // width: double.infinity,
                      // width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        // color: Colors.green,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.03),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DestinationDetail()),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.03),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.width * 0.425,
                                // decoration: BoxDecoration(color: Colors.blue),
                                child: PreviewCarousalImage(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.03,
                                  images: hotels[index].images,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.03),
                              child: PreviewCarousalDetail(
                                detailHotel: hotels[index],
                              ),
                            ),
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey,
                            ),
                            Container(
                              margin: EdgeInsets.all(
                                  MediaQuery.of(context).size.width * 0.045),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "THB ${hotels[index].price.toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                FontSize.textBody),
                                  ),
                                  Text(
                                    " /ห้อง/คืน",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.035,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      )),
            )),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.06,
            )
          ],
        )));
  }
}
