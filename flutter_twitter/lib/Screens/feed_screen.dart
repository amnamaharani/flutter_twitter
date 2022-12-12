import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/screens/create_tweet_screen.dart';
import 'package:flutter_twitter/screens/home_screen.dart';
import 'package:flutter_twitter/screens/notification_screen.dart';
import 'package:flutter_twitter/screens/profile_screen.dart';
import 'package:flutter_twitter/screens/search_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int selectedTab = 0;
  List<Widget> feedScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: feedScreens.elementAt(selectedTab),
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(context, 
          MaterialPageRoute(builder: ((context) => const CreateTweetScreen())
          ));
        },
        backgroundColor: Colors.white,
        child: Image.asset('assets/tweet.png'),
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        activeColor: const Color(0xff00acee),
        currentIndex: selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}