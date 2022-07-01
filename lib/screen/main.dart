import 'package:flutter/material.dart';
import 'package:flutter_app_upub/palette/palette.dart';
import 'package:flutter_app_upub/data/actionlist.dart';
import 'package:flutter_app_upub/data/userlist.dart';
import 'package:flutter_app_upub/data/storylist.dart';
import 'package:flutter_app_upub/data/postlist.dart';
import 'package:flutter_app_upub/widget/posts.dart';
import 'package:flutter_app_upub/widget/stories.dart';
import 'package:flutter_app_upub/screen/chat.dart';
import 'package:flutter_app_upub/screen/environment.dart';
import 'package:flutter_app_upub/screen/locationaddress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of this application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter uPub',
      theme: ThemeData(
        // Using primarySwatch for creating color of toolbar  -  in this case the color grey
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Upalette.upWhite,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Using a stateful widget - meaning it has a state object that contains fields that affect how it looks
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This widget is the root of this application
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Upalette.upWhite,
      // Appbar consists of a toolbar
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: "uPUB  ",
                  style: TextStyle(
                    color: Upalette.upRed,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
                TextSpan(
                    text: "like it, love it, publish it",
                    style: TextStyle(
                      color: Upalette.upRed,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    )),
              ],
            ),
          ),
          // Action buttons
          actions: [
            IconButton(
              onPressed: () {
                // navigate to the second route - in this case to chat screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
              },
              icon: const Icon(Icons.chat_bubble),
              color: Upalette.upRed,
            ),
            IconButton(
              onPressed: () {
                // navigate to the second route - in this case to location screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocationPage()),
                );
              },
              icon: const Icon(Icons.location_on),
              color: Upalette.upRed,
            ),
            IconButton(
              onPressed: () {
                // navigate to the second route - in this case to evironment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EnvironmentPage()),
                );
              },
              icon: const Icon(Icons.forest),
              color: Upalette.upRed,
            ),
          ]),
      // Using singlechildscroolview to make scroll enable
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // Using mainAxisAlignment property to determine position vertically
            // Using crossAxisAlignmen property to determine position horizontal
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Upalette.upWhite,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 27.0,
                            backgroundColor: Upalette.upRed,
                            child: CircleAvatar(
                              radius: 25.0,
                              backgroundImage: AssetImage(userImageUrl[0]),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.black26,
                              ),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 25.0),
                                  hintText: "What's up ?",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(0.0),
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(
                        color: Upalette.upGrey,
                        thickness: 1.5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 260.0,
                width: double.infinity,
                // Using listview to display stories next to each other in a horizontal direction
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    allStories(userImageUrl[0], stories[0], userName[0]),
                    allStories(userImageUrl[1], stories[1], userName[1]),
                    allStories(userImageUrl[2], stories[2], userName[2]),
                    allStories(userImageUrl[3], stories[3], userName[3]),
                    allStories(userImageUrl[4], stories[4], userName[4]),
                    allStories(userImageUrl[5], stories[5], userName[5]),
                    allStories(userImageUrl[6], stories[6], userName[6]),
                    allStories(userImageUrl[7], stories[7], userName[7]),
                    allStories(userImageUrl[8], stories[8], userName[8]),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: double.infinity,
              ),
              // Display posts
              postFeed(userImageUrl[0], userName[0], "6 min", posts[0],
                  postImages[0], userLikes[0], userLoves[0], userComments[0]),
              postFeed(userImageUrl[5], userName[5], "55 min", posts[5],
                  postImages[5], userLikes[5], userLoves[5], userComments[5]),
              postFeed(userImageUrl[4], userName[4], "4 days", posts[4],
                  postImages[4], userLikes[4], userLoves[4], userComments[4]),
              postFeed(userImageUrl[2], userName[2], "10 days", posts[2],
                  postImages[2], userLikes[2], userLoves[2], userComments[2]),
              postFeed(userImageUrl[7], userName[7], "3 weeks", posts[7],
                  postImages[7], userLikes[7], userLoves[7], userComments[7]),
              postFeed(userImageUrl[6], userName[6], "2 months", posts[6],
                  postImages[6], userLikes[6], userLoves[6], userComments[6]),
              postFeed(userImageUrl[8], userName[8], "6 months", posts[8],
                  postImages[8], userLikes[8], userLoves[8], userComments[8]),
              postFeed(userImageUrl[1], userName[1], "2 years", posts[1],
                  postImages[1], userLikes[1], userLoves[1], userComments[1]),
              postFeed(userImageUrl[3], userName[3], "4 years", posts[3],
                  postImages[3], userLikes[3], userLoves[3], userComments[5]),
            ],
          ),
        ),
      ),
    );
  }
}
