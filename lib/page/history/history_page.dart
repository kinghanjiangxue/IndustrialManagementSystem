import 'package:flutter/material.dart';
import 'package:universe/widget/history/history_widget.dart';
import 'package:universe/widget/history/date_picker_widget.dart';
import 'package:universe/widget/history/date_range_picker_widget.dart';
import 'package:universe/widget/history/button_widget.dart';
import 'package:http/http.dart' as http;
import 'package:barcode_widget/barcode_widget.dart';
import 'dart:convert';
import 'package:universe/widget/common/progress_hud.dart';

class PerformancePage extends StatefulWidget {
  @override
  _PerformancePageState createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  fetchCode(String fileName) async {
    var titleData = await http.get(Uri.parse(
        'http://www.json-generator.com/api/json/get/bTUyMSYoia?indent=2'));

    if (titleData.statusCode == 200) {
      Map<String, dynamic> titles = json.decode(titleData.body);
      setState(() {
        showCustomDialog(fileName, titles['url']);
      });
    } else {
      print("err code $titleData.statusCode");
    }
  }

  Future showCustomDialog(String fileName, String url) async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              fileName,
              textAlign: TextAlign.center,
            ),
            content: UnconstrainedBox(
              child: SizedBox(
                width: 210,
                height: 210,
                child: Dialog(
                  insetPadding: EdgeInsets.all(5),
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    color: Colors.black,
                    data: url.length > 0 ? url : '请重新扫码',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  "确定",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        });
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  ///下载Excel日报表
  void downloadDailyExcelFile(BuildContext context) {
    fetchCode('扫码下载日报表(Excel版)');
  }

  ///下载pdf日报表
  void downloadDailyPDFFile(BuildContext context) {
    fetchCode('扫码下载日报表(pdf版)');
  }

  ///下载Excel月报表
  void downloadMonthExcelFile(BuildContext context) {
    fetchCode('扫码下载月报表(Excel版)');
  }

  ///下载PDF月报表
  void downloadMonthPDFFile(BuildContext context) {
    fetchCode('扫码下载月报表(pdf版)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('历史记录'),
          centerTitle: true,
          backgroundColor: Color(0xff3875F6),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  // textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "日报表:",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DatePickerWidget(),
                    DownloadDailyExcelWidget(
                      onClicked: () => downloadDailyExcelFile(context),
                    ),
                    DownloadDailyPDFWidget(
                      onClicked: () => downloadDailyPDFFile(context),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "月报表:",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DateRangePickerWidget(),
                    DownloadMonthExcelWidget(
                      onClicked: () => downloadMonthExcelFile(context),
                    ),
                    DownloadMonthPDFWidget(
                      onClicked: () => downloadMonthPDFFile(context),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GenerateTable(),
              ),
            ],
          ),
        ));
  }
}
