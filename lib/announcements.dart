import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'api.dart';
// import 'package:http/http.dart' as http;

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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(45, 0),
                    bottomLeft: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45,
                      ),
                      Row(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Color.fromARGB(255, 13, 63, 134),
                                width: 2.0,
                              ),
                            ),
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Announcements",
                            style: TextStyle(
                                fontSize: 35,
                                //fontWeight: FontWeight.bold,
                                //fontStyle: FontStyle.italic,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              CustomCard(
                dept: "Delhi Jal Board",
                dateTime: "20th Oct at 12:20PM",
                msg:
                    "All the residents of the Dwarka Sector 12 area kindly note that water services have been disbanded till 9PM today. We regret the inconvinience caused due to this.",
              ),
              CustomCard(
                dept: "NDMC",
                dateTime: "20th Oct at 1:00PM",
                msg:
                    "All residents of Rohini Sector 10 are hereby advised to not travel towards the main road with their vehicles as it is being closed due to construction.",
              ),
              CustomCard(
                dept: "BSES",
                dateTime: "20th Oct at 1:37PM",
                msg:
                    "Residents of Janakpuri Block J are hereby informed that there will be a power outage in the area from 8PM to 12AM. Inconvenience caused is regretted.",
              ),
              CustomCard(
                dept: "SDMC",
                dateTime: "19th Oct at 5PM",
                msg:
                    "The road from Vegas Mall to Apollo Hospital has been closed due to metro construction work. Citizens are advised to take other routes for travelling.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String dept;
  final String dateTime;
  final String msg;

  CustomCard({
    required this.dept,
    required this.dateTime,
    required this.msg,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 6,
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    size: 55,
                    color: Color.fromARGB(255, 226, 41, 78),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dept,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dateTime,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              msg,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}
