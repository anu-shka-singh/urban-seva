import 'package:flutter/material.dart';

import 'chatbot_screen.dart';
import 'user_dashboard.dart';

void main() {
  runApp(
    MaterialApp(
      home: Communities(),
    ),
  );
}

class Communities extends StatefulWidget {
  @override
  State<Communities> createState() => CommunitiesState();
}

class CommunitiesState extends State<Communities> {
  int selectedLike = 0;
  int selectedDislike = 0;
  String comment = "";

  void onUpvote() {
    setState(() {
      selectedLike = 1;
      selectedDislike = 0; // Reset the dislike state
    });
  }

  void onDownvote() {
    setState(() {
      selectedDislike = 1; // Reset the like state
      selectedLike = 0;
    });
  }

  void onComment(String value) {
    setState(() {
      comment = value;
    });
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Dashboard(
                  user: const {'name': 'Diya', 'address': 'Laxmi Nagar, Delhi'},
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
                        height: 40,
                      ),
                      Text(
                        "Community",
                        style: TextStyle(
                            fontSize: 40,
                            //fontWeight: FontWeight.bold,
                            //fontStyle: FontStyle.italic,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 8, top: 6, bottom: 6),
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            //controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.search,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MyPostUI(
                name: "Mary Jane",
                postID: "#127",
                content:
                    "This is the post content. It can be a long text that wraps to the next line if it is too long.",
                likes: 20,
                selectedDislike: selectedLike,
                selectedLike: selectedDislike,
                onUpvote: onUpvote,
                onDownvote: onDownvote,
                comment: comment,
                onComment: onComment,
              ),
              MyPostUI(
                name: "Mary Jane",
                postID: "#127",
                content:
                    "This is the post content. It can be a long text that wraps to the next line if it is too long.",
                likes: 20,
                selectedDislike: selectedLike,
                selectedLike: selectedDislike,
                onUpvote: onUpvote,
                onDownvote: onDownvote,
                comment: comment,
                onComment: onComment,
              ),
            ],
          ),
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
    );
  }
}

class MyPostUI extends StatelessWidget {
  final String name;
  final String postID;
  final String content;
  final int likes;
  final int selectedLike;
  final int selectedDislike;
  final Function() onUpvote;
  final Function() onDownvote;
  final String comment;
  final Function(String) onComment;
  //TextEditingController _textEditingController = TextEditingController();

  MyPostUI({
    required this.name,
    required this.postID,
    required this.content,
    required this.likes,
    required this.selectedLike,
    required this.selectedDislike,
    required this.onUpvote,
    required this.onDownvote,
    required this.comment,
    required this.onComment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'images/pfp.jpeg'), // Replace with your image path
                ),
                SizedBox(width: 15),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        "12th Oct at 9:40PM",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  postID,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              content,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      AssetImage('images/user1.jpeg'), // Liked user 1 image
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      AssetImage('images/user2.jpeg'), // Liked user 2 image
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundImage:
                      AssetImage('images/user3.jpeg'), // Liked user 3 image
                ),
                SizedBox(width: 5),
                Text(
                  "+${likes - 3} likes",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(
                    Icons.thumb_up_outlined,
                    color: selectedLike == 0
                        ? Colors.black
                        : Color.fromARGB(255, 62, 136, 197),
                  ),
                  onPressed: onUpvote,
                ),
                IconButton(
                  icon: Icon(
                    Icons.thumb_down_outlined,
                    color: selectedDislike == 0
                        ? Colors.black
                        : Color.fromARGB(255, 62, 136, 197),
                  ),
                  onPressed: onDownvote,
                ),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 114, 113, 113),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    //controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: 'Add your views here...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(10),
                          gapPadding: 2),
                    ),
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      onComment(value);
                    },
                    maxLines: null, // Allow the text to wrap to the next line
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send_rounded),
                  onPressed: () {
                    //_textEditingController.clear();
                    onComment("");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
