import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inshop_app/FetchFunctions/saveState.dart';
import 'package:inshop_app/pages/intro_page.dart';
import 'package:inshop_app/pages/onboarding_page.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var lg = await LoginState().loadLogin();
  log(lg.toString());
  // bool checkState;
  runApp(MaterialApp(
    home: lg != null ? HomePage() : IntroPage(),
  ));
}
