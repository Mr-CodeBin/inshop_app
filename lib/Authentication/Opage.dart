import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/Authentication/Loginpage.dart';
import 'package:inshop_app/FetchFunctions/saveState.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';
import 'package:inshop_app/utils/pageRout.dart';
import 'package:inshop_app/utils/snackBar.dart';
import 'package:lottie/lottie.dart';

class OTPpage extends StatefulWidget {
  const OTPpage({super.key});

  @override
  State<OTPpage> createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  String code = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  verifyOTP(BuildContext context) async {
    try {
      log("${LoginPageScreen.verify}  ${code}");
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: LoginPageScreen.verify, smsCode: code);
      // Sign the user in (or link) with the credential
      await auth.signInWithCredential(credential);
      LoginState loginstate = LoginState(phoneNo: LoginPageScreen.phone);
      log( await loginstate.saveLogin()? "Done":"Exception");

      Navigator.of(context).push(CustomPageRoute(const HomePage()));
    } catch (e) {
      log(e.toString());
      showSnackBar("Incorrect OTP", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.network(
                "https://assets6.lottiefiles.com/packages/lf20_fkdiqhnw.json",
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
              OtpTextField(
                numberOfFields: 6,
                borderColor: Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                
                onCodeChanged: (String value) {
                  code += value;
                },
                clearText: true,

                //runs when every textfield is filled
                onSubmit: (String verificationCode) {}, // end onSubmit
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
