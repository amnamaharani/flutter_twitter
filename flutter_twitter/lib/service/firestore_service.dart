import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

final fireStore = FirebaseFirestore.instance;

final usersRef = fireStore.collection('users');
final followersRef = fireStore.collection('followers');
final followingRef = fireStore.collection('following');