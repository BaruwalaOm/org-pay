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
    apiKey: 'AIzaSyBaFuZEX8E_yU4nH9tJuWsRZKMzs81HdGo',
    appId: '1:143607532182:web:fdf724722056cc343350b7',
    messagingSenderId: '143607532182',
    projectId: 'fir-tutorial-489cd',
    authDomain: 'fir-tutorial-489cd.firebaseapp.com',
    storageBucket: 'fir-tutorial-489cd.appspot.com',
    measurementId: 'G-PTLGKM7FCC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYC6CVL2hou9TU0cvWm6vbb0dEFXVJUjs',
    appId: '1:143607532182:android:3b71d389b69cecc33350b7',
    messagingSenderId: '143607532182',
    projectId: 'fir-tutorial-489cd',
    storageBucket: 'fir-tutorial-489cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsju0sHPoN9vHACTgTAeO2AgwWcPQgamw',
    appId: '1:143607532182:ios:4b0c8f0ec8a8b89d3350b7',
    messagingSenderId: '143607532182',
    projectId: 'fir-tutorial-489cd',
    storageBucket: 'fir-tutorial-489cd.appspot.com',
    iosBundleId: 'com.example.firebasetutorial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsju0sHPoN9vHACTgTAeO2AgwWcPQgamw',
    appId: '1:143607532182:ios:4b0c8f0ec8a8b89d3350b7',
    messagingSenderId: '143607532182',
    projectId: 'fir-tutorial-489cd',
    storageBucket: 'fir-tutorial-489cd.appspot.com',
    iosBundleId: 'com.example.firebasetutorial',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBaFuZEX8E_yU4nH9tJuWsRZKMzs81HdGo',
    appId: '1:143607532182:web:116258d51fa547a73350b7',
    messagingSenderId: '143607532182',
    projectId: 'fir-tutorial-489cd',
    authDomain: 'fir-tutorial-489cd.firebaseapp.com',
    storageBucket: 'fir-tutorial-489cd.appspot.com',
    measurementId: 'G-13ZH60ZKRS',
  );
}