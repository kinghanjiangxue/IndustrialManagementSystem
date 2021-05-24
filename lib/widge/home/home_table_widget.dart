import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:universe/model/home/home_data_model.dart';

class GenerateTable extends StatefulWidget {
  @override
  _GenerateTableState createState() => _GenerateTableState();
}

class _GenerateTableState extends State<GenerateTable> {

  List<HomeDataModel> _dataList = [];
  var homeTitleModel = HomeTitleModel();

  fetchUsers() async {
    var titleData = await http.get(
        Uri.parse('https://next.json-generator.com/api/json/get/E1HniUQF9'));
    if (titleData.statusCode == 200) {

      Map<String, dynamic>  titles = json.decode(titleData.body);
      setState(() {
        homeTitleModel = HomeTitleModel.fromTitleJson(titles);
      });
    } else {
      print("err code $titleData.statusCode");
    }

    var data = await http.get(
        Uri.parse('https://next.json-generator.com/api/json/get/4J__XazFq'));
    if (data.statusCode == 200) {
      List top = json.decode(data.body);
      setState(() {
        _dataList = top.map((json) => HomeDataModel.fromJson(json)).toList();
      });
    } else {
      print("err code $data.statusCode");
    }
  }

  @override
  void initState() {
    // fetchUsers().whenCom;
    super.initState();

    fetchUsers().whenComplete((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // Text(
          //   "User Details",
          //   style: TextStyle(
          //     fontSize: 50,
          //   ),
          // ),
          Container(

          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  )
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text(homeTitleModel.titleNumber.toString())),
                      DataColumn(label: Text(homeTitleModel.titleCustomerModel.toString())),
                      DataColumn(label: Text(homeTitleModel.titleProductSpecification.toString())),
                      DataColumn(label: Text(homeTitleModel.titleProcessing.toString())),
                      DataColumn(label: Text(homeTitleModel.titleDailyOutput.toString())),
                      DataColumn(label: Text(homeTitleModel.titleNumberChanges.toString())),
                      DataColumn(label: Text(homeTitleModel.titleChief.toString())),
                      DataColumn(label: Text(homeTitleModel.titleQualityInspector.toString())),
                      DataColumn(label: Text(homeTitleModel.titleRemarks.toString())),
                      ],
                    rows: _dataList
                        .map((homeModel) => DataRow(cells: <DataCell>[
                              DataCell(Text(homeModel.id.toString())),
                              DataCell(Text(homeModel.customerModel)),
                              DataCell(Text(homeModel.productSpecification)),
                              DataCell(Text(homeModel.processing)),
                              DataCell(Text(homeModel.dailyOutput.toString())),
                              DataCell(
                                  Text(homeModel.numberChanges.toString())),
                              DataCell(Text(homeModel.chief)),
                              DataCell(Text(homeModel.qualityInspector)),
                              DataCell(Text(homeModel.remarks)),
                            ]))
                        .toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
