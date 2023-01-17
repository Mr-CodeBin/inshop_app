import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/Authentication/Loginpage.dart';
import 'package:inshop_app/button.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';
import 'package:inshop_app/pages/intro_page.dart';
import 'package:inshop_app/utils/pageRout.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Best prices",
            body: "Helps with finding cheap prices",
            image: buildImage("images/benefit1.png"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Notifications",
            body:
                "Notify if you are interested in a particular product and price goes down or available in a particular range.",
            image: buildImage(
              "images/benefit2.png",
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Handy-Dandy",
            // body: "3 Helps with finding cheap prices",
            bodyWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Very easy to narrow down based on your requirements",
                  style: GoogleFonts.saira(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () => goToHome(context),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                    child: Text(
                      "Finish",
                      style: GoogleFonts.saira(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            image: buildImage("images/benefit3.png"),
            decoration: getPageDecoration(),
          ),
        ],
        // done: ElevatedButton(
        //   style: buttonPrimary,
        //   onPressed: () => goToHome(context),
        //   child: Text(
        //     "Finish",
        //     style: GoogleFonts.saira(fontSize: 12),
        //   ),
        // ),
        showDoneButton: false,
        onDone: () => goToHome(context),
        showNextButton: true,
        next: Icon(Icons.arrow_forward_sharp),
        showSkipButton: true,
        skip:
            Text("Skip", style: GoogleFonts.saira(fontWeight: FontWeight.w600)),
      ),
    );
  }

  void goToHome(context) =>
      Navigator.of(context).pushReplacement(CustomPageRoute(LoginPageScreen()));

  Widget buildImage(String path) => Center(
          child: Container(
        margin: EdgeInsets.fromLTRB(10, 80, 10, 0),
        child: Image.asset(
          path,
          width: 350,
        ),
      ));

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: GoogleFonts.saira(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        titlePadding: EdgeInsets.all(0),
        bodyTextStyle: GoogleFonts.saira(fontSize: 20),
        bodyPadding: EdgeInsets.all(0).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(10),
        pageColor: Color.fromARGB(255, 255, 255, 255),
      );

  PageDecoration getPageDecoration2() => PageDecoration(
        titleTextStyle: GoogleFonts.saira(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        bodyAlignment: Alignment.bottomCenter,
        titlePadding: EdgeInsets.all(0),
        bodyTextStyle: GoogleFonts.saira(fontSize: 20),
        bodyPadding: EdgeInsets.all(0).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(10),
        pageColor: Color.fromARGB(255, 255, 255, 255),
      );
}
