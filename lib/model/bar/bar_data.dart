import 'package:flutter/material.dart';

class Data {
  // for ordering in the graph
  final int id;
  final String name;
  final double y;
  final Color color;

  const Data({
    required this.name,
    required this.id,
    required this.y,
    required this.color,
  });

  // factory Data.fromJson(Map<String, dynamic> json) {
  //   return Data(
  //     id: json['id'] as int,
  //     name: json['name'] as String,
  //     y: json['y'] as double,
  //     color: json['color'] as String
  //   );
  // }




}
