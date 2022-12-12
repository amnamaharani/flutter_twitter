import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String currentUserId;
  final String visitedUserId;

  const ProfileScreen({
    Key? key,
    required this.currentUserId,
    required this.visitedUserId,
  }): super (key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ProfileScreen'),
      ),
    );
  }
}