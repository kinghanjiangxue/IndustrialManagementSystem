import 'package:flutter/material.dart';


class BarChartModel {
  // for ordering in the graph
  final num? id;
  final num? columnOne;
  final num? columnTwo;

  const BarChartModel({
    this.id,
    this.columnOne,
    this.columnTwo,
  });

  factory BarChartModel.fromJson(Map<String, dynamic> json) {
    return BarChartModel(
      id: json['id'],
      columnOne: json['columnOne'],
      columnTwo: json['columnTwo'],
    );
  }
}





