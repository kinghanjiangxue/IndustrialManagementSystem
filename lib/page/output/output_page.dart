import 'package:flutter/material.dart';
import 'package:universe/widge/output/output_table_widge.dart';

class TestingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Color(0xffe4e5e9),
    appBar: AppBar(
      title: Text("机器实时对比数据"),
      centerTitle: true,
      backgroundColor: Color(0xff3875F6),
    ),
    body: Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 5
      ),
      child: PageView(
        // elevation: 4,
        // shape: RoundedRectangleBorder(
        //   // borderRadius: BorderRadius.circular(32),
        // ),
        // color: const Color(0xff020227),
        children: [GenerateOutputTable(),],
        // child: Padding(
        //   padding: const EdgeInsets.only(top: 16),
        //   child:
        // ),
      ),
    ),
  );
}


