import 'package:artravel/utils/color_utils.dart';
import 'package:artravel/widgets/app_text.dart';
import 'package:flutter/material.dart';

class numberWidget extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  String? text;
  IconData? icon;
  final Color borderColor;
  bool? isIcon;

  numberWidget(
      {super.key,
      this.isIcon = false,
      this.text = "1",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: hexStringToColor('84FFFF'),
      ),
      child: isIcon == false
          ? Center(child: AppText(text: text!, colour: Colors.black))
          : Center(child: Icon(icon)),
    );
  }
}
