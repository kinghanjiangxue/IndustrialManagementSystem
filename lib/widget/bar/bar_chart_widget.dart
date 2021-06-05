// ignore: import_of_legacy_library_into_null_safe
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:universe/model/bar/bar_chart_model.dart';
import 'package:universe/model/bar/bar_char_title_model.dart';
import 'package:universe/widget/common/progress_hud.dart';

// 分组柱状图
class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  static int intervalSpace = 5;
  final Color leftBarColorOne = const Color(0xff19A4A0);
  final Color rightBarColorOne = const Color(0xffF75E50);
  final double width = 22;

  List<BarChartGroupData> rawBarGroups = [];
  List<BarChartGroupData> showingBarGroups = [];

  List<BarChartModel> _barChartDataList = [];
  List<BarChartGroupData> temp = [];

  List<TitleDataModel> _listTitleData = [];

  int touchedGroupIndex = -1;

  fetchData() async {
    //标题
    var titleData = await http.post(Uri.parse(
        'http://www.json-generator.com/api/json/get/bVvgouIsqG?indent=2'));

    if (titleData.statusCode == 200) {
      List top = json.decode(titleData.body);
      _listTitleData =
          top.map((json) => TitleDataModel.fromJson(json)).toList();
    } else {
      print("err code $titleData.statusCode");
    }

    var data = await http.get(Uri.parse(
        'http://www.json-generator.com/api/json/get/ceMbLSofiq?indent=2'));
    if (data.statusCode == 200) {
      List top = json.decode(data.body);
      _barChartDataList =
          top.map((json) => BarChartModel.fromJson(json)).toList();

      for (int i = 0; i < _barChartDataList.length; i++) {
        BarChartModel model = _barChartDataList[i];

        var barGroup = makeGroupData(model.id?.toInt(),
            model.columnOne?.toDouble(), model.columnTwo?.toDouble());

        temp.add(barGroup);
      }
      rawBarGroups = temp;
      showingBarGroups = rawBarGroups;
    } else {
      print("err code $data.statusCode");
    }
  }

  @override
  void initState() {
    super.initState();

    fetchData().whenComplete(() {
      setState(() {});
    });
  }

  SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Colors.black, fontSize: 13),
        margin: 10,
        getTitles: (double id) => _listTitleData
            .firstWhere((element) => element.id == id.toInt())
            .name,
      );

  static SideTitles getSideTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Colors.black, fontSize: 13),
        rotateAngle: 90,
        interval: 5.0,
        margin: 10,
        reservedSize: 30,
        getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}',
      );

  @override
  Widget build(BuildContext context) {
    if (_listTitleData.length == 0 || _barChartDataList.length == 0) {
      return  Center(
        child: ProgressHUD(
          backgroundColor: Colors.black.withOpacity(0.6),
          color: Colors.white,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 35,
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

                            touchedGroupIndex =
                                response.spot!.touchedBarGroupIndex;

                            setState(() {
                              if (response.touchInput is PointerExitEvent ||
                                  response.touchInput is PointerUpEvent) {
                                touchedGroupIndex = -1;
                                showingBarGroups = List.of(rawBarGroups);
                              } else {
                                showingBarGroups = List.of(rawBarGroups);
                                if (touchedGroupIndex != -1) {
                                  var sum = 0.0;
                                  for (var rod
                                      in showingBarGroups[touchedGroupIndex]
                                          .barRods) {
                                    sum += rod.y;
                                  }
                                  final avg = sum /
                                      showingBarGroups[touchedGroupIndex]
                                          .barRods
                                          .length;

                                  showingBarGroups[touchedGroupIndex] =
                                      showingBarGroups[touchedGroupIndex]
                                          .copyWith(
                                    barRods: showingBarGroups[touchedGroupIndex]
                                        .barRods
                                        .map((rod) {
                                      return rod.copyWith(y: avg);
                                    }).toList(),
                                  );
                                }
                              }
                            });
                          }),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: getTopBottomTitles(),
                        leftTitles: getSideTitles(),
                        rightTitles: getSideTitles(),
                      ),
                      gridData: FlGridData(
                        checkToShowHorizontalLine: (value) =>
                            value % intervalSpace == 0,
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
                          color: Color(0xffdcdcdc),
                        ),
                        bottom:
                            BorderSide(width: 0.8, color: Color(0xffdcdcdc)),
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

  BarChartGroupData makeGroupData(int? x, double? y1, double? y2) {
    return BarChartGroupData(
      barsSpace: 2,
      x: x,
      barRods: [
        BarChartRodData(
            y: y1,
            colors: [
              leftBarColorOne,
            ],
            width: width,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
            )),
        BarChartRodData(
            y: y2,
            colors: [rightBarColorOne],
            width: width,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3),
              topRight: Radius.circular(3),
            )),
      ],
      showingTooltipIndicators: [0, 1],
    );
  }
}
