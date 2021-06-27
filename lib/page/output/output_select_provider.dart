import 'package:flutter/material.dart';
import 'package:universe/widget/common/progress_hud.dart';

class OutputSelectProvider extends ChangeNotifier {
  String filter = "请选择";
  late Widget  childTableWidget;

  void increment(String value,) {
    this.filter = value;
    notifyListeners();
  }

  void refreshChild (Widget widget) {
    this.childTableWidget =  widget;
    notifyListeners();
  }

}