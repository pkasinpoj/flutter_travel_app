import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:thamturakit_mobile/models/destination_list_model.dart';
import 'dart:math';

class PreviewCarousalDetail extends StatefulWidget {
  final DestinationListModel detailHotel;
  const PreviewCarousalDetail({
    super.key,
    required this.detailHotel,
  });

  @override
  State<PreviewCarousalDetail> createState() => _PreviewCarousalDetail();
}

class _PreviewCarousalDetail extends State<PreviewCarousalDetail> {
  // final GlobalKey<>
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.detailHotel.name,
        overflow: TextOverflow.clip,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: MediaQuery.of(context).size.width * 0.055),
      ),
      Container(
          margin: EdgeInsets.only(bottom: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.place,
                color: Colors.red[600],
                size: MediaQuery.of(context).size.width * 0.05,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Text(
                widget.detailHotel.address,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: MediaQuery.of(context).size.width * 0.04),
              ),
            ],
          )),
      Container(
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.01),
          child: Row(
            children: [
              Text(
                "เรตติ้ง  :  ",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.036),
              ),
              RatingBarIndicator(
                rating: widget.detailHotel.rating,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: MediaQuery.of(context).size.width * 0.045,
                direction: Axis.horizontal,
              ),
            ],
          )),
      Container(
        child: Wrap(
          runSpacing: MediaQuery.of(context).size.width * 0.008,
          spacing: MediaQuery.of(context).size.width * 0.012,
          children: <Widget>[
            for (int i = 0; i < widget.detailHotel.chip.length; i++)
              _buildChip(
                widget.detailHotel.chip[i],
                Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
              )
          ],
        ),
      ),
    ]);
  }

  Widget _buildChip(String label, Color color) {
    return
        // Transform(
        // transform: new Matrix4.identity()..scale(1),
        // child:
        Chip(
      labelPadding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.0002),
      label: Text(
        label,
        style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.036),
      ),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.01),
      ),
      backgroundColor: color,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      // elevation: 6.0,
      // shadowColor: Colors.grey[60],
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.01,
          right: MediaQuery.of(context).size.width * 0.01),
    );
    // );
  }
}
