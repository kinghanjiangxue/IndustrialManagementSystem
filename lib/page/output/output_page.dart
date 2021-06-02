import 'package:flutter/material.dart';
import 'package:universe/widget/output/output_table_widget.dart';
import 'package:universe/widget/output/output_select_widget.dart';

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
              left: 200,
              right: 20,
              top: 20,
              bottom: 20
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


