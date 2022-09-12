import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:registerform/model/user_model.dart';
import 'package:registerform/utls/flushbar.dart';
import 'package:registerform/validators/validators.dart';
import 'package:registerform/view_model/user_vm.dart';
import 'package:registerform/widgets/button_popup.dart';
import 'package:registerform/widgets/common_button.dart';
import 'package:registerform/widgets/common_form.dart';
import 'package:registerform/widgets/common_scaffold.dart';

class YourAddress extends StatefulWidget {
  const YourAddress({Key? key}) : super(key: key);

  @override
  State<YourAddress> createState() => _YourAddressState();
}

class _YourAddressState extends State<YourAddress> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _landmark = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  String? _selectedState = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget _bodyData() {
      return SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonForm(
                  validatorName: Validators.validateAddress,
                  prefixIcon: Icons.apartment,
                  controller: _address,
                  hintText: "Address",
                ),
                CommonForm(
                  validatorName: Validators.validateAddress,
                  controller: _landmark,
                  prefixIcon: Icons.apartment,
                  hintText: "Landmark",
                ),
                CommonForm(
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                  ],
                  validatorName: Validators.validateAddress,
                  controller: _city,
                  prefixIcon: Icons.apartment,
                  hintText: "City",
                ),
                CommonForm(
                  controller: _pincode,
                  keyboardtype: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  ],
                  prefixIcon: Icons.apartment,
                  hintText: "Pin Code",
                ),
                ButtonPopup(
                  title: "",
                  text: _selectedState.toString().trim() == ''
                      ? "Select your state"
                      : _selectedState,
                  menueItem: [
                    MenueItem(
                      text: "Maharashtra",
                      value: "Maharashtra",
                    ),
                    MenueItem(
                      text: "Gujarat",
                      value: "Gujarat",
                    ),
                    MenueItem(
                      text: "Karnataka",
                      value: "Karnataka",
                    )
                  ],
                  onSelected: (v) {
                    // print(v);
                    setState(() {
                      _selectedState = v;
                    });
                  },
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

                    UserViewModel viewModel =
                        Provider.of<UserViewModel>(context, listen: false);

                    UsersModel? userModel = viewModel.getUserFormData;
                    userModel.address = _address.value.text;
                    userModel.landmark = _landmark.value.text;
                    userModel.city = _city.value.text;
                    userModel.pincode = _pincode.value.text;
                    userModel.state = _selectedState;
                    viewModel.setuserFormData = userModel;

                    bool response = await viewModel.saveUsersToDb();
                    if (response) {
                      flushBar(text: "Success");
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    } else {
                      flushBar(text: "Error");
                    }
                  },
                  buttonText: "Submit",
                ),
              ],
            ),
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
