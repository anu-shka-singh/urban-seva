import 'package:flutter/material.dart';

import 'user_dashboard.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr, // Set the text direction to LTR
        child: ComplaintConfirmation(),
      ),
    ),
  );
}

class ComplaintConfirmation extends StatefulWidget {
  const ComplaintConfirmation({super.key});

  @override
  State<ComplaintConfirmation> createState() => _ComplaintConfirmationState();
}

class _ComplaintConfirmationState extends State<ComplaintConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(118, 255, 255, 255),
        elevation: 0,
        // title: Text('Confirmation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Confirmation",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 13, 63, 134)),
              ),
              const SizedBox(
                  height: 50.0), // Add a SizedBox for spacing at the top
              Image.asset(
                'images/confetti.png', // Replace with your image path
                height: 300,
                width: 300,
              ),
              const SizedBox(height: 40.0),
              const Text(
                "Complaint Successfully Raised",
                style: TextStyle(
                    color: Color.fromARGB(255, 13, 63, 134), fontSize: 20),
              ),
              const SizedBox(height: 30.0),
              const Text(
                "We want you to sit back and relax. Resolving your complaint will be our top priority.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50.0),
              Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 13, 63, 134),
                    width: 2.0,
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(
                          user: const {
                            'name': 'Diya',
                            'address': 'Laxmi Nagar, Delhi'
                          },
                        ),
                      ),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Go to home page",
                          style: TextStyle(
                              color: Color.fromARGB(255, 13, 63, 134),
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
