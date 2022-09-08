import 'package:flutter/material.dart';
import 'package:registerform/constants/color_constants.dart';

class CommonForm extends StatelessWidget {
  final IconData? prefixIcon;
  final String? hintText;
  final String? title;

  const CommonForm({Key? key, this.prefixIcon, this.hintText = '', this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...{
            Text(
              title!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          },
          SizedBox(
            height: 55,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: prefixIcon != null
                    ? Icon(
                        prefixIcon,
                        color: ColorConstants.primaryThemeColor,
                      )
                    : null,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                hintText: hintText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
