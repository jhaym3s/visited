import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = "detailed route name";
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
