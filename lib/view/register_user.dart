import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:registerform/constants/color_constants.dart';
import 'package:registerform/constants/constants.dart';
import 'package:registerform/model/user_model.dart';
import 'package:registerform/validators/validators.dart';
import 'package:registerform/view_model/user_vm.dart';
import 'package:registerform/widgets/common_button.dart';
import 'package:registerform/widgets/common_form.dart';
import 'package:registerform/widgets/common_scaffold.dart';
import 'package:image_picker/image_picker.dart';
import '../utls/flushbar.dart';
import 'user_info.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Uint8List? _userImageData;

  String? _gender = Constants.genderMale;

  _userImage() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: InkWell(
            onTap: () async {
              print('object');
              final ImagePicker _picker = ImagePicker();
              // Pick an image
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);

              File file = File(image!.path);
              _userImageData = file.readAsBytesSync();
              setState(() {});
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: _userImageData != null
                      ? Image.memory(
                          _userImageData!,
                          fit: BoxFit.fill,
                        )
                      : null),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 35,
          child: InkWell(
            onTap: () async {},
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
          ),
        )
      ],
    );
  }

  Widget _radioButton(
    String text, {
    bool isSelected = false,
    GestureTapCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
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
                backgroundColor: isSelected
                    ? ColorConstants.primaryThemeColor
                    : Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(text)
        ],
      ),
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
              isSelected: _gender == Constants.genderMale,
              onTap: () {
                print('object');
                setState(() {
                  _gender = Constants.genderMale;
                });
              },
            ),
            const SizedBox(
              width: 10,
            ),
            _radioButton(
              "Female",
              isSelected: _gender == Constants.genderFemale,
              onTap: () {
                setState(() {
                  _gender = Constants.genderFemale;
                });
              },
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _userImage(),
              CommonForm(
                controller: _firstNameController,
                validatorName: Validators.validateName,
                prefixIcon: Icons.person,
                hintText: "Enter your first name here",
                title: "First Name",
              ),
              CommonForm(
                validatorName: Validators.validateName,
                controller: _lastNameController,
                prefixIcon: Icons.person,
                hintText: "Enter your last name here",
                title: "Last Name*",
              ),
              CommonForm(
                controller: _phoneNumberController,
                keyboardtype: TextInputType.number,
                prefixIcon: Icons.call,
                hintText: "Enter your 10 digit phone number",
                title: "Phone Number*",
                validatorName: Validators.mobileNoValidation,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(
                    RegExp(r"[0-9]"),
                  )
                ],
              ),
              CommonForm(
                validatorName: Validators.emailValidation,
                controller: _emailController,
                prefixIcon: Icons.email,
                hintText: "Your email goes here",
                title: "Email*",
              ),
              _selectGender(),
              CommonForm(
                controller: _passwordController,
                validatorName: Validators.validatePassword,
                prefixIcon: Icons.lock,
                hintText: "Password",
                title: "Password*",
              ),
              CommonForm(
                controller: _confirmPasswordController,
                prefixIcon: Icons.lock,
                validatorName: Validators.validatePassword,
                hintText: "Confirm Password",
                title: "Confirm Password*",
              ),
              const SizedBox(
                height: 30,
              ),
              CommonButton(
                isborder: false,
                width: MediaQuery.of(context).size.width,
                onTap: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  if (_passwordController.value.text !=
                      _confirmPasswordController.value.text) {
                    flushBar(
                        text: "New password and confirm password not matching",
                        title: "Alert");
                  }

                  UserViewModel viewModel =
                      Provider.of<UserViewModel>(context, listen: false);

                  UsersModel? userModel = viewModel.getUserFormData;
                  userModel.lastName = _lastNameController.value.text;
                  userModel.firstName = _firstNameController.value.text;
                  userModel.password = _passwordController.value.text;
                  userModel.email = _emailController.value.text;
                  userModel.phoneNumber = _phoneNumberController.value.text;
                  userModel.gender = _gender;
                  userModel.picture = _userImageData;

                  viewModel.setuserFormData = userModel;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const YourInfo(),
                    ),
                  );
                },
                buttonText: "Next",
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
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
