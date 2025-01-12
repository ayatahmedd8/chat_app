// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBNxDtZFI_U1ygV4dihqam3ZTuguI869nI',
    appId: '1:1080819229073:web:8182033220e8fe8c7dfa30',
    messagingSenderId: '1080819229073',
    projectId: 'chat-app-9dd66',
    authDomain: 'chat-app-9dd66.firebaseapp.com',
    storageBucket: 'chat-app-9dd66.firebasestorage.app',
    measurementId: 'G-WW5KG0YEQB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPamEXs8hpz3Tz4VoAd0kC1julOMMlI-g',
    appId: '1:1080819229073:android:37907484c477e91f7dfa30',
    messagingSenderId: '1080819229073',
    projectId: 'chat-app-9dd66',
    storageBucket: 'chat-app-9dd66.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEme2_blEFOx6knQPqU5wjPGr3DIShCpE',
    appId: '1:1080819229073:ios:c58887b5a710cbc67dfa30',
    messagingSenderId: '1080819229073',
    projectId: 'chat-app-9dd66',
    storageBucket: 'chat-app-9dd66.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEme2_blEFOx6knQPqU5wjPGr3DIShCpE',
    appId: '1:1080819229073:ios:c58887b5a710cbc67dfa30',
    messagingSenderId: '1080819229073',
    projectId: 'chat-app-9dd66',
    storageBucket: 'chat-app-9dd66.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBNxDtZFI_U1ygV4dihqam3ZTuguI869nI',
    appId: '1:1080819229073:web:cac05928622d6cc27dfa30',
    messagingSenderId: '1080819229073',
    projectId: 'chat-app-9dd66',
    authDomain: 'chat-app-9dd66.firebaseapp.com',
    storageBucket: 'chat-app-9dd66.firebasestorage.app',
    measurementId: 'G-BVEKYF91TJ',
  );
}
