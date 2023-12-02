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
    apiKey: 'AIzaSyDKpw4S_40l1CZAS55xXvcrUcmzdOiocX4',
    appId: '1:1052000782133:web:6ae73ce5a9131be8f9ae7c',
    messagingSenderId: '1052000782133',
    projectId: 'codelab2-d853d',
    authDomain: 'codelab2-d853d.firebaseapp.com',
    storageBucket: 'codelab2-d853d.appspot.com',
    measurementId: 'G-MPB71T2M7Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqYWCBy5PklwLdqkqAYDjUQ5ESs3MZnw4',
    appId: '1:1052000782133:android:9958c9e378cd09d3f9ae7c',
    messagingSenderId: '1052000782133',
    projectId: 'codelab2-d853d',
    storageBucket: 'codelab2-d853d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUJzgoShJkwqfYVZyJKKAHpOe2pxgIxbQ',
    appId: '1:1052000782133:ios:4aba0277968c3b3af9ae7c',
    messagingSenderId: '1052000782133',
    projectId: 'codelab2-d853d',
    storageBucket: 'codelab2-d853d.appspot.com',
    iosBundleId: 'com.example.casoStudioIum',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUJzgoShJkwqfYVZyJKKAHpOe2pxgIxbQ',
    appId: '1:1052000782133:ios:f1118ad8d98942dcf9ae7c',
    messagingSenderId: '1052000782133',
    projectId: 'codelab2-d853d',
    storageBucket: 'codelab2-d853d.appspot.com',
    iosBundleId: 'com.example.casoStudioIum.RunnerTests',
  );
}
