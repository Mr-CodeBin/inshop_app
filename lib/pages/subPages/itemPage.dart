// ignore_for_file: camel_case_types

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:inshop_app/model/SavedItems.dart';
import 'package:inshop_app/pages/subPages/favPage.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';
import 'package:inshop_app/utils/pageRout.dart';
import 'package:inshop_app/utils/snackBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class itemPageScreen extends StatefulWidget {
  Map<String, dynamic> itemdata;
  int? fromNavIndex;
  itemPageScreen({super.key, required this.itemdata, this.fromNavIndex});

  @override
  State<itemPageScreen> createState() => _itemPageScreenState();
}

class _itemPageScreenState extends State<itemPageScreen> {
  late bool isSaved = false;
  final imgList = [
    'https://m.media-amazon.com/images/I/61rrisp8qiL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/81HXViH8boL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/812cOE51JEL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/61eDXs9QFNL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/7161nwSVX9L._SX679_.jpg',
    'https://m.media-amazon.com/images/I/61+h6PKyeUL._SX679_.jpg'
  ];
  final db = FirebaseFirestore.instance;
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List<Widget> SpecificaionList = [];
  parseData() async {
    imgList.clear();
    for (var item in widget.itemdata['product_photos']) {
      imgList.add(item);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    log(widget.itemdata.toString());

    UserSavedItems.userItems.contains(widget.itemdata)
        ? isSaved = true
        : isSaved = false;

    if (widget.itemdata["product_attributes"] != null) {
      for (int i = 0;
          i < widget.itemdata["product_attributes"].keys.length;
          i++) {
        log("${widget.itemdata["product_attributes"].keys.toList()[i]}   ${widget.itemdata["product_attributes"].values.toList()[i]}");
        SpecificaionList.add(Row(
          children: [
            Text(
              "${widget.itemdata["product_attributes"].keys.toList()[i]}   ${widget.itemdata["product_attributes"].values.toList()[i]}",
              style: GoogleFonts.saira(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ));
      }
    }

    parseData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: AnimatedContainer(
                    // height: size.height * 0.38,
                    // width: size.width * 0.9,
                    margin: EdgeInsets.symmetric(vertical: 0),
                    duration: Duration(seconds: 2),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Stack(
                      children: [
                        // Image.network(
                        //   "https://images.unsplash.com/photo-1508138221679-760a23a2285b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8cmFuZG9tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1296&q=60",
                        //   // width: 200,
                        // ),
                        InkWell(
                          onTap: () {
                            // print(currentIndex);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CarouselSlider.builder(
                                itemCount: imgList.length,
                                itemBuilder: (context, index, realIndex) {
                                  final imgListt = imgList[index];
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(12, 10, 12, 0),
                                    color: Colors.transparent,
                                    child: Image.network(
                                      imgListt,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  );
                                },
                                options: CarouselOptions(
                                  height: 500,
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  // reverse: true,
                                  // pageSnapping: false,
                                  // enableInfiniteScroll: false,
                                  autoPlayCurve: Curves.linear,
                                  autoPlayInterval: Duration(seconds: 3),
                                  aspectRatio: 2,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  // enlargeStrategy: CenterPageEnlargeStrategy.height,
                                  onPageChanged: ((index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  }),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AnimatedSmoothIndicator(
                                activeIndex: currentIndex,
                                count: imgList.length,
                                effect: WormEffect(
                                  spacing: 5.0,
                                  radius: 2.0,
                                  dotWidth: 10.0,
                                  dotHeight: 8.0,
                                  paintStyle: PaintingStyle.stroke,
                                  strokeWidth: 1.0,
                                  dotColor: Colors.grey.shade300,
                                  activeDotColor: Colors.indigo,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // grey container
                Container(
                  // margin: EdgeInsets.only(top: size.height * 0.4),
                  padding: EdgeInsets.only(
                    top: size.height * 0.032,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    // bottom: size.height * 0.005,
                  ),
                  // height: size.height * 0.6,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${widget.itemdata["product_title"].toString()} (${widget.itemdata["offer"]["product_condition"].toString()})',
                        style: GoogleFonts.saira(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'By ${widget.itemdata["offer"]["store_name"].toString()}',
                            style: GoogleFonts.saira(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      widget.itemdata["offer"]["store_rating"] != null
                          ? Row(
                              children: [
                                Text(
                                  'Rating ${widget.itemdata["offer"]["store_rating"].toString()}',
                                  style: GoogleFonts.saira(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      widget.itemdata["typical_price_range"] != null
                          ? Row(
                              children: [
                                Text(
                                  'Price Range ${widget.itemdata["typical_price_range"][0].toString()} - ${widget.itemdata["typical_price_range"][1].toString()}',
                                  style: GoogleFonts.saira(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                      Row(
                        children: [
                          Text(
                            'Current price ${widget.itemdata["offer"]["price"].toString()}',
                            style: GoogleFonts.saira(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                        // indent: 6,
                        // endIndent: 20,
                      ),
                      widget.itemdata["product_attributes"] != null
                          ? Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Specifications :",
                                style: GoogleFonts.saira(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Container(),
                      //main description container
                      widget.itemdata["product_attributes"] != null
                          ? ListView(
                              shrinkWrap: true,
                              children: SpecificaionList,
                              physics: NeverScrollableScrollPhysics(),
                            )
                          : Container(),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                        // indent: 6,
                        // endIndent: 20,
                      ),
                      // my description container
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description:",
                          style: GoogleFonts.saira(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      //main description container
                      Container(
                        alignment: Alignment.topLeft,
                        child: AutoSizeText(
                          widget.itemdata["product_description"].toString(),
                          minFontSize: 12,
                          maxLines: 100,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.saira(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.black,
                        // indent: 6,
                        // endIndent: 20,
                      ),
                      SizedBox(
                        height: 56,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          //bottom navigation buttons
          Align(
            alignment: Alignment(0, 0.964),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * (24 / 428)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // minimumSize: Size(70, 20),
                      backgroundColor: isSaved ? Colors.red : Colors.black,
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (isSaved) {
                        await UserSavedItems.userItems.remove(widget.itemdata);
                        await UserSavedItems.UploadUserItem();
                        setState(() {
                          isSaved = false;
                        });
                        if (widget.fromNavIndex == 2) {
                          Navigator.of(context)
                              .pushReplacement(CustomPageRoute(HomePage(
                            navSelection: 2,
                          )));
                        }
                        return;
                      }

                      UserSavedItems.userItems.add(widget.itemdata);
                      await UserSavedItems.UploadUserItem();
                      setState(() {
                        isSaved = true;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 8, horizontal: isSaved ? 12 : 28),
                      child: Text(
                        isSaved ? "Remove from Saved" : "Save for later",
                        style: GoogleFonts.saira(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // minimumSize: Size(70, 20),
                      backgroundColor: Colors.black,
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      var url = Uri.parse(widget.itemdata["product_page_url"]);
                      await launchUrl(url);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 38),
                      child: Text(
                        "Buy Now",
                        style: GoogleFonts.saira(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
