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
    apiKey: 'AIzaSyD0AIbQi5rNMs1FJnj0OrVl6CUsYCSnosc',
    appId: '1:170611148436:web:780373c34007308b791681',
    messagingSenderId: '170611148436',
    projectId: 'chatapp1-2504d',
    authDomain: 'chatapp1-2504d.firebaseapp.com',
    storageBucket: 'chatapp1-2504d.appspot.com',
    measurementId: 'G-ZL5GLCJ3MM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDFTo3HiMUes-pJK44R6MJ-9ilpn_RKkc0',
    appId: '1:170611148436:android:6f983e24858bd3e7791681',
    messagingSenderId: '170611148436',
    projectId: 'chatapp1-2504d',
    storageBucket: 'chatapp1-2504d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXhDXOEi3XURu2jqZRZF59W6sUrXH-KF8',
    appId: '1:170611148436:ios:2c61f4cd509d21a6791681',
    messagingSenderId: '170611148436',
    projectId: 'chatapp1-2504d',
    storageBucket: 'chatapp1-2504d.appspot.com',
    iosBundleId: 'com.example.chatApp2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXhDXOEi3XURu2jqZRZF59W6sUrXH-KF8',
    appId: '1:170611148436:ios:8b99157c69615624791681',
    messagingSenderId: '170611148436',
    projectId: 'chatapp1-2504d',
    storageBucket: 'chatapp1-2504d.appspot.com',
    iosBundleId: 'com.example.chatApp2.RunnerTests',
  );
}