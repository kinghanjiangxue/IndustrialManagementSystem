import 'package:universe/model/bar/bar_data.dart';
import 'package:flutter/material.dart';

class BarData {

  // static int interval = 5;
  static List<Data> barData = [
    Data(
      id: 0,
      name: '机台1',
      y: 15,
      color: Color(0xff19bfff),
    ),
    Data(
      name: '机台2',
      id: 1,
      y: 12,
      color: Color(0xffff4d94),
    ),
    Data(
      name: '机台3',
      id: 2,
      y: 11,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: '机台4',
      id: 3,
      y: 10,
      color: Color(0xffffdd80),
    ),
    Data(
      name: '机台5',
      id: 4,
      y: 5,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: '机台6',
      id: 5,
      y: 17,
      color: Color(0xffffdd80),
    ),
    Data(
      name: '机台7',
      id: 6,
      y: 5,
      color: Color(0xffff4d94),
    ),
  ];
}
