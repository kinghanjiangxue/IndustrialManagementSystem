import 'package:flutter/material.dart';
import 'package:universe/widget/history/history_widget.dart';
import 'package:universe/widget/history/date_picker_widget.dart';
import 'package:universe/widget/history/date_range_picker_widget.dart';
import 'package:universe/widget/history/button_widget.dart';

class PerformancePage extends StatelessWidget {
  //下载日报表
  void downloadDailyFile() {
    print('下载日报表');
  }

  //下载月报表
  void downloadMonthFile() {
    print('下载日报表');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                  DownloadDailyWidget(
                    onClicked: () => downloadDailyFile(),
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
                  DownloadMonthWidget(
                    onClicked: () => downloadDailyFile(),
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
