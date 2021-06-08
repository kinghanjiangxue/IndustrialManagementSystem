import 'package:flutter/material.dart';


class OutputChartModel {
  // for ordering in the graph
  final num? id;
  final num? columnOne;
  final num? columnTwo;

  const OutputChartModel({
    this.id,
    this.columnOne,
    this.columnTwo,
  });

  factory OutputChartModel.fromJson(Map<String, dynamic> json) {
    return OutputChartModel(
      id: json['id'],
      columnOne: json['columnOne'],
      columnTwo: json['columnTwo'],
    );
  }
}





