import 'package:flutter/material.dart';
import 'package:registerform/constants/color_constants.dart';

class CommonButton extends StatelessWidget {
  final String? buttonText;
  final GestureTapCallback? onTap;
  const CommonButton({Key? key, this.buttonText = '', @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: ColorConstants.primaryThemeColor,
        child: Center(
          child: Text(
            buttonText!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
