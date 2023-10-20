import 'package:flutter/material.dart';
import 'dart:async';

import '../login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void main() {
  runApp(MaterialApp(home: MyHomePage(title: "Urban Seva")));
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                //fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
