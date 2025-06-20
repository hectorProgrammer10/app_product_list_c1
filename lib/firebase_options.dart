// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
// import 'firebase_options.dart';
// // ...
// await Firebase.initializeApp(
//   options: DefaultFirebaseOptions.currentPlatform,
// );
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
    apiKey: 'AIzaSyCOdrkRwZ5K8xUQ-CtETmidKswxlsOB-OA',
    appId: '1:717866969149:web:0ae0e0cbf8c0020fdce254',
    messagingSenderId: '717866969149',
    projectId: 'movilesdosmayo',
    authDomain: 'movilesdosmayo.firebaseapp.com',
    storageBucket: 'movilesdosmayo.firebasestorage.app',
    measurementId: 'G-RM8ELDM517',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJppBVccWWvI_d1yP4248k5M89_BUd-ho',
    appId: '1:717866969149:android:d3565240b7076cfcdce254',
    messagingSenderId: '717866969149',
    projectId: 'movilesdosmayo',
    storageBucket: 'movilesdosmayo.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKj6z83hFrtzV2WBHzs2Ejj96cUiZfAts',
    appId: '1:717866969149:ios:0a61afe94a0a9901dce254',
    messagingSenderId: '717866969149',
    projectId: 'movilesdosmayo',
    storageBucket: 'movilesdosmayo.firebasestorage.app',
    iosBundleId: 'com.example.productListApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKj6z83hFrtzV2WBHzs2Ejj96cUiZfAts',
    appId: '1:717866969149:ios:0a61afe94a0a9901dce254',
    messagingSenderId: '717866969149',
    projectId: 'movilesdosmayo',
    storageBucket: 'movilesdosmayo.firebasestorage.app',
    iosBundleId: 'com.example.productListApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOdrkRwZ5K8xUQ-CtETmidKswxlsOB-OA',
    appId: '1:717866969149:web:f2eb39ff1e583b4fdce254',
    messagingSenderId: '717866969149',
    projectId: 'movilesdosmayo',
    authDomain: 'movilesdosmayo.firebaseapp.com',
    storageBucket: 'movilesdosmayo.firebasestorage.app',
    measurementId: 'G-JG5DKPN6BD',
  );

}