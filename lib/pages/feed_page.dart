import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui_9/model/post_model.dart';
import 'package:pdpui_9/model/story_model.dart';

class FeedPage extends StatefulWidget {
  static final String id="FeedPage";

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];

  List<Post> _posts = [
    Post(
        "Brianne",
        "assets/images/user_1.jpeg",
        "assets/images/feed_1.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
    Post(
        "Henri",
        "assets/images/user_2.jpeg",
        "assets/images/feed_2.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
    Post(
        "Mariano",
        "assets/images/user_3.jpeg",
        "assets/images/feed_3.jpeg",
        "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              Divider(),
              
              //#stories and watch all
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stories", style: TextStyle(color: Colors.grey[700],fontSize: 14),),
                    Text("Watch All", style: TextStyle(color: Colors.grey[700],fontSize: 14),),
                  ],
                ),
              ),
              
              //#stories list
              Container(
                width: MediaQuery.of(context).size.width,
                height: 110,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: _stories.map((story){
                    return _itemStory(story);
                  }).toList(),
                ),
              ),

              //#post list
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i){
                    return _itemOfPost(_posts[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemStory(Story story){
    return Column(
      children: [

        //#photo
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        SizedBox(height: 10,),

        //#name
        Text(story.name,style: TextStyle(color: Colors.grey[700]),),

      ],
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [

          //#header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 15,),
                    Text(post.userName,style: TextStyle(color: Colors.grey[700]),)
                  ],
                ),
                IconButton(onPressed: (){}, icon: Icon(SimpleLineIcons.options, color: Colors.grey,)),
              ],
            ),
          ),

          //#feed
          FadeInImage(
            width: MediaQuery.of(context).size.width,
            image: AssetImage(post.postImage),
            placeholder: AssetImage("assets/images/placeholder.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(FontAwesome.heart_o, color: Colors.grey[700],)),
                  IconButton(onPressed: (){}, icon: Icon(FontAwesome.send_o, color: Colors.grey[700])),
                  IconButton(onPressed: (){}, icon: Icon(FontAwesome.comment_o, color: Colors.grey[700])),
                ],
              ),
              IconButton(onPressed: (){}, icon: Icon(FontAwesome.bookmark_o, color: Colors.grey[700])),
            ],
          ),

          //#tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked By ",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  TextSpan(
                    text: "Sigmund,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Yessenia,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " Dayana",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: " and",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  TextSpan(
                    text: " 1263 others",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ]
              ),
            ),
          ),

          //#caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14,vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text: " ${post.caption}",
                      style: TextStyle(color: Colors.grey[700])
                  ),
                ]
              ),
            ),
          ),

          //#post date
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text("Febuary 2020", textAlign: TextAlign.start, style: TextStyle(color: Colors.grey),),
          )
        ],
      ),
    );
  }

}
