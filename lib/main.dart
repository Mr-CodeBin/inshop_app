import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inshop_app/Authentication/MoreDetails.dart';
import 'package:inshop_app/FetchFunctions/saveState.dart';
import 'package:inshop_app/model/UserModel.dart';
import 'package:inshop_app/pages/intro_page.dart';
import 'package:inshop_app/pages/onboarding_page.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';
import 'package:inshop_app/pages/subPages/profilePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var lg = await LoginState.loadLogin();
  if (lg != null) {
    ProfileScreen.CurrentUserModel = UserModel(
        phoneNo: lg["phone"] != null ? lg["phone"] : "",
        fullName: lg["name"] != null ? lg["name"] : "",
        email: lg["email"] != null ? lg["email"] : "");
  }
  log(lg.toString());
  // bool checkState;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileScreen.CurrentUserModel.phoneNo.trim().isNotEmpty
        ? ProfileScreen.CurrentUserModel.fullName!.isNotEmpty
            ? HomePage()
            : const MoreDetailsScreen()
        : IntroPage(),
  ));
}
