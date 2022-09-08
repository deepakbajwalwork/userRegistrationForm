import 'package:flutter/material.dart';
import 'package:registerform/widgets/common_button.dart';
import 'package:registerform/widgets/common_form.dart';
import 'package:registerform/widgets/common_scaffold.dart';

class YourAddress extends StatefulWidget {
  const YourAddress({Key? key}) : super(key: key);

  @override
  State<YourAddress> createState() => _YourAddressState();
}

class _YourAddressState extends State<YourAddress> {
  @override
  Widget build(BuildContext context) {
    Widget _bodyData() {
      return SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CommonForm(
                prefixIcon: Icons.apartment,
                hintText: "Address",
              ),
              const CommonForm(
                prefixIcon: Icons.apartment,
                hintText: "Landmark",
              ),
              const CommonForm(
                prefixIcon: Icons.apartment,
                hintText: "City",
              ),
              const CommonForm(
                prefixIcon: Icons.apartment,
                hintText: "Pin Code",
              ),
              const SizedBox(
                height: 30,
              ),
              CommonButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const YourAddress()),
                  );
                },
                buttonText: "Submit",
              ),
            ],
          ),
        ),
      );
    }

    return CommonScaffold(
      padding: const EdgeInsets.only(left: 20, right: 20),
      appTitle: "Your address",
      body: _bodyData(),
    );
  }
}
