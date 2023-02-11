import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/pages/onboarding_page.dart';
import 'subPages/homepage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var screenDimenstions = MediaQuery.of(context).size;

    // to check the height and width of the emulator device
    // ,\n${screenDimenstions.height}\n${screenDimenstions.width}

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Image.asset(
              'images/appstore.png',
              height: 200,
              width: 200,
            ),
          ),
          Spacer(),
          Text(
            "Get the best prices",
            textAlign: TextAlign.center,
            style: GoogleFonts.saira(
                color: Color.fromARGB(255, 123, 121, 121),
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),

          //fills gave btw widgets
          const SizedBox(
            height: 8,
          ),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const OnBoardingPage();
              },
            )),
            child: Container(
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(40)),
              margin: const EdgeInsets.fromLTRB(150, 0, 150, 0),
              padding: const EdgeInsets.all(12),
              child: Text(
                "Get Started",
                style: GoogleFonts.saira(
                    color: const Color.fromARGB(255, 255, 252, 252),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
