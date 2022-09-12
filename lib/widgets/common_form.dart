import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:registerform/constants/color_constants.dart';

class CommonForm extends StatelessWidget {
  final IconData? prefixIcon;
  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validatorName;

  final keyboardtype;

  const CommonForm({
    Key? key,
    this.prefixIcon,
    this.hintText = '',
    this.title,
    this.controller,
    this.validatorName,
    this.keyboardtype,
    this.onChanged,
    this.inputFormatters,
  }) : super(key: key);

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
            child: TextFormField(
              onChanged: onChanged,
              keyboardType: keyboardtype,
              controller: controller,
              validator: validatorName,
              inputFormatters: inputFormatters,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                // helperText: "",
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
