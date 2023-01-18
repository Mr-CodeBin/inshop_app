import 'dart:js_util';

class UserModel {
  String fullName;
  String? email;
  String phoneNo;
  UserModel({
    required this.fullName,
    this.email,
    required this.phoneNo,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
    };
  }
}
