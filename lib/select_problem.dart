import 'package:flutter/material.dart';

import 'complaint_record.dart';

class SelectComplaintTypePage extends StatefulWidget {
  const SelectComplaintTypePage({super.key});

  @override
  _SelectComplaintTypePageState createState() =>
      _SelectComplaintTypePageState();
}

class _SelectComplaintTypePageState extends State<SelectComplaintTypePage> {
  String selectedUserType = "";

  void onUserTypeSelected(String userType) async {
    setState(() {
      selectedUserType = userType;
    });
  }

  void navigateToSelectedPage() {
    if (selectedUserType.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TakeComplain(
            probType: selectedUserType,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF21222D),
          title: const Text(""),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16), // Add space at the top
                  child: Text(
                    "Choose the category under which your complaint falls.",
                    style: TextStyle(fontSize: 27),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: UserTypeGrid(
                    onUserTypeSelected: onUserTypeSelected,
                    selectedUserType: selectedUserType,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFF21222D),
                  ),
                  child: ElevatedButton(
                    onPressed: navigateToSelectedPage,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class UserTypeGrid extends StatelessWidget {
  final Function(String) onUserTypeSelected;
  final String selectedUserType;

  const UserTypeGrid(
      {super.key,
      required this.onUserTypeSelected,
      required this.selectedUserType});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 5,
      children: [
        ProbTypeTile(
          key: const ValueKey<String>("Electrical"),
          icon: Icons.electrical_services_outlined,
          text: "Electrical",
          onUserTypeSelected: onUserTypeSelected,
          isSelected: selectedUserType == "Electrical",
          textColor: Colors.pink,
          colorTile: const Color.fromARGB(209, 255, 230, 238),
        ),
        ProbTypeTile(
          key: const ValueKey<String>("Sanitation"),
          icon: Icons.sanitizer_sharp,
          text: "Sanitation",
          onUserTypeSelected: onUserTypeSelected,
          isSelected: selectedUserType == "Sanitation",
          textColor: const Color.fromARGB(255, 33, 82, 165),
          colorTile: const Color.fromARGB(210, 227, 243, 255),
        ),
        ProbTypeTile(
          key: const ValueKey<String>("Security"),
          icon: Icons.security,
          text: "Security",
          onUserTypeSelected: onUserTypeSelected,
          isSelected: selectedUserType == "Security",
          textColor: const Color.fromARGB(255, 20, 114, 56),
          colorTile: const Color.fromARGB(214, 224, 251, 233),
        ),
        ProbTypeTile(
          key: const ValueKey<String>("Dead Animals"),
          icon: Icons.pets,
          text: "Dead Animals",
          onUserTypeSelected: onUserTypeSelected,
          isSelected: selectedUserType == "Dead Animals",
          textColor: Colors.orange,
          colorTile: const Color.fromARGB(216, 254, 240, 218),
        ),
        ProbTypeTile(
          key: const ValueKey<String>("Potholes"),
          icon: Icons.add_road,
          text: "Potholes",
          onUserTypeSelected: onUserTypeSelected,
          isSelected: selectedUserType == "Potholes",
          textColor: const Color.fromARGB(255, 143, 119, 25),
          colorTile: const Color.fromARGB(221, 253, 246, 216),
        ),
        ProbTypeTile(
          key: const ValueKey<String>("Parking"),
          icon: Icons.gps_fixed,
          text: "Parking",
          onUserTypeSelected: onUserTypeSelected,
          isSelected: selectedUserType == "Parking",
          textColor: const Color.fromARGB(255, 13, 108, 107),
          colorTile: const Color.fromARGB(219, 219, 254, 254),
        ),
        ProbTypeTile(
          key: const ValueKey<String>("Others"),
          icon: Icons.more_horiz,
          text: "Others",
          onUserTypeSelected: onUserTypeSelected,
          isSelected: selectedUserType == "Others",
          textColor: Colors.deepPurple,
          colorTile: const Color.fromARGB(217, 234, 223, 250),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ProbTypeTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function(String) onUserTypeSelected;
  final bool isSelected;
  Color colorTile;
  Color textColor;

  ProbTypeTile({
    required Key key,
    required this.icon,
    required this.text,
    required this.onUserTypeSelected,
    required this.isSelected,
    required this.colorTile,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: colorTile,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: isSelected
            ? BorderSide(color: textColor, width: 2.0)
            : const BorderSide(color: Colors.white, width: 1.0),
      ),
      child: InkWell(
        onTap: () {
          onUserTypeSelected(text);
        },
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 36,
                  color: textColor,
                ),
                const SizedBox(height: 5),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
