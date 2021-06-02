import 'package:universe/data/bar/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
    showTitles: true,
    getTextStyles: (value) =>
    const TextStyle(color: Colors.black, fontSize: 13),
    margin: 10,
    getTitles: (double id) => BarData.barData
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
    getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}k',
  );
}
