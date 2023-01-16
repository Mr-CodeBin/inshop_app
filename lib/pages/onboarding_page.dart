import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/button.dart';
import 'package:inshop_app/pages/homepage.dart';
import 'package:inshop_app/pages/intro_page.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Benefit-1",
            body: "Helps with finding cheap prices",
            image: buildImage("images/inshopp_logo.png"),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Benefit-2",
            body: "2 Helps with finding cheap prices",
            image: buildImage(
              "images/inshopp_logo.png",
            ),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: "Benefit-3",
            body: "3 Helps with finding cheap prices",
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () => goToHome(context),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
                    child: Text(
                      "Finish",
                      style: GoogleFonts.saira(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            image: buildImage("images/inshopp_logo.png"),
            decoration: getPageDecoration2(),
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

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );

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
        imagePadding: EdgeInsets.all(100),
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
        imagePadding: EdgeInsets.all(40),
        pageColor: Color.fromARGB(255, 255, 255, 255),
      );
}
