import 'package:flutter/material.dart';

import 'select_problem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SelectUserTypePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
