import 'package:flutter/material.dart';
import 'package:shammo/shammo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PostCard(
          title: Text("Seth's Post"),
          action: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
          content: Text("Seth is awesome"),
          avatar: CircleAvatar(
            backgroundImage: NetworkImage("https://seth.com/dp"),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
            IconButton(
              icon: Icon(Icons.comment),
              onPressed: () {},
            )
          ]),
    );
  }
}
