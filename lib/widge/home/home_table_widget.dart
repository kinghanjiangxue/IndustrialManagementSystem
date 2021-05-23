import 'dart:io';

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
   HomeTitleModel? homeTitleModel;


  fetchUsers() async {

    var titleData = await http.get(
        Uri.parse('https://next.json-generator.com/api/json/get/E1HniUQF9'));
    if (titleData.statusCode == 200) {

      Map<String, dynamic>  titles = json.decode(titleData.body);


      setState(() {
        var _homeTitleModel = new HomeTitleModel.fromTitleJson(titles);
        // homeTitleModel = _homeTitleModel;
        // // Map<String, dynamic> myMap = new Map<String, dynamic>.from(titles);
        // // homeTitleModel = titles.map((json) => HomeTitleModel.fromTitleJson(json));
        // homeTitleModel = Map<String, dynamic>.from(titles); => HomeTitleModel.fromTitleJson(json))
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
          Container(),

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
                      // DataColumn(label: Text(homeTitleModel!.titleNumber)),
                      // DataColumn(label: Text(homeTitleModel!.titleCustomerModel)),
                      // DataColumn(label: Text(homeTitleModel!.titleProductSpecification)),
                      // DataColumn(label: Text(homeTitleModel!.titleProcessing)),
                      // DataColumn(label: Text(homeTitleModel!.titleDailyOutput)),
                      // DataColumn(label: Text(homeTitleModel!.titleNumberChanges)),
                      // DataColumn(label: Text(homeTitleModel!.titleChief)),
                      // DataColumn(label: Text(homeTitleModel!.titleQualityInspector)),
                      // DataColumn(label: Text(homeTitleModel!.titleRemarks)),


                      DataColumn(label: Text("")),
                      DataColumn(label: Text("homeTitleModel")),
                      DataColumn(label: Text("homeTitleModel.titleProductSpecification")),
                      DataColumn(label: Text("homeTitleModel")),
                      DataColumn(label: Text("homeTitleModel")),
                      DataColumn(label: Text("homeTitleModel")),
                      DataColumn(label: Text("homeTitleModel")),
                      DataColumn(label: Text("homeTitleModel")),
                      DataColumn(label: Text("homeTitleModel")),
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
