import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
// import 'package:universe/data/bar/bar_data.dart';
import 'package:universe/data/output/output_titles.dart';
import 'package:universe/data/output/output_data.dart';


class GenerateOutputTable extends StatefulWidget {
  // const GenerateOutputTable({Key key}) : super(key: key);

  // static const routeName = '/table';

  @override
  _GenerateOutputTableState createState() => _GenerateOutputTableState();
}

class _GenerateOutputTableState extends State<GenerateOutputTable> {
  final Color leftBarColorOne = const Color(0xffFA8FE9);
  final Color rightBarColorOne = const Color(0xff5296FA);
  final double width = 15;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 24);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);
    final barGroup8 = makeGroupData(7, 5, 12);
    final barGroup9 = makeGroupData(8, 16, 12);
    final barGroup10 = makeGroupData(9, 18, 5);
    final barGroup11 = makeGroupData(10, 20, 16);
    final barGroup12 = makeGroupData(11, 17, 6);
    final barGroup13 = makeGroupData(12, 19, 1.5);
    final barGroup14 = makeGroupData(13, 10, 1.5);
    final barGroup15 = makeGroupData(0, 5, 12);
    final barGroup16 = makeGroupData(1, 16, 12);
    final barGroup17 = makeGroupData(2, 18, 5);
    final barGroup18 = makeGroupData(3, 20, 16);
    final barGroup19 = makeGroupData(4, 17, 6);
    final barGroup20 = makeGroupData(5, 19, 1.5);
    final barGroup21 = makeGroupData(6, 10, 1.5);
    final barGroup22 = makeGroupData(7, 5, 12);
    final barGroup23 = makeGroupData(8, 16, 12);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
      barGroup12,
      barGroup13,
      barGroup14,
      barGroup15,
      barGroup16,
      barGroup17,
      barGroup18,
      barGroup19,
      barGroup20,
      barGroup21,
      barGroup22,
      barGroup23
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
        color: const Color(0xffffffff),
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
                    height: 50,
                    width: 100,
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
                    style: TextStyle(color: Color(0xff999999), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    color: Color(0xffFA8FE9),
                    alignment: Alignment.center,
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '昨日产量',
                    style: TextStyle(color: Color(0xff333333), fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    color: Color(0xff5296FA),
                    alignment: Alignment.center,
                    width: 15,
                    height: 15,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    '今日产量',
                    style: TextStyle(color: Color(0xff333333), fontSize: 16),
                  ),

                ],

              ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 30,
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
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 0,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [leftBarColorOne],
          width: width,
          borderRadius:BorderRadius.only(
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
          ),
        ),
      ],
      showingTooltipIndicators: [0,1],
    );
  }

}
