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
    apiKey: 'AIzaSyCDQzE7qjmbS7tDTFyTJ4LD-Pj9sBbeAXA',
    appId: '1:1079158233773:web:8a1dfd92110c9368ba4424',
    messagingSenderId: '1079158233773',
    projectId: 'dogswag-machinetest',
    authDomain: 'dogswag-machinetest.firebaseapp.com',
    storageBucket: 'dogswag-machinetest.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdnOddL2QIW883wDtKhDNuQIQHgB0TUNE',
    appId: '1:1079158233773:android:6ed8be604d1dc0a9ba4424',
    messagingSenderId: '1079158233773',
    projectId: 'dogswag-machinetest',
    storageBucket: 'dogswag-machinetest.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCvaStB2OCNYkRlO7o832baadNlkxS-rzI',
    appId: '1:1079158233773:ios:eb0ae69d4b3c6cb9ba4424',
    messagingSenderId: '1079158233773',
    projectId: 'dogswag-machinetest',
    storageBucket: 'dogswag-machinetest.appspot.com',
    iosBundleId: 'com.example.dogswagChatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCvaStB2OCNYkRlO7o832baadNlkxS-rzI',
    appId: '1:1079158233773:ios:3ad568992632499bba4424',
    messagingSenderId: '1079158233773',
    projectId: 'dogswag-machinetest',
    storageBucket: 'dogswag-machinetest.appspot.com',
    iosBundleId: 'com.example.dogswagChatApp.RunnerTests',
  );
}
