import 'package:flutter/material.dart';

class TakeComplain extends StatefulWidget {
  final String probType;
  const TakeComplain({super.key, required this.probType});

  @override
  State<TakeComplain> createState() => _TakeComplainState();
}

class _TakeComplainState extends State<TakeComplain> {
  List<String> problems = [
    "Garbage on Street",
    "Pothole",
    "Frequent Power Cuts",
    "Others"
  ];
  String probDesc = "";
  int isUrgent = 0;

  int selectedRadio = -1;
  // @override
  // void initState() {
  //   super.initState();
  //   selectedRadio = -1; // -1 represents that no radio button is selected initially
  // }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Raise Complaint'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(1.0),
        child: Form(
          child: SingleChildScrollView(
            child: Container(
              color: Color.fromARGB(255, 236, 235, 235),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.probType,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              "CHANGE",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 22, 61, 202),
                                  fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Tell us your problem?",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "You can select one or more options",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                          Column(
                            children: problems.asMap().entries.map((entry) {
                              int index = entry.key;
                              String item = entry.value;
                              return ListTile(
                                title: Text(item),
                                leading: Radio(
                                  value: index,
                                  groupValue: selectedRadio,
                                  onChanged: (val) {
                                    setSelectedRadio(val!);
                                  },
                                  activeColor: Colors.blueGrey,
                                ),
                                // onTap: () {
                                //   setSelectedRadio(index);
                                // },
                              );
                            }).toList(),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Add Details",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Details you think are important for us to know",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText:
                                  'Eg. There are a lot of power cuts in my area',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              setState(() {
                                probDesc = value;
                              });
                            },
                            maxLines:
                                null, // Allow the text to wrap to the next line
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "Add Photos",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(height: 8),
                          const Text(
                            "Photos help us understand the gravity of your problems and allocate the best resources for resolution",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle the click to add photos from the camera
                              // You can open the camera or a photo picker here.
                              // Implement your logic to handle photo capture or selection.
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: double.infinity,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.photo_library,
                                  size: 32.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: isUrgent,
                                onChanged: (value) {
                                  setState(() {
                                    isUrgent = value!;
                                  });
                                },
                                activeColor: Colors.blueGrey,
                              ),
                              Text(
                                "Is the complaint urgent?",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Divider(
                            color: Color.fromARGB(255, 114, 113, 113),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey, // Button color
                              onPrimary: Colors.white, // Text color
                              fixedSize: Size(150, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Adjust the radius as needed
                              ),
                            ),
                            child: Text(
                              "SUBMIT",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
