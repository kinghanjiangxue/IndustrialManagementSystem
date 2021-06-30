import 'package:universe/widget/history/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef clickCallback = void Function(String value);

class DateRangePickerWidget extends StatefulWidget {

  DateRangePickerWidget({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  final clickCallback onClick;

  @override
  DateRangePickerWidgetState createState() => DateRangePickerWidgetState();
}

class DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  DateTimeRange? dateRange;

  String getFrom() {
    if (dateRange == null) {
      return '开始时间';
    } else {
      return DateFormat('yyyy年MM月dd日').format(dateRange!.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return '结束时间';
    } else {
      return DateFormat('yyyy年MM月dd日').format(dateRange!.end);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonWidget(
        text: getFrom() + " 至 " + getUntil(),
        onClicked: () => pickDateRange(context),
      );

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
      helpText: '日期选择器',
      cancelText: '取消',
      confirmText: '确定',
      errorFormatText: '输入日期格式错误',
      errorInvalidText: '输入日期超出可选范围',
      saveText: '保存',
      fieldStartLabelText: '开始日期',
      fieldStartHintText: '请输入开始日期',
      fieldEndHintText: '请输入结束日期',
      fieldEndLabelText: '结束日期',
    );

    if (newDateRange == null) return;

    setState(() {
      dateRange = newDateRange;
      widget.onClick(getFrom() + " 至 " + getUntil());
    });
  }
}
