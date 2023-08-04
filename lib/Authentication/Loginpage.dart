import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/Authentication/BlankPage.dart';
import 'package:inshop_app/Authentication/Opage.dart';
import 'package:inshop_app/utils/pageRout.dart';
import 'package:inshop_app/utils/snackBar.dart';
import 'package:lottie/lottie.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});
  static String verify = "";
  static String phone = "";
  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phoneNumbeControllerr = TextEditingController();
  bool isLoading = false;
  sendOtp(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    if (phoneNumbeControllerr.text.trim().isEmpty) {
      showSnackBar("Chutiya ho kya?", context);
      return;
    }
    LoginPageScreen.phone = "+91${phoneNumbeControllerr.text.trim()}";
    await FirebaseAuth.instance.verifyPhoneNumber(
      // phoneNumber: "+91${phoneNumbeControllerr.text.trim()}",
      phoneNumber: "+911111111111",
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          isLoading = false;
        });
        LoginPageScreen.verify = verificationId;
        Navigator.of(context).push(CustomPageRoute(OTPpage()));
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
                child: Lottie.asset(
                  "images/loginPageAnimation.json",
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
                  keyboardType: TextInputType.number,
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
                  await sendOtp(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 120),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: isLoading
                        ? CircularProgressIndicator()
                        : Text(
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
