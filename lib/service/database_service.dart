import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_twitter/service/firestore_service.dart';

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
}