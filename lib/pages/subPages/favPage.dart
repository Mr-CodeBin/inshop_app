import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/model/SavedItems.dart';
import 'package:inshop_app/pages/subPages/itemPage.dart';
import 'package:inshop_app/pages/subPages/profilePage.dart';

import '../../utils/pageRout.dart';
import 'homepage.dart';

class FavItemScreen extends StatefulWidget {
  const FavItemScreen({super.key});

  @override
  State<FavItemScreen> createState() => _FavItemScreenState();
}

class _FavItemScreenState extends State<FavItemScreen> {
  List dataList = [];

  Future getData() async {
    var db = FirebaseFirestore.instance;
    db
        .collection(ProfileScreen.CurrentUserModel.phoneNo)
        .doc("Profile")
        .snapshots()
        .listen((event) {
      log(event.data().toString());
      var result = event.data() as Map<String, dynamic>;
      dataList = result["saved"]["data"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    UserSavedItems.GetUserItem();
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
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: UserSavedItems.userItems.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(CustomPageRoute(itemPageScreen(
                            itemdata: UserSavedItems.userItems[index],
                            fromNavIndex: 2,
                          )));
                        },
                        child: ItemCard(
                          productAvtar: UserSavedItems.userItems[index]
                                  ["product_photos"][0]
                              .toString(),
                          productCurrentPrice: UserSavedItems.userItems[index]
                                  ["offer"]["price"]
                              .toString(),
                          productDiscription: UserSavedItems.userItems[index]
                                      ["product_description"] ==
                                  null
                              ? " "
                              : UserSavedItems.userItems[index]
                                  ["product_description"],
                          productName: UserSavedItems.userItems[index]
                                  ["product_title"]
                              .toString(),
                          productProvider: UserSavedItems.userItems[index]
                                  ["offer"]["store_name"]
                              .toString(),
                          productRealPrice: UserSavedItems.userItems[index]
                                  ["offer"]["original_price"]
                              .toString(),
                        ),
                      ),
                    );
                  })),
            ),
          ),
          SizedBox(
            height: 64,
          )
        ],
      ),
    );
  }
}
