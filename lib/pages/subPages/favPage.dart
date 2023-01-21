import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import '../../utils/pageRout.dart';
import 'homepage.dart';

class FavItemScreen extends StatefulWidget {
  const FavItemScreen({super.key});

  @override
  State<FavItemScreen> createState() => _FavItemScreenState();
}

class _FavItemScreenState extends State<FavItemScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List _itemss = [
      'item 1',
      'item 2',
      'item 3',
      'item 4',
      'item 5',
      'item 6',
      'item 7',
      'item 8',
      'item 9',
      'item 10',
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [Colors.red, Colors.pink],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).push(CustomPageRoute(HomePage())),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Favorites",
          style: GoogleFonts.saira(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Your Products are saved here"
              "\nDont Worry!",
              style: GoogleFonts.saira(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Container(
              // height: size.height * 0.1,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: ListView.builder(
                  itemCount: _itemss.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      width: size.width,
                      height: size.height * 0.15,
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 2),
                              // height: 100,
                              // width: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                _itemss[index] + "\nImage",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              margin: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 2),
                              // height: 100,
                              // width: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                _itemss[index],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
            ),
          ),
          Container(
            height: size.height * 0.126,
            width: size.width,
            margin: EdgeInsets.symmetric(vertical: 1, horizontal: 16),
            padding: EdgeInsets.only(
              top: 10,
              left: 16,
              right: 16,
              bottom: 1,
            ),

            // alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[100],
            ),
            child: Column(
              children: [
                Text(
                  "Share it with your friends",
                  style: GoogleFonts.saira(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Container(
                    //   width: size.width * 0.15,
                    //   height: size.height * 0.07,
                    //   padding: EdgeInsets.all(0),
                    //   margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(4),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.shade400,
                    //         spreadRadius: 0,
                    //         blurRadius: 4,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Icon(Icons.verified_user_sharp),
                    // ),
                    // Container(
                    //   width: size.width * 0.15,
                    //   height: size.height * 0.07,
                    //   padding: EdgeInsets.all(0),
                    //   margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(4),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.shade400,
                    //         spreadRadius: 0,
                    //         blurRadius: 4,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Icon(Icons.verified_user_sharp),
                    // ),
                    // Container(
                    //   width: size.width * 0.15,
                    //   height: size.height * 0.07,
                    //   padding: EdgeInsets.all(0),
                    //   margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                    //   alignment: Alignment.center,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(4),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.shade400,
                    //         spreadRadius: 0,
                    //         blurRadius: 4,
                    //       ),
                    //     ],
                    //   ),
                    //   child: Icon(Icons.verified_user_sharp),
                    // ),

                    //Elevated Buttons for sharing Link
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // minimumSize: Size(70, 20),
                        backgroundColor: Colors.black,
                        elevation: 2,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        // child: Image.asset(
                        //   "images/icons/GoogleIcon.png",
                        //   height: 20,
                        //   width: 20,
                        // ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // minimumSize: Size(70, 20),
                        backgroundColor: Colors.black,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: Image.asset(
                        //   "images/icons/facebookIcon.png",
                        //   height: 5,
                        //   width: 5,
                        // ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        // minimumSize: Size(70, 20),
                        backgroundColor: Colors.black,
                        elevation: 2,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        // child: Image.asset(
                        //   "images/icons/whatsappIcon.png",
                        //   height: 20,
                        //   width: 20,
                        // ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey,
            indent: 60,
            endIndent: 60,
          ),
          SizedBox(
            height: 56,
          )
        ],
      ),
    );
  }
}
