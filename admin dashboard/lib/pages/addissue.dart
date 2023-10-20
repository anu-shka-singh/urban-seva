import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
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

  DateTime? selectedDate; // To store the selected date
  DateTime? startTime; // To store the selected start time
  DateTime? endTime; // To store the selected end time

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Menu on the left
          SizedBox(
            width: 270, // Set the width of the menu
            child: Menu(
              scaffoldKey: GlobalKey<ScaffoldState>(),
            ),
          ),
          // AddIssue content on the right
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Issue an Alert !',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40), // Add spacing below the heading

                  // Category selection dropdown inside a ListTile
                  ListTile(
                    title: const Text('Alert Type'),
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

                  // Date selection using the DateTimeField
                  DateTimeField(
                    format: DateFormat("yyyy-MM-dd"),
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
                    ),
                    onChanged: (dt) {
                      setState(() {
                        selectedDate = dt;
                      });
                    },
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2101),
                      );
                    },
                  ),

                  // Start Time selection using the DateTimeField
                  //DateTime? selectedDate = DateTime.now();
                  //To store the selected date
                  //DateTime? startTime; // To store the selected start time

                  // Rest of your AddIssue content
                  const TextField(
                    decoration: InputDecoration(labelText: 'Enter Details'),
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
                    decoration: InputDecoration(
                        labelText: 'Enter Pin Code of the Area'),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Handle issue submission here, and you can use 'selectedDate', 'startTime', and 'endTime' for date and time values.
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
