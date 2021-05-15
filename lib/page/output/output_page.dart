import 'package:flutter/material.dart';
import 'package:universe/widge/output/output_table_widge.dart';

class TestingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("DataTable"),
      centerTitle: true,
      backgroundColor: Color(0xff3875F6),
    ),
    body: Center(
      child: GenerateOutputTable(),
    ),
  );
}


