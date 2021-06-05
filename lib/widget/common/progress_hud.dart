import 'package:flutter/material.dart';

/// 加载视图
/// 下拉刷新/上拉加载更多时使用到.
class ProgressHUD extends StatefulWidget {
  final Color color;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final double strokeWidth;
  final double? value;

  ProgressHUD({
    Key? key,
    this.color = const Color(0xFF202123),
    this.backgroundColor = const Color(0xFFE2E2E2),
    this.width = 17,
    this.height,
    this.strokeWidth = 2.0,
    this.value,
  }) : super(key: key);

  @override
  _ProgressHUDState createState() => _ProgressHUDState();
}

class _ProgressHUDState extends State<ProgressHUD> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height ?? widget.width,
      child: CircularProgressIndicator(
        strokeWidth: widget.strokeWidth,
        backgroundColor: widget.backgroundColor,
        value: widget.value,
        valueColor: AlwaysStoppedAnimation(widget.color),
      ),
    );
  }
}
