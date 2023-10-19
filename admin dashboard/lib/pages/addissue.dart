import 'package:flutter/material.dart';
import '../widgets/menu.dart';

class AddIssue extends StatefulWidget {
  const AddIssue({super.key});

  @override
  _AddIssueState createState() => _AddIssueState();
}

class _AddIssueState extends State<AddIssue> {
  String selectedCategory = 'Roads Transportation'; // Default category
  List<String> categories = [
    'Roads Transportation',
    'Water Sewer',
    'Electricity Power',
    'Sanitation'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Menu on the left
          SizedBox(
            width: 270, // Set the width of the menu
            child: Menu(
                scaffoldKey: GlobalKey<ScaffoldState>()), // Use the Menu widget
          ),
          // AddIssue content on the right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Add an Issue',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40), // Add spacing below the heading

                  // Category selection dropdown inside a ListTile
                  ListTile(
                    title: const Text('Category of Issue'),
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
                  const TextField(
                    decoration:
                        InputDecoration(labelText: 'Enter Issue Details'),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Enter Reason'),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Enter Location'),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Enter Pin Code'),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Handle issue submission here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(
                          0xFF21222D)), // Change the color to your desired color
                    ),
                    child: const Text('Submit', style: TextStyle(fontSize: 18)),
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
