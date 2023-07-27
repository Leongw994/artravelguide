import 'package:artravel/utils/color_utils.dart';
import 'package:artravel/widgets/app_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponsiveButton extends StatelessWidget {
  bool? isReponse;
  double? width;
  ResponsiveButton({super.key, this.width = 120, this.isReponse = false});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isReponse == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: hexStringToColor('00BCD4')),
        child: Row(
          mainAxisAlignment: isReponse == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isReponse == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppText(
                      text: "Book your table now",
                      colour: Colors.black,
                    ))
                : Container(),
            Image.asset("images/arrow_right.png"),
          ],
        ),
      ),
    );
  }
}
