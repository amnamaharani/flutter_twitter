import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/model/user_model.dart';
import 'package:flutter_twitter/screens/profile_screen.dart';
import 'package:flutter_twitter/service/database_service.dart';

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
  Future<QuerySnapshot>? _users;
  final TextEditingController _searchController = TextEditingController();

  clearSearch() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => _searchController.clear());
    setState(() {
      _users = null;
    });
  }

  buildUserTile(UserModel user) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: user.profilePicture.isEmpty
          ? null
          : NetworkImage(user.profilePicture)
      ),
      title: Text(user.name),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProfileScreen(
            currentUserId: widget.currentUserId, 
            visitedUserId: user.id,
          ))
        );
      },
    );
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
              if(input.isNotEmpty){
                setState(() {
                  _users = DatabaseServices.searchUsers(input);
                });
              }
            },
        ),
      ),
      body: _users == null 
        ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.search, size: 200,),
              Text(
                'search user...',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
        : FutureBuilder(
          future: _users,
          builder: (BuildContext context,AsyncSnapshot snapshot) {
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(snapshot.data.docs.length == 0) {
              return const Center(
                child: Text('No users found !'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (BuildContext context,int index) {
                UserModel user = UserModel.fromDoc(snapshot.data.docs[index]);
                return buildUserTile(user);
              },
            );
          }
        )
    );
  }
}