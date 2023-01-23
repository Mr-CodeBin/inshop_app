import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inshop_app/model/UserModel.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';
import 'package:inshop_app/utils/pageRout.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static UserModel CurrentUserModel = UserModel(phoneNo: "");
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              bottomRight: Radius.circular(20),
            ),
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
          "Profile",
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
            width: size.width,
            height: 200,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 0,
                  blurRadius: 10,
                ),
              ],
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                colors: [Colors.grey[200]!, Colors.grey[400]!],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(600),
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image.network(
                      "https://pbs.twimg.com/profile_images/1578073311883530244/AHHPcP98_400x400.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  "Hannah OF",
                  style: GoogleFonts.saira(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 70,
            padding: EdgeInsets.all(10),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.verified_user_outlined),
                Text(
                  ProfileScreen.CurrentUserModel.fullName!.toString(),
                  style: GoogleFonts.saira(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
                // SizedBox(
                //   width: 200,
                // ),
                Spacer(),
                Icon(
                  Icons.donut_small,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 70,
            padding: EdgeInsets.all(10),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.verified_user_outlined),
                Text(
                  ProfileScreen.CurrentUserModel.phoneNo,
                  style: GoogleFonts.saira(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // SizedBox(
                //   width: size.width * 0.4,
                // ),
                Spacer(),
                Icon(
                  Icons.donut_small,
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 70,
            padding: EdgeInsets.all(10),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.verified_user_outlined),
                Text(
                  ProfileScreen.CurrentUserModel.email!.toString(),
                  style: GoogleFonts.saira(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                // SizedBox(
                //   width: 200,
                // ),
                Spacer(),
                Icon(
                  Icons.donut_small,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
