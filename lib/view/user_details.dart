import 'package:flutter/material.dart';
import 'package:registerform/constants/color_constants.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _basicInfo() {
      return Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic Info',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 35,
                    ),
                    Text(
                      'deepakbajwal@gmail.com',
                      style: TextStyle(
                        color: ColorConstants.primaryThemeColor,
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'deepakbajwal@gmail.com',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'John smit',
                      style: TextStyle(
                        color: ColorConstants.primaryThemeColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Ux designer',
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstants.primaryThemeColor,
                      ),
                    ),
                    Text(
                      'This is the address',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget _bodyData() {
      return Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.cancel_outlined),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          const Divider(),
          _basicInfo(),
        ],
      );
    }

    return Scaffold(
      body: _bodyData(),
    );
  }
}
