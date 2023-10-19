import 'package:flutter/material.dart';
import '../widgets/menu.dart';

class AddIssue extends StatefulWidget {
  @override
  _AddIssueState createState() => _AddIssueState();
}

class _AddIssueState extends State<AddIssue> {
  String selectedCategory = 'Roads Transportation'; // Default category
  List<String> categories = ['Roads Transportation', 'Water Sewer', 'Electricity Power', 'Sanitation'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Menu on the left
          Container(
            width: 270, // Set the width of the menu
            child: Menu(scaffoldKey: GlobalKey<ScaffoldState>()), // Use the Menu widget
          ),
          // AddIssue content on the right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Add an Issue',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40), // Add spacing below the heading

                  // Category selection dropdown inside a ListTile
                  ListTile(
                    title: Text('Category of Issue'),
                    subtitle: DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategory = newValue!;
                        });
                      },
                      items: categories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),

                  // Rest of your AddIssue content
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter Issue Details'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter Reason'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter Location'),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter Pin Code'),
                  ),
                  SizedBox(height:40),
                  ElevatedButton(
                    onPressed: () {
                      // Handle issue submission here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color(0xFF21222D)), // Change the color to your desired color
                    ),
                    child: Text('Submit', style: TextStyle(fontSize: 18)),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
