// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/models/destination_detail_model.dart';
import 'package:thamturakit_mobile/models/room_model.dart';
import 'package:thamturakit_mobile/pages/invoice.dart';
import 'package:thamturakit_mobile/widgets/bottom_sheet.dart';
import 'package:thamturakit_mobile/widgets/images/type_rooms_image.dart';
import 'package:thamturakit_mobile/widgets/hotel_info_appbar.dart';

class DestinationDetail extends StatefulWidget {
  const DestinationDetail({super.key});

  @override
  State<DestinationDetail> createState() => _DestinationDetail();
}

class _DestinationDetail extends State<DestinationDetail> {
  // int _selectedIndex = 0;
  // List<String> idRooms = ["98", "97", "96", "95", "94", "93", "92", "91"];
  // List<int> charCodes = [0, 0, 0, 0, 0, 0, 0, 0];
  List<int> totalRooms = [];
  List<Rooms> rooms = [];
  DestinationDetailModel detailHotel = resDetailHotel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: HotelInfoAppBar(
        heightAppBar: MediaQuery.of(context).size.width * FontSize.app_bar,
        hotalName_: detailHotel.name,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          // child: Padding(
          //   padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Card(
              //   child:
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // GridViewImages(),
                    SizedBox(
                        height: MediaQuery.of(context).size.width * 0.45,
                        width: MediaQuery.of(context).size.width,
                        child:
                            TypeRoomsImage(images: detailHotel.headerImages)),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.02,
                          bottom: MediaQuery.of(context).size.width * 0.02,
                          left: MediaQuery.of(context).size.width * 0.04,
                          right: MediaQuery.of(context).size.width * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(detailHotel.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                FontSize.textHeader)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(detailHotel.typeHotel,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textSubHeader)),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.01,
                          ),
                          RatingBarIndicator(
                            rating: detailHotel.rating,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: MediaQuery.of(context).size.width * 0.04,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.place,
                                color: Colors.red[600],
                                size: MediaQuery.of(context).size.width * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Flexible(
                                child: Text(
                                  detailHotel.address,
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textBody),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    // height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: detailHotel.typeRooms.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ClipRRect(
                            // borderRadius: BorderRadius.circular(10.0),
                            // child:
                            Container(
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width * 0.45,
                                  width: MediaQuery.of(context).size.width,
                                  child: TypeRoomsImage(
                                    images: detailHotel
                                        .typeRooms[index].typeRoomImages,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                      MediaQuery.of(context).size.width * 0.025,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.15),
                              child: Text(
                                detailHotel.typeRooms[index].typeName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textSubHeader,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 0,
                                  bottom:
                                      MediaQuery.of(context).size.width * 0.025,
                                  left:
                                      MediaQuery.of(context).size.width * 0.04,
                                  right:
                                      MediaQuery.of(context).size.width * 0.15),
                              child: Container(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: detailHotel
                                        .typeRooms[index].listInfoRooms.length,
                                    itemBuilder:
                                        (BuildContext context, int infoIndex) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.025),
                                        child: Row(
                                          children: [
                                            Icon(Icons.free_breakfast_rounded),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                            Flexible(
                                                child: Text(
                                              (detailHotel.typeRooms[index]
                                                  .listInfoRooms[infoIndex]),
                                              style: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          FontSize.textBody),
                                            )),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Divider(
                              // height: 20,
                              thickness: 1,
                              indent: MediaQuery.of(context).size.width * 0.04,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Palette.bluetheme,
                            ),
                            ExpandablePanel(
                                collapsed: ExpandableButton(
                                  child: Container(
                                    height: MediaQuery.of(context).size.width *
                                        FontSize.button,
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.04),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            MediaQuery.of(context).size.width *
                                                FontSize.radius_button),
                                        color: Palette.bluetheme),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width *
                                              0.03),
                                      child: Text(
                                        "เลือกห้องที่ต้องการ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                FontSize.textBody,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                expanded: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuery.of(context).size.width *
                                              0.04),
                                  // height:
                                  //     MediaQuery.of(context).size.width * 0.99,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ExpandableButton(
                                        // <-- Collapses when tapped on
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              FontSize.button,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          FontSize
                                                              .radius_button),
                                              color: Palette.bluetheme),
                                          child: Padding(
                                              padding: EdgeInsets.all(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03),
                                              child: Icon(
                                                Icons.keyboard_double_arrow_up,
                                                color: Colors.white,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    FontSize.icon,
                                              )),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        child: GridView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: detailHotel
                                                .typeRooms[index].rooms.length,
                                            gridDelegate:
                                                new SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 3,
                                                    // mainAxisExtent: 100.0,
                                                    mainAxisSpacing:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.02,
                                                    crossAxisSpacing:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.04),
                                            itemBuilder: (BuildContext context,
                                                int roomIndex) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    // _selectedIndex = index;
                                                    // charCodes[roomIndex] =
                                                    isclicked(
                                                        // charCodes[
                                                        //     roomIndex],
                                                        detailHotel
                                                            .typeRooms[index]
                                                            .rooms[roomIndex]
                                                            .roomId,
                                                        detailHotel
                                                            .typeRooms[index]
                                                            .rooms[roomIndex]);
                                                  });
                                                  // print(totalRooms);
                                                  // print(totalRooms.length);
                                                },
                                                child: Card(
                                                  // elevation: 5.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            FontSize
                                                                .radius_button),
                                                    side: BorderSide(
                                                      color: Colors.grey,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.003,
                                                    ),
                                                  ),
                                                  child: new Container(
                                                    decoration: BoxDecoration(
                                                        color: getColor(
                                                            detailHotel
                                                                .typeRooms[
                                                                    index]
                                                                .rooms[
                                                                    roomIndex]
                                                                .roomId),
                                                        borderRadius: BorderRadius
                                                            .circular(MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                FontSize
                                                                    .radius_button)),
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .bedroom_child_outlined,
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.1,
                                                            color: getIconColor(
                                                                detailHotel
                                                                    .typeRooms[
                                                                        index]
                                                                    .rooms[
                                                                        roomIndex]
                                                                    .roomId),
                                                          ),
                                                          Text(
                                                            "ยูนิต" +
                                                                '${detailHotel.typeRooms[index].rooms[roomIndex].roomId}',
                                                            style: TextStyle(
                                                                color: getTextColor(
                                                                    detailHotel
                                                                        .typeRooms[
                                                                            index]
                                                                        .rooms[
                                                                            roomIndex]
                                                                        .roomId),
                                                                fontSize: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    FontSize
                                                                        .textBody),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  ),
                                )),

                            Divider(
                              thickness: 1,
                              indent: MediaQuery.of(context).size.width * 0.04,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.04,
                              color: Palette.bluetheme,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 15),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "ราคาเริ่มต้น (ต่อคืน)",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                FontSize.textBody),
                                      ),
                                      Text(
                                          "B ${detailHotel.typeRooms[index].price}",
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  FontSize.textBody))
                                    ]),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.blue,
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("รายละเอียด & ติดต่อ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textSubHeader)),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.blue,
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("อีเมล์",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textSubHeader)),
                              Text(
                                detailHotel.email,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                "เบอร์โทรศัพท์",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textSubHeader),
                              ),
                              Text(
                                detailHotel.tel,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                "ที่อยู่",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textSubHeader),
                              ),
                              Text(
                                detailHotel.contactAddress,
                                style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                "เเผนที่",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            FontSize.textSubHeader),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.blue,
                          width: MediaQuery.of(context).size.width / 2.4,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("สิ่งอำนวยความสะดวก",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textSubHeader)),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.blue,
                          width: MediaQuery.of(context).size.width / 2.4,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: detailHotel.facilities.length,
                                itemBuilder: (context, facilityIndex) {
                                  return facilityIndex == 20
                                      ? Text(
                                          "เเผนกต้อนรับ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  FontSize.textSubHeader),
                                        )
                                      : Text(
                                          detailHotel.facilities[facilityIndex],
                                          style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  FontSize.textBody,
                                              color: Colors.grey.shade700),
                                        );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.01,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // color: Colors.blue,
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("กิจกรรมในที่พัก",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              FontSize.textSubHeader)),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.blue,
                          width: MediaQuery.of(context).size.width / 2.4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: detailHotel.activities.length,
                                itemBuilder: (context, activityIndex) {
                                  return activityIndex == 20
                                      ? Text(
                                          "กิจกรรมกีฬาทางน้้ำ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  FontSize.textSubHeader),
                                        )
                                      : Text(
                                          detailHotel.activities[activityIndex],
                                          style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  FontSize.textBody,
                                              color: Colors.grey.shade700),
                                        );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
          // ),
        ),
      ),
      bottomSheet: totalRooms.length != 0
          ? BottomSheetWidget(
              title: 'First Question',
              totalRooms: totalRooms.length,
              onClickedConfirm: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Invoice(
                          hotalName: detailHotel.name,
                          hotalAddress: detailHotel.address,
                          rooms: rooms)),
                );
              },
              onClickedClose: () {})
          : null,
    );
  }

  Color getColor(int roomId) {
    //red is just a sample color
    Color color;
    // if (onclicked == 1) {
    if (totalRooms.contains(roomId)) {
      color = Theme.of(context).accentColor;
    } else {
      color = Colors.white;
    }
    return color;
  }

  Color getIconColor(int roomId) {
    //red is just a sample color
    Color color;
    // if (onclicked == 1) {
    if (totalRooms.contains(roomId)) {
      color = Colors.white;
    } else {
      color = Colors.black;
    }
    return color;
  }

  Color getTextColor(int roomId) {
    //red is just a sample color
    Color color;
    // if (onclicked == 1) {
    if (totalRooms.contains(roomId)) {
      color = Colors.white;
    } else {
      color = Colors.black;
    }
    return color;
  }

  void isclicked(int roomId, Rooms room) {
    // if (totalRooms.length <= 5 && onclicked == 0) {
    if (totalRooms.length <= 5 && !totalRooms.contains(roomId)) {
      totalRooms.add(roomId);
      rooms.add(room);
    } else {
      totalRooms.removeWhere((item) => item == roomId);
      rooms.removeWhere((item) => item.roomId == roomId);
      print(totalRooms);
      print(rooms);
    }
  }
}
