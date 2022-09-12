import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class ButtonPopup extends StatelessWidget {
  final String? text;
  final List<MenueItem>? menueItem;
  final Function(dynamic data)? onSelected;

  final String title;

  const ButtonPopup(
      {Key? key,
      @required this.text,
      this.onSelected,
      @required this.menueItem,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: unnecessary_null_comparison
          if (title != null) ...{
            Text(
              title,
              style: const TextStyle(
                // color: ColorConstants.primaryThemeColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          },
          PopupMenuButton(
            onSelected: onSelected,
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text!,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            itemBuilder: (BuildContext context) => List.generate(
              menueItem!.length,
              (index) {
                return PopupMenuItem(
                  value: menueItem![index].value,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      menueItem![index].text!,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenueItem {
  MenueItem({this.value, this.text});
  final String? value;
  final String? text;
}
