import 'package:flutter/material.dart';
import 'package:universe/widget/bar/bar_chart_widget.dart';

class BarHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        backgroundColor: Color(0xffe4e5e9),
        appBar: AppBar(
          title: Text('图表界面'),
          centerTitle: true,
          backgroundColor: Color(0xff3875F6),
        ),

        body: Padding(
          padding: const EdgeInsets.all(5),
          child: PageView(
            children: [
              BarChartSample2(),
            ],
          ),
        ),
      );
}
