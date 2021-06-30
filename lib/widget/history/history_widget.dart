import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:universe/model/home/home_data_model.dart';
import 'package:universe/widget/common/progress_hud.dart';

class GenerateTable extends StatefulWidget {
  final String dateString;

  const GenerateTable({
    Key? key,
    required this.dateString}) : super(key: key);

  @override
  GenerateTableState createState() => GenerateTableState();
}

class GenerateTableState extends State<GenerateTable> {
  List<HomeDataModel> _dataList = [];
  var homeTitleModel = HomeTitleModel();
  static double columnFont = 16;
  static double rowFont = 16;
  static String rowFontFamily = "RobotoMono";

  fetchUsers() async {
    var params = Map<String, String>();
    params["date"] = widget.dateString;
    print('fetchUsers-----${widget.dateString}');
    var titleData = await http.post(
      Uri.parse('https://api.json-generator.com/templates/dC3h8Maw1pw_/data'),
      headers: <String, String>{
        'authorization': 'Bearer ' + '29v1p78kr1k0djvb76wncuzf2lzq1fgkb9gkzr4x'
      },
      body: params,
    );
    if (titleData.statusCode == 200) {
      Map<String, dynamic> titles = json.decode(titleData.body);
      setState(() {
        homeTitleModel = HomeTitleModel.fromTitleJson(titles);
      });
    } else {
      print("err code $titleData.statusCode");
    }

    var data = await http.post(
      Uri.parse('https://api.json-generator.com/templates/LsZteXDWDBct/data'),
      headers: <String, String>{
        'authorization': 'Bearer ' + '29v1p78kr1k0djvb76wncuzf2lzq1fgkb9gkzr4x'
      },
      body: params,
    );
    if (data.statusCode == 200) {
      List top = json.decode(data.body);
      setState(() {
        _dataList = top.map((json) => HomeDataModel.fromJson(json)).toList();
      });
    } else {
      print("err code $data.statusCode");
    }
  }

  void refreshTableData() {
    _dataList = [];
    fetchUsers().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_dataList.length == 0) {
      return Center(
        child: ProgressHUD(
          backgroundColor: Colors.black.withOpacity(0.6),
          color: Colors.white,
        ),
      );
    }

    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    // offset: const Offset(3.0, 3.0),
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
                    // columnSpacing: 40,
                    columns: [
                      DataColumn(
                          label: Text(homeTitleModel.titleNumber.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: columnFont,
                                height: 1.2,
                                fontFamily: "Courier",
                              ))),
                      DataColumn(
                          label:
                              Text(homeTitleModel.titleCustomerModel.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: columnFont,
                                    height: 1.2,
                                    fontFamily: "Courier",
                                  ))),
                      DataColumn(
                          label: Text(
                              homeTitleModel.titleProductSpecification
                                  .toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: columnFont,
                                height: 1.2,
                                fontFamily: "Courier",
                              ))),
                      DataColumn(
                          label: Text(homeTitleModel.titleProcessing.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: columnFont,
                                height: 1.2,
                                fontFamily: "Courier",
                              ))),
                      DataColumn(
                          label:
                              Text(homeTitleModel.titleDailyOutput.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: columnFont,
                                    height: 1.2,
                                    fontFamily: "Courier",
                                  ))),
                      DataColumn(
                          label:
                              Text(homeTitleModel.titleNumberChanges.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: columnFont,
                                    height: 1.2,
                                    fontFamily: "Courier",
                                  ))),
                      DataColumn(
                          label: Text(homeTitleModel.titleChief.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: columnFont,
                                height: 1.2,
                                fontFamily: "Courier",
                              ))),
                      DataColumn(
                          label: Text(
                              homeTitleModel.titleQualityInspector.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: columnFont,
                                height: 1.2,
                                // fontFamily: "RobotoMono",
                              ))),
                      DataColumn(
                          label: Text(homeTitleModel.titleRemarks.toString(),
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
                              DataCell(Text(homeModel.numberChanges.toString(),
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
          ),
        ],
      ),
    );
  }
}
