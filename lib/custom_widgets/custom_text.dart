import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  CustomText({
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.height,
    this.color,
    Key? key,
  }) : super(key: key);
  String text;
  Color? color;
  var fontSize;
  FontWeight? fontWeight;
  var fontFamily;
  var height;

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.color,
        fontSize: widget.fontSize ?? 14.0,
        fontFamily: widget.fontFamily,
        height: widget.height ?? 1,
        fontWeight: widget.fontWeight ?? FontWeight.w400,
      ),
    );
  }
}
