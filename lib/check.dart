import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPostUI(),
    );
  }
}

class MyPostUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Example'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/pfp.jpeg'), // Replace with your image path
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Post ID: 12345'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'This is the post content. It can be a long text that wraps to the next line if it is too long.',
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('images/user1.jpeg'), // Liked user 1 image
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('images/user2.jpeg'), // Liked user 2 image
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('images/user3.jpeg'), // Liked user 3 image
                    ),
                    SizedBox(width: 5),
                    Text('15 likes'),
                    SizedBox(width: 20),
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      color: Colors.blue, // Change color when upvoted
                      onPressed: () {
                        // Handle upvote action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.thumb_down),
                      color: Colors.red, // Change color when downvoted
                      onPressed: () {
                        // Handle downvote action
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                Text(
                  'Add your views here...',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
