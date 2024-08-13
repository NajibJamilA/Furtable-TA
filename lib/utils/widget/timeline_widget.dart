import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../theme.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.title,
    required this.subtitle
  });

  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          thickness: 1,
          color: isPast? AppColors.primaryColor : AppColors.lightGreyColor
        ),
        indicatorStyle: IndicatorStyle(
          width: 8,
          height: 8,
          color: isPast? AppColors.primaryColor : AppColors.lightGreyColor
        ),
        endChild: Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: isPast? AppColors.primaryColor : AppColors.lightGreyColor,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontSize: 12,
                    color: isPast? AppColors.primaryColor : AppColors.lightGreyColor,
                    fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
