import 'package:fl_chart/fl_chart.dart';
import 'package:universe/data/home/home_pie_starting_data.dart';
import 'package:flutter/material.dart';
import 'package:universe/widget/home/home_pie_total_widget.dart';
import 'package:universe/widget/home/home_pie_starting_widget.dart';

class HomePieChartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePieChartPageState();
}

class HomePieChartPageState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            PieStartingChart(
              datas: [80.0, 20.0],
              legends: ['开机', '关机'],
            ),

            PieTotalChart(
              datas: [60.0, 50.0, 40.0, 80.0, 90.0],
              legends: ['一月', '二月', '三月', '四月', '五月'],
            ),

            // Expanded(
            //   child: PieStartingChart(
            //     datas: [80.0, 20.0],
            //     legends: ['一月', '二月'],
            //   ),
            // ),
            //
            // Expanded(
            //   child: PieTotalChart(
            //     datas: [60.0, 50.0, 40.0, 80.0, 90.0],
            //     legends: ['一月', '二月', '三月', '四月', '五月'],
            //   ),
            // ),
          ],
        ),
      );
}
