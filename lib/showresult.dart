import 'package:flutter/material.dart';
import 'main.dart';

class ShowResult extends StatelessWidget {
  final String text;
  ShowResult({Key? key, required this.text}) : super(key: key);

  List pages = [
    const MyHomePage(title: 'BMI'),
  ];

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
