import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:universe/model/home/home_data_model.dart';
import 'package:universe/widget/common/progress_hud.dart';

class GenerateTable extends StatefulWidget {
  @override
  _GenerateTableState createState() => _GenerateTableState();
}

class _GenerateTableState extends State<GenerateTable> {

  List<HomeDataModel> _dataList = [];
  var homeTitleModel = HomeTitleModel();
  static double  columnFont = 16;
  static double  rowFont = 16;
  static String rowFontFamily = "RobotoMono";

  fetchUsers() async {
    var titleData = await http.get(
        Uri.parse('https://api.json-generator.com/templates/cwvLGZdMvEZl/data'),
        headers:<String, String>{'authorization': 'Bearer ' + '29v1p78kr1k0djvb76wncuzf2lzq1fgkb9gkzr4x'});
    if (titleData.statusCode == 200) {

      Map<String, dynamic>  titles = json.decode(titleData.body);
      setState(() {
        homeTitleModel = HomeTitleModel.fromTitleJson(titles);
      });
    } else {
      print("err code $titleData.statusCode");
    }

    var data = await http.get(
        Uri.parse('https://api.json-generator.com/templates/3NyKrloAUjOC/data'),
        headers:<String, String>{'authorization': 'Bearer ' + '29v1p78kr1k0djvb76wncuzf2lzq1fgkb9gkzr4x'});
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
    super.initState();
    fetchUsers().whenComplete((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    if (_dataList.length == 0 ) {
      return  Center(
        child: ProgressHUD(
          backgroundColor: Colors.black.withOpacity(0.6),
          color: Colors.white,
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
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

              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 10,
                    columns: [
                      DataColumn(label: Text(homeTitleModel.titleNumber.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: columnFont,
                          height: 1.2,
                          fontFamily: "Courier",
                        ))),
                      DataColumn(label: Text(homeTitleModel.titleCustomerModel.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: columnFont,
                            height: 1.2,
                            fontFamily: "Courier",
                          ))),
                      DataColumn(label: Text(homeTitleModel.titleProductSpecification.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: columnFont,
                            height: 1.2,
                            fontFamily: "Courier",
                          ))),
                      DataColumn(label: Text(homeTitleModel.titleProcessing.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: columnFont,
                            height: 1.2,
                            fontFamily: "Courier",
                          ))),
                      DataColumn(label: Text(homeTitleModel.titleDailyOutput.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: columnFont,
                            height: 1.2,
                            fontFamily: "Courier",
                          ))),
                      DataColumn(label: Text(homeTitleModel.titleNumberChanges.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: columnFont,
                            height: 1.2,
                            fontFamily: "Courier",
                          ))),
                      DataColumn(label: Text(homeTitleModel.titleChief.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: columnFont,
                            height: 1.2,
                            fontFamily: "Courier",
                          ))),
                      DataColumn(label: Text(homeTitleModel.titleQualityInspector.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: columnFont,
                            height: 1.2,
                            // fontFamily: "RobotoMono",
                          ))),
                      DataColumn(label: Text(homeTitleModel.titleRemarks.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: columnFont,
                            height: 1.2,
                            fontFamily: "RobotoMono",
                          ))),
                      ],
                    rows: _dataList
                        .map((homeModel) => DataRow(cells: <DataCell>[
                              DataCell(Text(homeModel.id.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: rowFont,
                                    height: 1.2,
                                    fontFamily: rowFontFamily,
                                  ))),
                              DataCell(Text(homeModel.customerModel,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: rowFont,
                                    height: 1.2,
                                    fontFamily: rowFontFamily,
                                  ))),
                              DataCell(Text(homeModel.productSpecification,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: rowFont,
                                    height: 1.2,
                                    fontFamily: rowFontFamily,
                                  ))),
                              DataCell(Text(homeModel.processing,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: rowFont,
                                    height: 1.2,
                                    fontFamily: rowFontFamily,
                                  ))),
                              DataCell(Text(homeModel.dailyOutput.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: rowFont,
                                    height: 1.2,
                                    fontFamily: rowFontFamily,
                                  ))),
                              DataCell(
                                  Text(homeModel.numberChanges.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: rowFont,
                                        height: 1.2,
                                        fontFamily: rowFontFamily,
                                      ))),
                              DataCell(Text(homeModel.chief,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: rowFont,
                                    height: 1.2,
                                    fontFamily: rowFontFamily,
                                  ))),
                              DataCell(Text(homeModel.qualityInspector,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: rowFont,
                                    height: 1.2,
                                    fontFamily: rowFontFamily,
                                  ))),
                              DataCell(Text(homeModel.remarks,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: rowFont,
                                    height: 1.2,
                                    fontFamily: rowFontFamily,
                                  ))),
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
