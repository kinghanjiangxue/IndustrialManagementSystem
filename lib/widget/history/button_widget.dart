import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(

    style: ElevatedButton.styleFrom(
      minimumSize: Size(100, 50),
      primary: Color(0xffFAFAFA),
      side: BorderSide(
        color: Color(0xffdedede),
        width: 1,
      )
    ),
    icon: Image.asset(
      // 图标
      'images/calendar.png',
      width: 25,
      height: 25,
    ),

    label: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    onPressed: onClicked,
  );
}


///日报表PDF下载
class DownloadDailyPDFWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DownloadDailyPDFWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(

    iconSize: 25.0,
    icon: Image.asset(
      // 图标
      'images/pdf.png',
      width: 25,
      height: 25,
    ),
    onPressed: onClicked,
  );
}

///日报表Excel下载
class DownloadDailyExcelWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DownloadDailyExcelWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(

    iconSize: 25.0,
    icon: Image.asset(
      'images/excel.png',
      width: 25,
      height: 25,
    ),
    onPressed: onClicked,
  );
}


///月报表PDF下载

class DownloadMonthPDFWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DownloadMonthPDFWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(

    iconSize: 25.0,
    icon: Image.asset(
      // 图标
      'images/pdf.png',
      width: 25,
      height: 25,
    ),
    onPressed: onClicked,
  );
}

///月报表Excel载

class DownloadMonthExcelWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DownloadMonthExcelWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(

    iconSize: 25.0,
    icon: Image.asset(
      // 图标
      'images/excel.png',
      width: 25,
      height: 25,
    ),
    onPressed: onClicked,
  );
}