import 'package:flutter/material.dart';
import 'package:universe/page/pie/pie_chart_page.dart';

class HomePiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('开机比例'),
      centerTitle: true,
      backgroundColor: Color(0xff3875F6),
    ),
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: PageView(
        children: [
          PieChartPage(),
        ],
      ),
    ),
  );
}