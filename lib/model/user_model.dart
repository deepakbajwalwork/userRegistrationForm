// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

List<UsersModel> usersModelFromJson(String str) =>
    List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
  UsersModel({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
    this.gender = '',
    this.picture,
    this.landmark = '',
    this.address = '',
    this.city = '',
    this.pincode = '',
    this.education = '',
    this.yearOfPassing = '',
    this.grade = '',
    this.experience = '',
    this.designation = '',
    this.domain = '',
    this.state,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? phoneNumber;
  String? gender;
  String? address;
  String? landmark;
  String? city;
  String? pincode;
  String? state;

  Uint8List? picture;
  String? education;
  String? yearOfPassing;
  String? grade;
  String? experience;
  String? designation;
  String? domain;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        gender: json["gender"] == null ? null : json["gender"],
        picture: json["picture"] == null ? null : json["picture"],
        landmark: json["landmark"] == null ? null : json["landmark"],
        city: json["city"] == null ? null : json["city"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        address: json["address"] == null ? null : json["address"],
        yearOfPassing:
            json["yearOfPassing"] == null ? null : json["yearOfPassing"],
        grade: json["grade"] == null ? null : json["grade"],
        designation: json["designation"] == null ? null : json["designation"],
        domain: json["domain"] == null ? null : json["domain"],
        education: json["education"] == null ? null : json["education"],
        experience: json["experience"] == null ? null : json["experience"],
        state: json["state"] == null ? null : json["state"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName!,
        "last_name": lastName!,
        "email": email,
        "password": password,
        "phone_number": phoneNumber,
        "gender": gender,
        "picture": picture,
        "landmark": landmark,
        "pincode": pincode,
        "city": city,
        "landmark": landmark,
        "address": address,
        "grade": grade,
        "yearOfPassing": yearOfPassing,
        "designation": designation,
        "domain": domain,
        "education": education,
        "experience": experience,
        "state": state,
      };
}
