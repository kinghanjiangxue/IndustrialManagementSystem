import 'package:flutter/material.dart';
import 'package:universe/widge/output/output_table_widge.dart';
import 'package:universe/widge/output/output_select_widge.dart';

class TestingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xffe4e5e9),
    appBar: AppBar(
      title: Text("机器实时对比数据"),
      centerTitle: true,
      backgroundColor: Color(0xff3875F6),

      actions: [
        Container(
          width: 200,
          padding: const EdgeInsets.only(
              right: 10,
          ),
          child:FilterSelectTable(),
        ),
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 5,
        bottom: 5
      ),
      child: PageView(
        children: [GenerateOutputTable(),],
      ),
    ),
  );
}


