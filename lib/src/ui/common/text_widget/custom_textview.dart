import 'package:flutter/material.dart';

class CustomTitleTextWidget extends StatelessWidget {
  const CustomTitleTextWidget(
      {Key? key,
      this.text,
      this.textAlign,
      this.textOverflow,
      this.height,
      this.fontWeight,
      this.color,
      this.textSize,
      this.maxLines})
      : super(key: key);

  final String? text;
  final int? maxLines;
  final double? textSize;
  final double? height;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.start,
      overflow: textOverflow,
      style: TextStyle(
          height: height, fontWeight: fontWeight ?? FontWeight.normal, color: color, fontSize: textSize ?? 14),
    );
  }
}
