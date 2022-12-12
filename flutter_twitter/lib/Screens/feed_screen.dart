import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/screens/create_tweet_screen.dart';
import 'package:flutter_twitter/screens/home_screen.dart';
import 'package:flutter_twitter/screens/notification_screen.dart';
import 'package:flutter_twitter/screens/profile_screen.dart';
import 'package:flutter_twitter/screens/search_screen.dart';
import 'package:flutter_twitter/theme/colors.dart';

class FeedScreen extends StatefulWidget {
  final String currentUserId;

  const FeedScreen({
    Key? key,
    required this.currentUserId,
  }): super (key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomeScreen(),
        const SearchScreen(),
        const NotificationScreen(),
        ProfileScreen(
          currentUserId: widget.currentUserId,
          visitedUserId: widget.currentUserId,
        ),
      ].elementAt(selectedTab),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        activeColor: KTweeterColor,
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