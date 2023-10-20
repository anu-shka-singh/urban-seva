import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPostUI(),
    );
  }
}

class MyPostUI extends StatelessWidget {
  const MyPostUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Example'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                          'images/pfp.jpeg'), // Replace with your image path
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
                const SizedBox(height: 10),
                const Text(
                  'This is the post content. It can be a long text that wraps to the next line if it is too long.',
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage('images/user1.jpeg'), // Liked user 1 image
                    ),
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage('images/user2.jpeg'), // Liked user 2 image
                    ),
                    const CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage('images/user3.jpeg'), // Liked user 3 image
                    ),
                    const SizedBox(width: 5),
                    const Text('15 likes'),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.thumb_up),
                      color: Colors.blue, // Change color when upvoted
                      onPressed: () {
                        // Handle upvote action
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.thumb_down),
                      color: Colors.red, // Change color when downvoted
                      onPressed: () {
                        // Handle downvote action
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                const Text(
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
