import 'package:universe/data/bar_data.dart';
import 'package:universe/widge/bar/bar_titles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartWidget extends StatelessWidget {
  final double barWidth = 22;
  FlAxisTitleData _buildFlAxisTitleData() {
    return FlAxisTitleData(
      leftTitle: AxisTitle(titleText: "侧轴标题",showTitle: true),
      bottomTitle: AxisTitle(titleText: "底部标题",showTitle: true),
    );
  }

  @override
  Widget build(BuildContext context) => BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceEvenly,
          maxY: 20,
          minY: 0,
          groupsSpace: 12,
          barTouchData: BarTouchData(enabled: true),
          axisTitleData: FlAxisTitleData(
            rightTitle: AxisTitle(showTitle: true, titleText: 'count212154143531435'),
            leftTitle: AxisTitle(showTitle: true, titleText: 'counthhhhhhhhhhhh'),
            topTitle:
            AxisTitle(showTitle: true, titleText: 'Wall clock', textAlign: TextAlign.left),
          ),
          titlesData: FlTitlesData(
            // topTitles: BarTitles.getTopBottomTitles(),
            bottomTitles: BarTitles.getTopBottomTitles(),
            leftTitles: BarTitles.getSideTitles(),
            rightTitles: BarTitles.getSideTitles(),
          ),
          gridData: FlGridData(
            checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
            getDrawingHorizontalLine: (value) {
              if (value == 0) {
                return FlLine(
                  color: const Color(0xff363753),
                  strokeWidth: 3,
                );
              } else {
                return FlLine(
                  color: const Color(0xff2a2747),
                  strokeWidth: 0.8,
                );
              }
            },
          ),
          barGroups: BarData.barData
              .map(
                (data) => BarChartGroupData(
                  x: data.id,
                  barRods: [
                    BarChartRodData(
                        y: data.y,
                        width: barWidth,
                        colors: [data.color],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        )),
                  ],
                ),
              )
              .toList(),
        ),
      );
}
