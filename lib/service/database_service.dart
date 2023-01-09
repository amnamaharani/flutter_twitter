import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_twitter/model/user_model.dart';

final fireStore = FirebaseFirestore.instance;

final usersRef = fireStore.collection('users');
final followersRef = fireStore.collection('followers');
final followingRef = fireStore.collection('following');

class DatabaseServices{
  static Future<int> followersNum(String userId) async {
    QuerySnapshot followersSnapshot = await followersRef.doc(userId).collection('userFollowers').get();
    return followersSnapshot.docs.length;
  }

  static Future<int> followingNum(String userId) async {
    QuerySnapshot followingSnapshot = await followingRef.doc(userId).collection('userFollowing').get();
    return followingSnapshot.docs.length;
  }

  static void updateUserData(UserModel user) {
    usersRef.doc(user.id).update({
      'name' : user.name,
      'bio' : user.bio,
      'profilePicture' : user.profilePicture,
      'coverImage' : user.coverImage,
    });
  }

  static Future<QuerySnapshot> searchUsers(String name) async {
    Future<QuerySnapshot> users = usersRef
      .where('name', isGreaterThanOrEqualTo: name)
      .where('name', isLessThan: '${name}z')
      .get();
    
    return users;
  }
}