import 'package:flutter/material.dart';
import 'package:universe/widge/history/history_widge.dart';

class PerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('历史记录'),
          centerTitle: true,
          backgroundColor: Color(0xff3875F6),
        ),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: GenerateTable(),
    ),
      );
}
