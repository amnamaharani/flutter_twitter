import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/theme/colors.dart';

class SearchScreen extends StatefulWidget {
  final String currentUserId;

  const SearchScreen({
    Key? key,
    required this.currentUserId,
  }): super (key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<QuerySnapshot> _users;
  TextEditingController _searchController = TextEditingController();

  clearSearch() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _searchController.clear());
    /* setState(() {
      _users = null;
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.5,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            hintStyle: const TextStyle(color: Colors.white),
            hintText: 'search',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            suffixIcon: IconButton(
              onPressed: () { 
                clearSearch();
              },
              icon: const Icon(Icons.clear, color: Colors.white,)),
            ),
            enabled: true,
            onChanged: (input) {
              
            },
        ),
      ),
      body: const Center(
        child: Text('SearchScreen'),
      ),
    );
  }
}