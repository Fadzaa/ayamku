import 'package:ayamku_delivery/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class ItemTimeline extends StatelessWidget {
  const ItemTimeline({
    super.key,
    required this.title,
    required this.time,
    required this.description
  });

  final String title, time,description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TimelineTile(
        isFirst: false,
        isLast: false,
        beforeLineStyle: LineStyle(color: primaryColor,thickness: 3),
        indicatorStyle: IndicatorStyle(
          width: 15,
          color: primaryColor
        ),
        endChild: EventCard(
          title: title,
          time: time,
          description: description,
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.title,
    required this.time,
    required this.description
  });

  final String title, time,description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: txtButtonTab.copyWith(color: blackColor)
              ),

              Text(
                time,
                style: txtCaption.copyWith(color: blackColor70)
              ),
            ],
          ),

          SizedBox(height: 3),

          Text(
            description,
            style: txtBody.copyWith(color: grey)
          ),
          SizedBox(height: 4),

        ],
      ),
    );
  }
}
