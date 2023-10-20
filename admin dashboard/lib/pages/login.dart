import 'package:flutter/material.dart';
import 'package:flutter_dashboard/dashboard.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 500, // Adjust the width as needed
            padding: EdgeInsets.symmetric(horizontal: 40.0), // Add horizontal padding
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Replace the "Login" heading with an image
                Image.asset(
                  'urban.png', // Replace with the path to your image
                  width: 350, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                ),
                SizedBox(height: 50,),
                // Username field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                SizedBox(height: 20),

                // Password field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),

                // Login button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Home Page when the login button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFF21222D)), // Change the button color
                    minimumSize: MaterialStateProperty.all(Size(150, 50)), // Change the button size
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, color: Colors.white), // Change the text style
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
