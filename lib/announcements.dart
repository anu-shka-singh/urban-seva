import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Announcements(),
    ),
  );
}


class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromARGB(238, 238, 238, 238),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Announcements",
                style: TextStyle(
                    fontSize: 35,
                    //fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.italic,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
