import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshop_app/model/UserModel.dart';
import 'package:inshop_app/pages/subPages/profilePage.dart';
import 'package:inshop_app/utils/snackBar.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  createUser(UserModel user, context) async {
    await _db
        .collection(ProfileScreen.CurrentUserModel.phoneNo)
        .doc("Profile")
        .set(user.toJson())
        .whenComplete(() => {
              showSnackBar("Your account has been created ", context,
                  color: const Color.fromARGB(255, 101, 215, 105))
            })
        .catchError((error, stackTrace) {
      log(error.toString());
      showSnackBar("Some thing went wrong !", context);
    });
  }

  getUser(String phone, context) async {
    var response = await _db.collection(phone).get();
    return response;
  }
}
