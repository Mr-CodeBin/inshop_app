import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState {
  final String phoneNo;
  final String? name;
  final String? email;
  LoginState({required this.phoneNo, this.name, this.email}) {
    // TODO: implement saveLoginState
  }
  Future<bool> saveLogin() async {
    try {
      SharedPreferences sf = await SharedPreferences.getInstance();
      if (phoneNo != null) {
        sf.setString("phone", phoneNo);
        if (name != null) {
          sf.setString("name", name!);
        }
        if (email != null) {
          sf.setString("email", email!);
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static loadLogin() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    String? phone = sf.getString("phone");
    String? name = sf.getString("name");
    String? email = sf.getString("email");
    Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "email": email,
    };
    return data;
  }

  static removeState() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.remove("phone");
    sf.remove("email");
    sf.remove("name");
  }
}
