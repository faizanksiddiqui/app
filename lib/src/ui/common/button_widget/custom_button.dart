import 'package:faizanks/src/ui/common/text_widget/custom_textview.dart';
import 'package:faizanks/src/utils/color_constant.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color, textColor;
  final Color? bgColor;
  final double? height;
  final double? width;
  final double? textSize;
  final double? borderRadius;
  final double? elevation;

  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.bgColor,
    required this.onPressed,
    this.height,
    this.elevation,
    this.textSize,
    this.borderRadius,
    this.width,
    this.color = Colors.transparent,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: height ?? 55,
      width: width ?? size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: bgColor, //background color of button
          elevation: elevation ?? 8, //elevation of button
          shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(borderRadius ?? 30)),
        ),
        child: CustomTitleTextWidget(
          text: text,
          maxLines: 1,
          color: textColor,
          textSize: textSize ?? 16,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
