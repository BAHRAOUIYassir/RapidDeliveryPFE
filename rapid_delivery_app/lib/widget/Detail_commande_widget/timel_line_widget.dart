import 'package:flutter/material.dart';
import 'package:rapid_delivery_app/widget/Detail_commande_widget/status_commande.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isPast;
  final bool isLast;
  final String NameStatus;
  final String Date_staus;
  final String path;

  const MyTimeLineTile({
    Key? key,
    required this.isFirst,
    required this.isPast,
    required this.isLast,
    required this.NameStatus,
    required this.Date_staus,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
            color: isPast && isLast
                ? const Color(0xff3DAB22)
                : isPast
                    ? const Color(0xffFF9800)
                    : Colors.black26,
            width: 30,
            drawGap: true),
        beforeLineStyle: LineStyle(
          color: isPast && isLast
              ? const Color(0xff3DAB22)
              : isPast
                  ? const Color(0xffFF9800)
                  : Colors.black26,
        ),
        endChild: StatusCommande(
          Name_status: NameStatus,
          date_status: Date_staus,
          path: path,
        ),
        hasIndicator: true,
      ),
    );
  }
}
