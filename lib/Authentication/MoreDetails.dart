import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inshop_app/Authentication/Loginpage.dart';
import 'package:inshop_app/FetchFunctions/saveState.dart';
import 'package:inshop_app/FetchFunctions/userRepo.dart';
import 'package:inshop_app/model/UserModel.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';
import 'package:inshop_app/pages/subPages/profilePage.dart';
import 'package:inshop_app/utils/pageRout.dart';
import 'package:inshop_app/utils/snackBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoreDetailsScreen extends StatefulWidget {
  const MoreDetailsScreen({super.key});

  @override
  State<MoreDetailsScreen> createState() => _MoreDetailsScreenState();
}

class _MoreDetailsScreenState extends State<MoreDetailsScreen> {
  TextEditingController emailContorller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  saveUserDetails(BuildContext context) async {
    if (nameController.text.trim().isEmpty) {
      showSnackBar("Enter your name", context);
      return;
    }
    if (emailContorller.text.trim().isEmpty) {
      showSnackBar("Enter your email", context);
      return;
    }
    SharedPreferences sf = await SharedPreferences.getInstance();
    final lg = LoginState(
        phoneNo: ProfileScreen.CurrentUserModel.phoneNo,
        email: emailContorller.text.trim(),
        name: nameController.text.trim());
    lg.saveLogin();
    final fs = UserRepo();

    ProfileScreen.CurrentUserModel.email = emailContorller.text;
    ProfileScreen.CurrentUserModel.fullName = nameController.text;
    await fs.createUser(ProfileScreen.CurrentUserModel, context);
    var data =
        await fs.getUser(ProfileScreen.CurrentUserModel.phoneNo, context);
    log(data.toString());
    Navigator.of(context).pushReplacement(CustomPageRoute(HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    var screenDimentions = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: screenDimentions.height * (24 / 926),
          ),
          Text("Name:"),
          Container(
            padding: EdgeInsets.only(left: screenDimentions.width * (24 / 428)),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter full name",
                  border: InputBorder.none,
                ),
                controller: nameController,
              ),
            ),
          ),
          Text("Email:"),
          Container(
            padding: EdgeInsets.only(left: screenDimentions.width * (24 / 428)),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter you email",
                ),
                controller: emailContorller,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await saveUserDetails(context);
              },
              child: Text("Save")),
        ]),
      ),
    );
  }
}
