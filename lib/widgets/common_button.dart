import 'package:flutter/material.dart';
import 'package:registerform/constants/color_constants.dart';

class CommonButton extends StatelessWidget {
  final String? buttonText;
  final GestureTapCallback? onTap;
  final bool isborder;

  final double width;
  const CommonButton(
      {Key? key,
      this.buttonText = '',
      @required this.onTap,
      required this.width,
      required,
      required this.isborder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Container(
        width: isborder == true ? width - 1 : width,
        height: isborder == true ? 60 - 1 : 60,
        decoration: BoxDecoration(
            color: isborder == true
                ? Colors.white
                : ColorConstants.primaryThemeColor,
            border: isborder == true
                ? Border.all(width: 1, color: ColorConstants.primaryThemeColor)
                : Border.all(width: 0)),
        child: Center(
          child: Text(
            buttonText!,
            style: TextStyle(
              color: isborder == true
                  ? ColorConstants.primaryThemeColor
                  : Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
