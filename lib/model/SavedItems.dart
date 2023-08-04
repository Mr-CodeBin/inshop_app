import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inshop_app/pages/subPages/profilePage.dart';

class UserSavedItems {
  static List userItems = [];
  static Future GetUserItem() async {
    final db = FirebaseFirestore.instance;
    var data = await db
        .collection(ProfileScreen.CurrentUserModel.phoneNo)
        .doc("Profile")
        .snapshots()
        .listen((event) {
      var result = event.data() as Map<String, dynamic>;
      userItems = result["saved"]["data"];
      log(userItems.toString());
    });
  }

  static Future UploadUserItem() async {
    final db = FirebaseFirestore.instance;
    var data = await db
        .collection(ProfileScreen.CurrentUserModel.phoneNo)
        .doc("Profile")
        .set({
      "FullName": ProfileScreen.CurrentUserModel.fullName,
      "Email": ProfileScreen.CurrentUserModel.email,
      "Phone": ProfileScreen.CurrentUserModel.phoneNo,
      "saved": {"data": userItems}
    }).whenComplete(() {
      log("Upload success !");
    });
  }
}
