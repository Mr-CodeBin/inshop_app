import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState {
  final String? phoneNo;
  LoginState({this.phoneNo}) {
    // TODO: implement saveLoginState
  }
  Future<bool> saveLogin() async {
    try {
      SharedPreferences sf = await SharedPreferences.getInstance();
      if (phoneNo != null) {
        sf.setString("phoneNo", phoneNo!);
      } else {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  loadLogin() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString("phoneNo");
  }

  removeState() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    sf.remove("phoneNo");
  }
}
