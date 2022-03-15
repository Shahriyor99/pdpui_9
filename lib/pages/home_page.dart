import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui_9/pages/feed_page.dart';

class HomePage extends StatefulWidget {
  static final String id="HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentPage=0;

  var _pages=[
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Instagram",style: TextStyle(color: Colors.grey),),
        brightness: Brightness.light,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Feather.camera),
          color: Colors.grey,
          onPressed: (){

          },
        ),
        actions: [
          IconButton(
            icon: Icon(Feather.tv),
            color: Colors.grey,
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(FontAwesome.send_o),
            color: Colors.grey,
            onPressed: (){

            },
          ),
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (i){
          setState(() {
            _currentPage=i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            title: Text("Feed")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.search),
              title: Text("Search")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.plus_square),
              title: Text("UpLoad")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.heart),
              title: Text("Likes")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.user),
              title: Text("Account")
          ),
        ],
      ),
    );
  }
}
