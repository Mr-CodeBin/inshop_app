import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/pages/subPages/cartPage.dart';
import 'package:inshop_app/pages/subPages/favPage.dart';
import 'package:inshop_app/pages/subPages/profilePage.dart';
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
  int navBarSelection = 0;
  List itemsOnHomePage = [
    ItemCard(),
  ];

  @override
  Widget build(BuildContext context) {
    var screenDimentions = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: screenDimentions.width,
              height: screenDimentions.height,
              decoration: const BoxDecoration(
                color: Color.fromARGB(158, 220, 214, 214),
              ),
            ),
            navBarSelection == 0
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenDimentions.height * (18 / 428),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Best Fortune",
                                style: TextStyle(
                                  color: Colors.purple[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ),
                              Text(
                                "Perfect prise",
                                style: TextStyle(
                                  color: Colors.purple[900],
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenDimentions.height * (8 / 428),
                        ),
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
                              child: Center(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
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
                        SizedBox(
                          height: screenDimentions.height * (4 / 428),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryIsSelected = 0;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: categoryIsSelected == 0
                                      ? Colors.purple[900]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
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
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryIsSelected = 1;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: categoryIsSelected == 1
                                      ? Colors.purple[900]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Phone',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: categoryIsSelected == 1
                                          ? Colors.white
                                          : Color.fromARGB(190, 99, 91, 150)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryIsSelected = 2;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: categoryIsSelected == 2
                                      ? Colors.purple[900]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Laptop',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: categoryIsSelected == 2
                                          ? Colors.white
                                          : Color.fromARGB(190, 99, 91, 150)),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  categoryIsSelected = 3;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: categoryIsSelected == 3
                                      ? Colors.purple[900]
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Camera',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: categoryIsSelected == 3
                                          ? Colors.white
                                          : Color.fromARGB(190, 99, 91, 150)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenDimentions.height * (4 / 428),
                        ),
                        SizedBox(
                          width: screenDimentions.width,
                          height: screenDimentions.height * (760 / 926),
                          child: ListView.builder(
                            itemCount: 12,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 28),
                                child: itemsOnHomePage[0],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : navBarSelection == 1
                    ? CartPageScreen()
                    : navBarSelection == 2
                        ? FavItemScreen()
                        : ProfileScreen(),
            Column(
              children: [
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenDimentions.width * (12 / 428)),
                  child: AnimatedContainer(
                    height: 52,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    duration: const Duration(milliseconds: 800),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navBarSelection = 0;
                              });
                            },
                            child: Icon(
                              Icons.home,
                              color: navBarSelection == 0
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navBarSelection = 1;
                              });
                            },
                            child: Icon(
                              Icons.card_travel,
                              color: navBarSelection == 1
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navBarSelection = 2;
                              });
                            },
                            child: Icon(
                              Icons.favorite,
                              color: navBarSelection == 2
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                navBarSelection = 3;
                              });
                            },
                            child: Icon(
                              Icons.person,
                              color: navBarSelection == 3
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: screenDimentions.height * (8 / 926),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    var screenDimentions = MediaQuery.of(context).size;
    return Container(
      width: screenDimentions.width,
      height: 184,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(59, 158, 158, 158),
            blurRadius: 0.5,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36),
                    child: Image.asset("images/benefit2.png"),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: screenDimentions.height * (8 / 926),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenDimentions.width * (8 / 428)),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Lottie.network(
                              "https://assets4.lottiefiles.com/private_files/lf30_pbo6eiyy.json",
                              width: 32,
                              animate: false),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: screenDimentions.width * (8 / 428),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                "Product Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenDimentions.width * (18 / 428),
                ),
              ),
              Text(
                "by Seto",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenDimentions.width * (12 / 428),
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              Text(
                "short discription of product",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: screenDimentions.width * (12 / 428),
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "₹800.43",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenDimentions.width * (18 / 428),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: screenDimentions.width * (16 / 428),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Buy",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenDimentions.width * (18 / 428),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
