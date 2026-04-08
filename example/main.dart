import 'package:flutter/material.dart';
import 'package:shammo_plus/mediaquery.dart';
import 'package:shammo_plus/navigator.dart';
import 'package:shammo_plus/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: canvasColor(context),
      body: ListTile(
        title: Text(
          "Seth's Post",
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {
            push(context, Text("Hello"));
          },
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage("https://seth.com/dp"),
          backgroundColor: cardColor(context),
          minRadius: width(context) * 0.03,
        ),
      ),
    );
  }
}
