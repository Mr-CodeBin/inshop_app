import 'package:flutter/material.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({super.key});

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text("CLick here"),
      ),
    );
  }
}
