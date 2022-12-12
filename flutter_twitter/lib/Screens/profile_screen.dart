import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/model/user_model.dart';
import 'package:flutter_twitter/service/database_service.dart';
import 'package:flutter_twitter/theme/colors.dart';

class ProfileScreen extends StatefulWidget {
  final String currentUserId;
  final String visitedUserId;

  const ProfileScreen({
    Key? key,
    required this.currentUserId,
    required this.visitedUserId,
  }): super (key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _followersCount = 0;
  int _followingCount = 0;

  int _profileSegmentedValue = 0;
  final Map<int, Widget> _profiletabs = <int, Widget> {
    0: const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'tweets',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white
        ),
      ),
    ),
    1: const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Media',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white
        ),
      ),
    ),
    2: const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Likes',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Colors.white
        ),
      ),
    ),
  };

  Widget buildProfileWidgets(){
    switch(_profileSegmentedValue){
      case 0:
        return Center(child: Text('Tweets'),);
        break;
      case 1:
        return Center(child: Text('Media'),);
        break;
      case 2:
        return Center(child: Text('Likes'),);
        break;  
      default:
        return Center(child: Text('Something wrong'),);
        break;  
    }
  }

  getFollowersCount() async {
    int followersCount = await DatabaseServices.followersNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followersCount = followersCount;
      });
    }
  }

  getFollowingCount() async {
    int followingCount = await DatabaseServices.followingNum(widget.visitedUserId);
    if (mounted) {
      setState(() {
        _followingCount = followingCount;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getFollowersCount();
    getFollowingCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: usersRef.doc(widget.visitedUserId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(KTweeterColor),
              ),
            );
          }
          UserModel userModel = UserModel.fromDoc(snapshot.data);
          return ListView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: KTweeterColor,
                  image: userModel.coverImage.isEmpty
                    ? null
                    : DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(userModel.coverImage),
                      )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox.shrink(),
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.more_horiz, 
                          color: Colors.white,
                          size: 30,
                        ),
                        itemBuilder: (context) {
                          return <PopupMenuItem<String>>[
                            const PopupMenuItem(
                              value: 'logout',
                              child: Text('Logout'),
                            )
                          ];
                        },
                        onSelected: (selectedItem) {
                          
                        },
                      )
                    ],
                  ),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -45.0, 0.0),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: userModel.profilePicture.isEmpty
                            ? null
                            : NetworkImage(userModel.profilePicture),
                        ),
                        Container(
                          width: 100,
                          height: 25,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: KTweeterColor)
                          ),
                          child: const Center(
                            child: Text(
                              'Edit',
                              style: TextStyle(
                                fontSize: 12,
                                color: KTweeterColor,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userModel.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      userModel.bio,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          '$_followingCount Following',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Text(
                          '$_followersCount Followers',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoSlidingSegmentedControl(
                        groupValue: _profileSegmentedValue,
                        thumbColor: KTweeterColor,
                        backgroundColor: Colors.blueGrey,
                        children: _profiletabs,
                        onValueChanged: (i) {
                          setState(() {
                            _profileSegmentedValue = i!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              buildProfileWidgets(),
            ],
          );
        }
      ),
    );
  }
}