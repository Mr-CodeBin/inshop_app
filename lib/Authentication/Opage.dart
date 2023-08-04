import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/Authentication/Loginpage.dart';
import 'package:inshop_app/Authentication/MoreDetails.dart';
import 'package:inshop_app/FetchFunctions/saveState.dart';
import 'package:inshop_app/FetchFunctions/userRepo.dart';
import 'package:inshop_app/model/UserModel.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';
import 'package:inshop_app/pages/subPages/profilePage.dart';
import 'package:inshop_app/utils/pageRout.dart';
import 'package:inshop_app/utils/snackBar.dart';
import 'package:lottie/lottie.dart';

class OTPpage extends StatefulWidget {
  const OTPpage({super.key});

  @override
  State<OTPpage> createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  TextEditingController otpController = TextEditingController();
  var db = FirebaseFirestore.instance;
  String code = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  verifyOTP(BuildContext context) async {
    try {
      log("${LoginPageScreen.verify}  ${otpController.text.trim()}");
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: LoginPageScreen.verify,
          smsCode: otpController.text.trim());
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      await db.collection(LoginPageScreen.phone).doc("Profile").get().then(
          (DocumentSnapshot doc) async {
        if (doc.data() != null) {
          final data = await doc.data() as Map<String, dynamic>;
          log(data.toString());

          ProfileScreen.CurrentUserModel.fullName = data["FullName"];
          ProfileScreen.CurrentUserModel.email = data["Email"];

          LoginState tem = LoginState(
              phoneNo: LoginPageScreen.phone,
              email: data["Email"],
              name: data["FullName"]);
          tem.saveLogin();
          Navigator.of(context).push(CustomPageRoute(
              ProfileScreen.CurrentUserModel.fullName != null
                  ? HomePage()
                  : const MoreDetailsScreen()));
        } else {
          LoginState loginstate = LoginState(
            phoneNo: LoginPageScreen.phone,
          );
          log(await loginstate.saveLogin() ? "Done" : "Exception");
          ProfileScreen.CurrentUserModel =
              UserModel(phoneNo: LoginPageScreen.phone);
          Navigator.of(context).push(CustomPageRoute(
              ProfileScreen.CurrentUserModel.fullName != null
                  ? HomePage()
                  : const MoreDetailsScreen()));
        }
        // ...
      }, onError: (e) {
        log("Error getting document: $e");
        showSnackBar("Something went wrong", context);
        Navigator.of(context).pop();
      });
    } catch (e) {
      log(e.toString());
      showSnackBar("Incorrect OTP", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                "images/otpPageAnimation.json",
                repeat: false,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 20, 0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Verification Code",
                  style: GoogleFonts.saira(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  textAlign: TextAlign.center,
                  "We have sent OTP on your Mobile Number ***********",
                  style: GoogleFonts.saira(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                width: mediaQuery.width * (224 / 428),
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
                child: Center(
                  child: TextField(
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(
                          RegExp(r"[a-z],[A-Z][.][,]"))
                    ],
                    decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintText: "Enter OTP"),
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    controller: otpController,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  verifyOTP(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 120),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: GoogleFonts.saira(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: (() {}),
                  child: Text(
                    "Resend OTP",
                    style: GoogleFonts.saira(
                      fontSize: 12,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
