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
    apiKey: 'AIzaSyAVORBpGbAzdVHnjaN9al_gsmlsbkvVmZo',
    appId: '1:132138384466:web:dd630c73705e77549db38b',
    messagingSenderId: '132138384466',
    projectId: 'linkedinclone-fb49a',
    authDomain: 'linkedinclone-fb49a.firebaseapp.com',
    storageBucket: 'linkedinclone-fb49a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBnLRurnAs_-KLrScj-PaRwIka1qKE1MSs',
    appId: '1:132138384466:android:482576fb41d2753c9db38b',
    messagingSenderId: '132138384466',
    projectId: 'linkedinclone-fb49a',
    storageBucket: 'linkedinclone-fb49a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVUrfkVObsuzD79CK46oUPW6o2PYLobaM',
    appId: '1:132138384466:ios:5c9f993de757f47e9db38b',
    messagingSenderId: '132138384466',
    projectId: 'linkedinclone-fb49a',
    storageBucket: 'linkedinclone-fb49a.appspot.com',
    iosBundleId: 'com.example.linkedinClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVUrfkVObsuzD79CK46oUPW6o2PYLobaM',
    appId: '1:132138384466:ios:af0c48efb48d50a99db38b',
    messagingSenderId: '132138384466',
    projectId: 'linkedinclone-fb49a',
    storageBucket: 'linkedinclone-fb49a.appspot.com',
    iosBundleId: 'com.example.linkedinClone.RunnerTests',
  );
}