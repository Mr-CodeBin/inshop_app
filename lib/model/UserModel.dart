import 'dart:convert';

class UserModel {
  String? fullName;
  String? email;
  String phoneNo;
  List? saved = [];
  UserModel({
    this.fullName,
    this.email,
    required this.phoneNo,
    this.saved,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "saved": {"data": saved}
    };
  }
}
