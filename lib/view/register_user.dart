import 'package:flutter/material.dart';
import 'package:registerform/constants/color_constants.dart';
import 'package:registerform/view/your_address.dart';
import 'package:registerform/widgets/common_button.dart';
import 'package:registerform/widgets/common_form.dart';
import 'package:registerform/widgets/common_scaffold.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  _userImage() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 35,
          child: Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
            ),
            child: const Icon(
              Icons.edit,
              size: 14,
            ),
          ),
        )
      ],
    );
  }

  Widget _radioButton(
    String text, {
    bool isSelected = false,
  }) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: CircleAvatar(
              radius: 6,
              backgroundColor:
                  isSelected ? ColorConstants.primaryThemeColor : Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(text)
      ],
    );
  }

  _selectGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            _radioButton(
              "Male",
              isSelected: true,
            ),
            const SizedBox(
              width: 10,
            ),
            _radioButton(
              "Female",
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _bodyData() {
      return SingleChildScrollView(
        child: Column(
          children: [
            _userImage(),
            const CommonForm(
              prefixIcon: Icons.person,
              hintText: "Enter your first name here",
              title: "First Name",
            ),
            const CommonForm(
              prefixIcon: Icons.person,
              hintText: "Enter your 10 digit phone number",
              title: "Last Name*",
            ),
            const CommonForm(
              prefixIcon: Icons.call,
              hintText: "Enter your first name here",
              title: "Phone Number*",
            ),
            const CommonForm(
              prefixIcon: Icons.email,
              hintText: "Your email goes here",
              title: "Email*",
            ),
            _selectGender(),
            const CommonForm(
              prefixIcon: Icons.lock,
              hintText: "Password",
              title: "Password*",
            ),
            const CommonForm(
              prefixIcon: Icons.lock,
              hintText: "Password",
              title: "Confirm Password*",
            ),
            const SizedBox(
              height: 30,
            ),
            CommonButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const YourAddress()),
                );
              },
              buttonText: "Next",
            ),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      );
    }

    return CommonScaffold(
      padding: const EdgeInsets.only(left: 20, right: 20),
      appTitle: "Register",
      body: _bodyData(),
    );
  }
}
