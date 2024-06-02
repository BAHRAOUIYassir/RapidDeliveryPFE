import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../data/chart_data/bar_chart_data.dart';


class BarChartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          maxY: 16,
          minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  String text;
                  switch (value.toInt()) {
                    case 1:
                      text = 'Mon';
                      break;
                    case 2:
                      text = 'Tues';
                      break;
                    case 3:
                      text = 'Wed';
                      break;
                    case 4:
                      text = 'Thu';
                      break;
                    case 5:
                      text = 'Fri';
                      break;
                    case 6:
                      text = 'Sat';
                      break;
                    case 7:
                      text = 'Sun';
                      break;
                    default:
                      text = '';
                  }
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    space: 8.0, // espace entre le titre et l'axe
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 4,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  // Afficher uniquement les valeurs pertinentes avec l'intervalle de 4
                  if (value % 4 == 0 && value <= 16) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      space: 12.0,
                      child: Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            border: Border.all(color: Colors.white, width: 0.5),
          ),
          alignment: BarChartAlignment.spaceEvenly,
          barGroups: barChartGroupData,
          gridData: const FlGridData(
            drawHorizontalLine: false,
            drawVerticalLine: false,
          )),
    );
  }
}
