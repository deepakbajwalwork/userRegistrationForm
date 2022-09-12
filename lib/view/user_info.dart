import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:registerform/model/user_model.dart';
import 'package:registerform/utls/flushbar.dart';
import 'package:registerform/validators/validators.dart';
import 'package:registerform/view/your_address.dart';
import 'package:registerform/view_model/user_vm.dart';
import 'package:registerform/widgets/button_popup.dart';
import 'package:registerform/widgets/common_button.dart';
import 'package:registerform/widgets/common_form.dart';
import 'package:registerform/widgets/common_scaffold.dart';

class YourInfo extends StatefulWidget {
  const YourInfo({Key? key}) : super(key: key);

  @override
  State<YourInfo> createState() => _YourInfoState();
}

class _YourInfoState extends State<YourInfo> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _grade = TextEditingController();
  final TextEditingController _experience = TextEditingController();

  String? _selectedStateYearPass = "";
  String? _selectedStateEducation = "";
  String? _selectedStateDesignition = "";
  String? _selectedStateDomain = "";
  @override
  Widget build(BuildContext context) {
    Widget headings(String str) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: Text(
            str,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ]);
    }

    Widget _bodyData() {
      return SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                headings("Educational Info"),
                ButtonPopup(
                  title: "Education*",
                  text: _selectedStateEducation.toString().trim() == ''
                      ? "Select Your Qualification"
                      : _selectedStateEducation,
                  menueItem: [
                    MenueItem(
                      text: "Graduate",
                      value: "Graduate",
                    ),
                    MenueItem(
                      text: "Post Graduate",
                      value: "Post Graduate",
                    ),
                    MenueItem(
                      text: "HSC/Diploma",
                      value: "HSC/Diploma",
                    ),
                    MenueItem(
                      text: "SSC",
                      value: "SSC",
                    )
                  ],
                  onSelected: (v) {
                    // print(v);
                    setState(() {
                      _selectedStateEducation = v;
                    });
                  },
                ),
                ButtonPopup(
                  title: "Year Of Passing*",
                  text: _selectedStateYearPass.toString().trim() == ''
                      ? "Enter Year Of Passing"
                      : _selectedStateYearPass,
                  menueItem: [
                    MenueItem(
                      text: "2022",
                      value: "2022",
                    ),
                    MenueItem(
                      text: "2021",
                      value: "2021",
                    ),
                    MenueItem(
                      text: "2020",
                      value: "2020",
                    )
                  ],
                  onSelected: (v) {
                    // print(v);
                    setState(() {
                      _selectedStateYearPass = v;
                    });
                  },
                ),
                CommonForm(
                  validatorName: Validators.validateGrade,
                  title: "Grade*",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  ],
                  keyboardtype: TextInputType.number,

                  // prefixIcon: Icons.apartment,
                  controller: _grade,
                  hintText: "Grade",
                ),
                const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10),
                headings("Professional Info"),
                CommonForm(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(2),
                    FilteringTextInputFormatter.allow(
                      RegExp(r"[0-9]"),
                    )
                  ],
                  validatorName: Validators.validateGrade,

                  keyboardtype: TextInputType.number,
                  title: "Experience*",
                  controller: _experience,
                  // prefixIcon: Icons.apartment,
                  hintText: "Enter the years of experience",
                ),
                ButtonPopup(
                  title: "Designition*",
                  text: _selectedStateDesignition.toString().trim() == ''
                      ? "Select Designition"
                      : _selectedStateDesignition,
                  menueItem: [
                    MenueItem(
                      text: "Executive",
                      value: "Executive",
                    ),
                    MenueItem(
                      text: "Senior Executive",
                      value: "Senior Executive",
                    ),
                    MenueItem(
                      text: "Senior Executive",
                      value: "Senior Executive",
                    )
                  ],
                  onSelected: (v) {
                    // print(v);
                    setState(() {
                      _selectedStateDesignition = v;
                    });
                  },
                ),
                ButtonPopup(
                  title: "Domain*",
                  text: _selectedStateDomain.toString().trim() == ''
                      ? "Select your Domain"
                      : _selectedStateDomain,
                  menueItem: [
                    MenueItem(
                      text: "one",
                      value: "one",
                    ),
                    MenueItem(
                      text: "two",
                      value: "two",
                    ),
                    MenueItem(
                      text: "three",
                      value: "three",
                    )
                  ],
                  onSelected: (v) {
                    // print(v);
                    setState(() {
                      _selectedStateDomain = v;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonButton(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      isborder: true,
                      width: MediaQuery.of(context).size.width / 2.4,
                      buttonText: "Previous",
                    ),
                    const SizedBox(width: 10),
                    CommonButton(
                      onTap: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        if (_selectedStateEducation!.isEmpty) {
                          return flushBar(
                              text: "Education qualification is required");
                        } else if (_selectedStateYearPass!.isEmpty) {
                          return flushBar(text: "Year of passing is required");
                        } else if (_selectedStateDesignition!.isEmpty) {
                          return flushBar(text: "Designation is required");
                        }

                        UserViewModel viewModel =
                            Provider.of<UserViewModel>(context, listen: false);

                        UsersModel? userModel = viewModel.getUserFormData;

                        userModel.yearOfPassing = _selectedStateYearPass;
                        userModel.grade = _grade.value.text;
                        userModel.designation = _selectedStateDesignition;
                        userModel.domain = _selectedStateDomain;
                        userModel.education = _selectedStateEducation;
                        userModel.experience = _experience.value.text;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const YourAddress(),
                          ),
                        );
                      },
                      isborder: false,
                      width: MediaQuery.of(context).size.width / 2.4,
                      buttonText: "Next",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return CommonScaffold(
      padding: const EdgeInsets.only(left: 20, right: 20),
      appTitle: "Your Info",
      body: _bodyData(),
    );
  }
}
