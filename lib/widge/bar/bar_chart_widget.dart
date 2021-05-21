import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:universe/data/bar/bar_titles.dart';
import 'package:universe/data/bar/bar_data.dart';

// 分组柱状图

class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color leftBarColorOne = const Color(0xff19A4A0);
  final Color rightBarColorOne = const Color(0xffF75E50);
  final double width = 22;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    width: 100,
                    height: 50,
                  ),
                  const Text(
                    'Productions',
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    'state',
                    style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    color: Color(0xff19A4A0),
                    alignment: Alignment.center,
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '昨日产量',
                    style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Color(0xffF75E50),
                    alignment: Alignment.center,
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '今日产量',
                    style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                  ),

                ],

              ),
              // const SizedBox(
              //   height: 38,
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 25,
                      minY: 0,
                      alignment: BarChartAlignment.spaceEvenly,
                      barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.transparent,
                            tooltipPadding: const EdgeInsets.all(0),
                            tooltipBottomMargin: 8,
                            getTooltipItem: (
                                BarChartGroupData group,
                                int groupIndex,
                                BarChartRodData rod,
                                int rodIndex,
                                ) {
                              return BarTooltipItem(
                                rod.y.round().toString(),
                                TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          touchCallback: (response) {
                            if (response.spot == null) {
                              setState(() {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              });
                              return;
                            }

                            touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                            setState(() {
                              if (response.touchInput is PointerExitEvent ||
                                  response.touchInput is PointerUpEvent) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              } else {
                                showingBarGroups = List.of(rawBarGroups);
                                if (touchedGroupIndex != -1) {
                                  var sum = 0.0;
                                  for (var rod in showingBarGroups[touchedGroupIndex].barRods) {
                                    sum += rod.y;
                                  }
                                  final avg =
                                      sum / showingBarGroups[touchedGroupIndex].barRods.length;

                                  showingBarGroups[touchedGroupIndex] =
                                      showingBarGroups[touchedGroupIndex].copyWith(
                                        barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                          return rod.copyWith(y: avg);
                                        }).toList(),
                                      );
                                }
                              }
                            });
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: BarTitles.getTopBottomTitles(),
                        leftTitles: BarTitles.getSideTitles(),
                        rightTitles: BarTitles.getSideTitles(),
                      ),
                      gridData: FlGridData(
                        checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
                        getDrawingHorizontalLine: (value) {
                          if (value == 0) {
                            return FlLine(
                              color: Color(0xffF5F5F5),
                              strokeWidth: 3,
                            );
                          } else {
                            return FlLine(
                              color: Color(0xffe4e5ed),
                              strokeWidth: 0.8,
                            );
                          }
                        },
                      ),
                      borderData: FlBorderData(
                          border: Border(
                            top: BorderSide.none,
                            right: BorderSide.none,
                            left: BorderSide(
                              width: 0.8,
                              color:Color(0xffdcdcdc),
                            ),
                            bottom: BorderSide(
                                width: 0.8,
                                color: Color(0xffdcdcdc)
                            ),
                          )),
                      barGroups: showingBarGroups,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 2,
      x: x,
      barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColorOne],
        width: width,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        )
      ),
      BarChartRodData(

        y: y2,
        colors: [rightBarColorOne],
        width: width,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        )
      ),
    ],
      showingTooltipIndicators: [0,1],
    );
  }

}
