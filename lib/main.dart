import 'package:flutter/material.dart';
import 'package:pdpui_9/pages/feed_page.dart';
import 'package:pdpui_9/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        FeedPage.id: (context) => FeedPage(),
      },
    );
  }
}