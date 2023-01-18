import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/Authentication/BlankPage.dart';
import 'package:inshop_app/Authentication/Opage.dart';
import 'package:lottie/lottie.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});
  static String verify = "";
  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneNumbeControllerr = TextEditingController();

  sendOtp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${phoneNumbeControllerr.text.trim()}",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        LoginPageScreen.verify = verificationId;
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return OTPpage();
          },
        ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Lottie.network(
                  "https://assets2.lottiefiles.com/packages/lf20_9evakyqx.json",
                  animate: true,
                ),
              ),
              // Text(
              //   "Superhero",
              //   style: GoogleFonts.saira(color: Colors.grey[700], fontSize: 24),
              // ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                child: TextField(
                  controller: phoneNumbeControllerr,
                  obscureText: false,
                  maxLength: 10,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "PhoneNumber",
                    hintStyle: GoogleFonts.saira(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              //   child: TextField(
              //     obscureText: true,
              //     decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.grey),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Colors.black),
              //       ),
              //       fillColor: Colors.grey.shade200,
              //       filled: true,
              //       hintText: "Password",
              //       hintStyle: GoogleFonts.saira(
              //         fontSize: 16,
              //         color: Colors.grey.shade800,
              //       ),
              //     ),
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       "Forgot Password?",
              //       style: GoogleFonts.saira(
              //         fontSize: 14,
              //         color: Colors.black87,
              //       ),
              //     ),
              //   ],
              // ),

              SizedBox(
                height: 20,
              ),

              //sign in button

              GestureDetector(
                onTap: () async {
                  await sendOtp();
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
                      "Continue",
                      style: GoogleFonts.saira(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              // Text(
              //   "Sign Up",
              //   style: GoogleFonts.saira(color: Colors.black),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
