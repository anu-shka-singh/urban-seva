import 'package:complaint_app/community_page.dart';
import 'package:complaint_app/complaint_confirm.dart';
import 'package:complaint_app/map_page.dart';
import 'package:complaint_app/select_problem.dart';
import 'package:flutter/material.dart';

import 'announcements.dart';
import 'chatbot_screen.dart';

class Dashboard extends StatefulWidget {
  Color clr = Colors.grey;
  Color clr2 = Colors.grey;
  Map<String, dynamic> user;
  Dashboard({super.key, required this.user});
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  List<bool> completedTasks = [true, false, false, false, false];
  final List<Color> taskColors = [
    const Color.fromARGB(255, 178, 221, 245),
    const Color.fromARGB(255, 198, 248, 194),
    const Color.fromARGB(255, 231, 184, 246),
    const Color.fromARGB(255, 251, 243, 176),
    const Color.fromARGB(255, 251, 189, 220),
  ];

  List<String> issue = [
    'Open Pothole',
    'Water Lodging',
    'Blocked Drains',
  ];

  List<String> sub = [
    'Issue 1',
    'Issue 2',
    'Issue 3',
  ];

  void _onTaskCompleted(int index) {
    setState(() {
      completedTasks[index] = !completedTasks[index];
    });
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Dashboard(
                  user: widget.user,
                )),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Communities()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatBotScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              final data = widget.user;
              print(data);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Announcements()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              //FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ComplaintConfirmation(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 20.0),
                    child: Image.asset(
                      'images/female.png',
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user['name'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.user['address'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              color: const Color.fromARGB(255, 202, 244, 240),
              margin: const EdgeInsets.all(14.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Issues in your locality",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MapScreen()),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "See various issues in your locality",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Issues",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: issue.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: taskColors[index],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 2,
                        margin: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding: const EdgeInsets.all(16.0),
                              title: Text(
                                issue[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text(
                                sub[index],
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 3, 31, 54),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              tileColor: taskColors[index],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: completedTasks
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final taskIndex = entry.key;
                                    final completed = entry.value;
                                    return Column(
                                      children: [
                                        Container(
                                          width: 16,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: completed
                                                ? Colors.green
                                                : Colors.red,
                                          ),
                                        ),
                                        if (taskIndex <
                                            completedTasks.length - 1)
                                          Container(
                                            width: 3,
                                            height: 29,
                                            color: completed
                                                ? Colors.green
                                                : Colors.grey,
                                          ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Issue Registered",
                                        style: TextStyle(fontSize: 14)),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Forwarded to authorities",
                                        style: TextStyle(fontSize: 14)),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Action Initiated",
                                        style: TextStyle(fontSize: 14)),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Action in Progress",
                                        style: TextStyle(fontSize: 14)),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Resolved",
                                        style: TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              color: Colors.black,
            ),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Colors.black,
            ),
            label: 'Chat Bot',
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 64.0),
        width: 80.0,
        height: 80.0,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectComplaintTypePage()),
            );
          },
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.add,
            size: 50.0,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
