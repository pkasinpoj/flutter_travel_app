import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';
import 'package:thamturakit_mobile/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thamturakit_mobile/pages/destination_list.dart';

class DestinationCarousal extends StatefulWidget {
  final String category;
  DestinationCarousal({super.key, required this.category});

  @override
  _DestinationCarousal createState() => _DestinationCarousal();
}

class _DestinationCarousal extends State<DestinationCarousal> {
  final bookingFilterCon = bookingFilterController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.category,
                style: new TextStyle(
                  fontSize: MediaQuery.of(context).size.width *
                      FontSize.textSubHeader,
                  fontFamily: 'Roboto',
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  // letterSpacing: 1.2
                ),
              ),
              GestureDetector(
                onTap: (() => {
                      bookingFilterCon.setDestination("Top Destination"),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DestinationLists()),
                      )
                    }),
                child: Text(
                  'See All',
                  style: new TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width * FontSize.textBody,
                      fontFamily: 'Roboto',
                      color: Palette.greentheme,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0
                      // letterSpacing: 1.2
                      ),
                ),
              )
            ],
          ),
          Container(
            // height: 280.0,
            height: MediaQuery.of(context).size.width * 0.51,
            // color: Colors.blue,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: ((context, index) {
                  Destination destination = destinations[index];
                  return GestureDetector(
                    onTap: (() => {
                          bookingFilterCon.setDestination(
                              "${destination.country},${destination.city}"),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DestinationLists()),
                          )
                        }),
                    child: Container(
                      margin: EdgeInsets.only(top: 15.0),
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Positioned(
                          bottom: 0,
                          child: Container(
                            // height: 120.0,
                            // width: 200.0,
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.42,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5, bottom: 5),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${destination.city} ',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              FontSize.textBody,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2),
                                    ),
                                    Text(
                                      destination.description,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.025,
                                          color: Colors.grey),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 6.0)
                              ]),
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                // height: 180.0,
                                // width: 180.0,
                                height:
                                    MediaQuery.of(context).size.width * 0.33,
                                width: MediaQuery.of(context).size.width * 0.42,
                                image: AssetImage(destination.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Positioned(
                            //   left: 10.0,
                            //   bottom: 10.0,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         destination.city,
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 20.0,
                            //           fontWeight: FontWeight.w500,
                            //           // letterSpacing: 1.2
                            //         ),
                            //       ),
                            //       Row(
                            //         children: [
                            //           Icon(
                            //             FontAwesomeIcons.locationArrow,
                            //             size: 10.0,
                            //             color: Colors.white,
                            //           ),
                            //           SizedBox(
                            //             width: 5,
                            //           ),
                            //           Text(
                            //             destination.country,
                            //             style: TextStyle(color: Colors.white),
                            //           ),
                            //         ],
                            //       )
                            //     ],
                            //   ),
                            // )
                          ]),
                        )
                      ]),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }
}
