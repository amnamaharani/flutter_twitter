// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDbjoQHJHItp52rHSKb4bJwMFb35DTEzZI',
    appId: '1:473727127506:web:ad9d7e7c5aa6db9347c20b',
    messagingSenderId: '473727127506',
    projectId: 'flutter-twitter-72cf7',
    authDomain: 'flutter-twitter-72cf7.firebaseapp.com',
    storageBucket: 'flutter-twitter-72cf7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGWkbYrucc_TTQk8ljaeI7F6O_ubcN-zg',
    appId: '1:473727127506:android:22de79508a04b74b47c20b',
    messagingSenderId: '473727127506',
    projectId: 'flutter-twitter-72cf7',
    storageBucket: 'flutter-twitter-72cf7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgZYPS9gs7PUwUSW5nO4LsD0Kt44riCzM',
    appId: '1:473727127506:ios:293b868cfbc32bb147c20b',
    messagingSenderId: '473727127506',
    projectId: 'flutter-twitter-72cf7',
    storageBucket: 'flutter-twitter-72cf7.appspot.com',
    iosClientId: '473727127506-fd49quulvkfeh025ukeka2bjl4mohk80.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTwitter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAgZYPS9gs7PUwUSW5nO4LsD0Kt44riCzM',
    appId: '1:473727127506:ios:293b868cfbc32bb147c20b',
    messagingSenderId: '473727127506',
    projectId: 'flutter-twitter-72cf7',
    storageBucket: 'flutter-twitter-72cf7.appspot.com',
    iosClientId: '473727127506-fd49quulvkfeh025ukeka2bjl4mohk80.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTwitter',
  );
}
