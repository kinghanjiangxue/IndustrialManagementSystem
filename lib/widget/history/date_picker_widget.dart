import 'package:universe/widget/history/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef clickCallback = void Function(String value);

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  final clickCallback onClick;

  @override
  DatePickerWidgetState createState() => DatePickerWidgetState();
}

class DatePickerWidgetState extends State<DatePickerWidget> {
  final currentDate = DateTime.now();
  DateTime? date;

  String getText() {
    if (date == null) {
      return '${currentDate.year}年${currentDate.month}月${currentDate.day}日';
    } else {
      return DateFormat('yyyy年MM月dd日').format(date!);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonWidget(
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialEntryMode: DatePickerEntryMode.calendar,
      helpText: '日期选择器',
      cancelText: '取消',
      confirmText: '确定',
      initialDatePickerMode: DatePickerMode.day,
      errorFormatText: '输入日期格式错误',
      errorInvalidText: '输入日期超出可选范围',
      fieldHintText: '请输入日期',
      fieldLabelText: '日期',
    );

    if (newDate == null) return;

    setState(() {
      date = newDate;
      widget.onClick(getText());
    });
  }
}
