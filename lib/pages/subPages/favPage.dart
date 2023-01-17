import "package:flutter/material.dart";

class FavItemScreen extends StatefulWidget {
  const FavItemScreen({super.key});

  @override
  State<FavItemScreen> createState() => _FavItemScreenState();
}

class _FavItemScreenState extends State<FavItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("Fav"),)),
    );
  }
}