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
    apiKey: 'AIzaSyAr1ePEahaKWKo12v4sOuYAppnLAhVO8xE',
    appId: '1:184470602254:web:e7f3b599dc6d7d133cb25f',
    messagingSenderId: '184470602254',
    projectId: 'cm-bootsrap',
    authDomain: 'cm-bootsrap.firebaseapp.com',
    storageBucket: 'cm-bootsrap.appspot.com',
    measurementId: 'G-E9MNDMRZ09',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkVSkxEnng2h2YJQi4qcK4dUmn8mvtExA',
    appId: '1:184470602254:android:abcbb3e370618ed63cb25f',
    messagingSenderId: '184470602254',
    projectId: 'cm-bootsrap',
    storageBucket: 'cm-bootsrap.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJ3XCXFtOjaNDGt-NsjtZqIjVB--WyHbA',
    appId: '1:184470602254:ios:898c01103502f81c3cb25f',
    messagingSenderId: '184470602254',
    projectId: 'cm-bootsrap',
    storageBucket: 'cm-bootsrap.appspot.com',
    iosBundleId: 'dev.Spoti.cmFlutterBootstrap',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJ3XCXFtOjaNDGt-NsjtZqIjVB--WyHbA',
    appId: '1:184470602254:ios:20f8c08cc6bdb6483cb25f',
    messagingSenderId: '184470602254',
    projectId: 'cm-bootsrap',
    storageBucket: 'cm-bootsrap.appspot.com',
    iosBundleId: 'dev.Spoti.cmFlutterBootstrap.RunnerTests',
  );
}
