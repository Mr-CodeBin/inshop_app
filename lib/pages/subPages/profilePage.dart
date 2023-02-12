import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inshop_app/model/UserModel.dart';
import 'package:inshop_app/pages/subPages/homepage.dart';
import 'package:inshop_app/utils/pageRout.dart';
import 'package:inshop_app/utils/snackBar.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static UserModel CurrentUserModel = UserModel(phoneNo: "");
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final storageRef = FirebaseStorage.instance;
  File? _image;
  String? imageURL;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    downloadImage();
  }

  Future uploadImage(File file) async {
    if (file == null) {
      log("_image is null !");
      return;
    }
    try {
      await storageRef
          .ref("${ProfileScreen.CurrentUserModel.phoneNo}/profile.jpg")
          .putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      log(e.toString());
    }
  }

  Future getData() async {
    imageURL = await downloadImage();
  }

  Future downloadImage() async {
    try {
      final imageUrl = await storageRef
          .ref("${ProfileScreen.CurrentUserModel.phoneNo}/profile.jpg")
          .getDownloadURL();
      return imageUrl;
    } catch (e) {
      log(e.toString());
      log("Image not found");
    }
  }

  Future pickImage(bool fromGallery) async {
    try {
      final image = await ImagePicker().pickImage(
          source: fromGallery ? ImageSource.gallery : ImageSource.camera);
      if (image == null) return;
      final temp = File(image.path);
      await uploadImage(temp);
      String ttmp = await downloadImage();
      setState(() {
        imageURL = ttmp;
      });
      log("image uploaded !");
    } on PlatformException catch (e) {
      showSnackBar(
          "Application doesn't have the permossion to take image!", context);
    }
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
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Column(
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
                      GestureDetector(
                        onTap: () {
                          // log("haa bhai");
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        (24 / 926),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                (4 / 428),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: Colors.blue,
                                          size: 36,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      // Spacer(),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                (36 / 428),
                                      ),
                                      Text(
                                        "Choose image from ?",
                                        style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue),
                                      ),
                                      // Spacer(),
                                    ],
                                  ),
                                  ListTile(
                                    onTap: () async {
                                      await pickImage(false);
                                      Navigator.of(context).pop();
                                    },
                                    leading: Icon(
                                      Icons.camera,
                                      size: 32,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      "Camera",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 2,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                (256 / 428),
                                        color: Colors.grey.shade300,
                                      ),
                                    ],
                                  ),
                                  ListTile(
                                    onTap: () async {
                                      await pickImage(true);
                                      Navigator.of(context).pop();
                                    },
                                    leading: Icon(
                                      Icons.image,
                                      size: 32,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      "Gallery",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(600),
                          child: Container(
                            height: 150,
                            width: 150,
                            child: Image.network(
                              imageURL == null
                                  ? "https://assets-prod.sumo.prod.webservices.mozgcp.net/static/default-FFA-avatar.2f8c2a0592bda1c5.png"
                                  : imageURL!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        ProfileScreen.CurrentUserModel.fullName.toString(),
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
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
