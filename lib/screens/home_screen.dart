import 'package:flutter/material.dart';
import 'package:flutter_twitter/screens/create_tweet_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          Navigator.push(context, 
          MaterialPageRoute(builder: ((context) => const CreateTweetScreen())
          ));
        },
        backgroundColor: Colors.white,
        child: Image.asset('assets/tweet.png'),
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}