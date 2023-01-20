// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class itemPage extends StatefulWidget {
  const itemPage({super.key});

  @override
  State<itemPage> createState() => _itemPageState();
}

class _itemPageState extends State<itemPage> {
  final imgList = [
    'https://m.media-amazon.com/images/I/61rrisp8qiL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/81HXViH8boL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/812cOE51JEL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/61eDXs9QFNL._SX679_.jpg',
    'https://m.media-amazon.com/images/I/7161nwSVX9L._SX679_.jpg',
    'https://m.media-amazon.com/images/I/61+h6PKyeUL._SX679_.jpg'
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
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
                                    color: Colors.grey,
                                    child: Image.network(
                                      imgListt,
                                      fit: BoxFit.cover,
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
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "iPhone 13 pro Max",
                                style: GoogleFonts.saira(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "By Amazon",
                                style: GoogleFonts.saira(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
                          '''15 cm (6.1-inch) Super Retina XDR display with ProMotion for a faster,\nmore responsive feel\nCinematic mode adds shallow depth of field and shifts focus automatically in your videos\nPro camera system with new 12MP Telephoto, Wide and Ultra Wide cameras;\nLiDAR Scanner; 6x optical zoom range; macro photography; Photographic Styles,\nProRes video, Smart HDR 4, Night mode, Apple ProRAW, 4K Dolby Vision HDR recording\n12MP TrueDepth front camera with Night mode, 4K Dolby Vision HDR recording\nA15 Bionic chip for lightning-fast performance\n''' *
                              10,
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
                      backgroundColor: Colors.black,
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 28),
                      child: Text(
                        "Add to cart",
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
                    onPressed: () {},
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
