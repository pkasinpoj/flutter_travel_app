// // ignore_for_file: prefer_const_constructors, unnecessary_new

// import 'package:thamturakit_mobile/config/Palette%20.dart';
// import 'package:thamturakit_mobile/pages/destination_list.dart';
// import 'package:thamturakit_mobile/pages/price_filter.dart';
// import 'package:thamturakit_mobile/pages/resident_filter.dart';
// import 'package:thamturakit_mobile/pages/search_location.dart';
// import 'package:flutter/material.dart';

// class RoomFilterScreen extends StatefulWidget {
//   const RoomFilterScreen({Key? key}) : super(key: key);

//   @override
//   _RoomFilterScreenState createState() => _RoomFilterScreenState();
// }

// class _RoomFilterScreenState extends State<RoomFilterScreen> {
//   DateTime _startdate = DateTime(2022, 12, 24);
//   DateTime _enddate = DateTime(2022, 12, 24);

//   String _defaultlocation = "Where you want to go ?";
//   int _totalAdult = 0;

//   TextEditingController weightController = new TextEditingController();
//   // Style Button
//   // final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//   //   backgroundColor: Colors.blue,
//   //   padding: EdgeInsets.all(8),
//   // );

//   _buttonStartDate(double _height, double _width) {
//     // final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//     //   // minimumSize: Size(_width, _height),
//     //   backgroundColor: Colors.white,
//     //   // padding: EdgeInsets.fromLTRB(13, 13, 13, 13)
//     // );
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.white70.withOpacity(0.4),
//         onPrimary: Colors.white,
//         minimumSize:
//             Size(40, MediaQuery.of(context).size.height * 0.06), //////// HERE
//       ),
//       onPressed: () async {
//         DateTime? newDate = await showDatePicker(
//             context: context,
//             initialDate: _startdate,
//             firstDate: DateTime(1900),
//             lastDate: DateTime(2100));
//         if (newDate == null) return;
//         setState(() => _startdate = newDate);
//       },
//       child: Row(children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("เช็คอิน",
//                 style: TextStyle(fontSize: 15, color: Colors.white)),
//             Text(
//               '${_enddate.day}/${_enddate.month}/${_enddate.year}',
//               style: TextStyle(fontSize: 15, color: Colors.white),
//             ),
//           ],
//         ),
//         SizedBox(width: MediaQuery.of(context).size.width * 0.09),
//         Column(
//           children: [Icon(Icons.calendar_today_outlined, color: Colors.white)],
//         ),
//       ]),
//     );
//   }

//   _buttonEndDate(double _height, double _width) {
//     // final ButtonStyle flatButtonStyle = TextButton.styleFrom(
//     //   minimumSize: Size(_width, _height),
//     //   backgroundColor: Colors.white,
//     //   // padding: EdgeInsets.fromLTRB(13, 13, 13, 13),
//     // );
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.white70.withOpacity(0.4),
//         onPrimary: Colors.white,
//         minimumSize:
//             Size(40, MediaQuery.of(context).size.height * 0.06), //////// HERE
//       ),
//       onPressed: () async {
//         DateTime? newDate = await showDatePicker(
//             context: context,
//             initialDate: _enddate,
//             firstDate: DateTime(1900),
//             lastDate: DateTime(2100));
//         if (newDate == null) return;
//         setState(() => _enddate = newDate);
//       },
//       child: Row(children: <Widget>[
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text("เช็คเอาท์",
//                 style: TextStyle(fontSize: 15, color: Colors.white)),
//             Text(
//               '${_enddate.day}/${_enddate.month}/${_enddate.year}',
//               style: TextStyle(fontSize: 15, color: Colors.white),
//             ),
//           ],
//         ),
//         SizedBox(width: MediaQuery.of(context).size.width * 0.09),
//         Column(
//           children: [Icon(Icons.calendar_today_outlined, color: Colors.white)],
//         ),
//       ]),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SafeArea(
//         // child: ListView(
//         child: Container(
//             margin: EdgeInsets.symmetric(
//               horizontal: 25,
//             ),
//             child: Container(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.05,
//                   ),
//                   Container(
//                       height: MediaQuery.of(context).size.height * 0.33,
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                                 // margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//                                 child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.white70.withOpacity(0.4),
//                                 onPrimary: Colors.white,
//                                 minimumSize: Size(
//                                     double.infinity,
//                                     MediaQuery.of(context).size.height *
//                                         0.06), //////// HERE
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SearchLocation()),
//                                 );
//                               },
//                               child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("สถานที่",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.white)),
//                                         Text(
//                                           // '${_enddate.day}/${_enddate.month}/${_enddate.year}',
//                                           _defaultlocation,
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               color: Colors.white),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(Icons.search, color: Colors.white)
//                                       ],
//                                     ),
//                                   ]),
//                             )),
//                             Container(
//                               // margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
//                               child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     _buttonStartDate(30, 175),
//                                     _buttonEndDate(30, 175),
//                                   ]),
//                             ),
//                             Container(
//                                 // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                                 child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.white70.withOpacity(0.4),
//                                 onPrimary: Colors.white,
//                                 minimumSize: Size(
//                                     double.infinity,
//                                     MediaQuery.of(context).size.height *
//                                         0.06), //////// HERE
//                               ),
//                               onPressed: () {
//                                 // showDialog(
//                                 //     context: context,
//                                 //     builder: (BuildContext context) {
//                                 //       return OccupancyScreen(
//                                 //           totalAdult: _totalAdult);
//                                 //     });
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const ResidentFilter()),
//                                 );
//                               },
//                               child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("ผู้เข้าพัก",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.white)),
//                                         Text(
//                                           // '${_enddate.day}/${_enddate.month}/${_enddate.year}',
//                                           '2 ผู้ใหญ่,0 เด็ก,1 ห้อง',
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               color: Colors.white),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(Icons.people_alt_outlined,
//                                             color: Colors.white)
//                                       ],
//                                     ),
//                                   ]),
//                             )),
//                             Container(
//                                 // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
//                                 child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 primary: Colors.white70.withOpacity(0.4),
//                                 onPrimary: Colors.white,
//                                 minimumSize: Size(
//                                     double.infinity,
//                                     MediaQuery.of(context).size.height *
//                                         0.06), //////// HERE
//                               ),
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const PriceFilter()),
//                                 );
//                               },
//                               child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("ช่วงราคา",
//                                             style: TextStyle(
//                                                 fontSize: 15,
//                                                 color: Colors.white)),
//                                         Text(
//                                           // '${_enddate.day}/${_enddate.month}/${_enddate.year}',
//                                           'B100 - 500',
//                                           style: TextStyle(
//                                               fontSize: 15,
//                                               color: Colors.white),
//                                         ),
//                                       ],
//                                     ),
//                                     Column(
//                                       children: [
//                                         Icon(Icons.people_alt_outlined,
//                                             color: Colors.white)
//                                       ],
//                                     ),
//                                   ]),
//                             )),
//                           ])),
//                 ],
//               ),
//             )),
//         // ),
//       ),
//       bottomSheet: Container(
//         height: MediaQuery.of(context).size.height * 0.06,
//         color: Palette.kToGreen,
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DestinationLists()),
//             );
//           },
//           child: Center(
//             child: Text(
//               "ตกลง",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
