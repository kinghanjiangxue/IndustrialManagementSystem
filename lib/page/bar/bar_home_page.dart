import 'package:flutter/material.dart';
import 'package:universe/page/bar/bar_chart_page.dart';

class BarHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('柱状图'),
          centerTitle: true,
          backgroundColor: Color(0xff3875F6),
        ),

        body: Padding(
          padding: const EdgeInsets.all(8),
          child: PageView(
            children: [
              BarChartPage(),
            ],
          ),
        ),
      );
}
