import 'package:registerform/validators/app_constant.dart';

class Validators {
  // We can give only alphabet
  static String? validateName(String? val) {
    String _value = val ?? '';
    final RegExp _nameRegExp = RegExp(AppConstant.nameRegex);
    if (_value.isEmpty || _value.length < 3) {
      return "Mininum 3 character required";
    } else if (!_nameRegExp.hasMatch(_value)) {
      return "invalid Name";
    }
    return null;
  }

  /// ------------------ Check Value is Empty ------------------

  static String? isEmpty(String? text) {
    if (text!.isEmpty) {
      return "requiredText";
    }
    return null;
  }

  static String? validateAddress(String? val) {
    String _value = val ?? '';
    final RegExp _nameRegExp = RegExp(AppConstant.char3min);
    if (_value.isEmpty) {
      return "required Text";
    } else if (_value.length < 3) {
      return "minimum 3 characters";
    }
    return null;
  }

  static String? emailValidation(String? email) {
    if (email!.trim().isEmpty) {
      return "provide EmilId";
    } /*else if (email.trim().length < AppIntegers.minEmailLength) {
      return AppStrings.emailLength;
    } */
    else if (!RegExp(AppConstant.emailRegex).hasMatch(email.trim())) {
      return "invalid Email";
    }
    return null;
  }

  static String? mobileNoValidation(String? number) {
    if (number!.isNotEmpty) {
      if (number.length != 10) {
        return "10 digit number required";
      } else if (!RegExp(AppConstant.mobileRegex).hasMatch(number.trim())) {
        return "Invalid Mobile Number";
      }
    }
    return null;
  }

  static String? threeCharacterMin(String? number) {
    if (number!.isNotEmpty) {
      if (number.length > 3) {
        return "";
      } else if (!RegExp(AppConstant.char3min).hasMatch(number.trim())) {
        return "mimimum 3 characters";
      }
    }
    return null;
  }

  static String? twodigitNumber(String? number) {
    if (number!.isNotEmpty) {
      if (number.length < 2) {
        return "maximim 2 digits";
      } else if (!RegExp(AppConstant.mobileRegex).hasMatch(number.trim())) {
        return "characters only";
      }
    }
    return null;
  }

  static String? validatePassword(String? val) {
    String _value = val ?? '';
    final RegExp _passwordRegExp = RegExp(AppConstant.passwordRegex);
    if (_value.isEmpty) {
      return "requiredText";
    } else if (!_passwordRegExp.hasMatch(_value)) {
      return "password Must Contain (Only accept characters, number and special\n character,required 1 min number, special character) ";
    }
    return null;
  }

  static String? yearOfPassing(String? number) {
    if (number!.isNotEmpty) {
      if (number.length != 4) {
        return "Invalid year";
      }
    }
    return "Required";
  }

  static String? validateGrade(String? number) {
    if (number!.isEmpty) {
      return "Required";
    }
    return null;
  }
}
