import 'package:complaint_app/user_dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.black),
      title: 'Urban Seva',
      home: Dashboard(
        user: const {'name': 'Diya', 'address': 'Laxmi Nagar, Delhi'},
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
