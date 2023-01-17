import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollScontrol = ScrollController();
  TextEditingController searchController = TextEditingController();
  int categoryIsSelected = 0;

  @override
  Widget build(BuildContext context) {
    var screenDimentions = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: scrollScontrol,
          child: Stack(
            children: [
              Container(
                width: screenDimentions.width,
                height: screenDimentions.height,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(158, 220, 214, 214),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Best Fortune"),
                  const Text("Perfect prise"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenDimentions.width * (300 / 428),
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              size: 28,
                              color: Color.fromARGB(208, 0, 0, 0),
                            ),
                            hintText: "Search",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // autocorrect: true,
                          enableSuggestions: true,
                          controller: searchController,
                        ),
                      ),
                      SizedBox(
                        width: screenDimentions.width * (16 / 428),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: screenDimentions.width * (52 / 428),
                        height: 52,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16)),
                        child: Lottie.network(
                          "https://assets5.lottiefiles.com/packages/lf20_kafcqme6.json",
                          animate: false,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.purple[900],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'All',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: categoryIsSelected == 0
                                  ? Colors.white
                                  : Color.fromARGB(190, 99, 91, 150)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                height: screenDimentions.height,
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: screenDimentions.width,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.yellow[200],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
