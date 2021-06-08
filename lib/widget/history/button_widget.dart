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
      width: 30,
      height: 30,
    ),

    label: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    onPressed: onClicked,
  );
}

class DownloadDailyWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DownloadDailyWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(

    iconSize: 25.0,
    icon: Icon(Icons.file_download),
    onPressed: onClicked,
  );
}


class DownloadMonthWidget extends StatelessWidget {
  final VoidCallback onClicked;

  const DownloadMonthWidget({
    Key? key,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(

    iconSize: 25.0,
    icon: Icon(Icons.file_download),
    onPressed: onClicked,
  );
}