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
    apiKey: 'AIzaSyBXJ7-3lr56mWHtIK2ej5ZowT_xwYKARnY',
    appId: '1:525273387990:web:11c3f6d7c351af200b4a77',
    messagingSenderId: '525273387990',
    projectId: 'rapiddelivery-pfe-app',
    authDomain: 'rapiddelivery-pfe-app.firebaseapp.com',
    storageBucket: 'rapiddelivery-pfe-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyADv5aw7SOM7LB_zTkWY1_X4-xUkTwQdgU',
    appId: '1:525273387990:android:8ea5ed02331f5b2b0b4a77',
    messagingSenderId: '525273387990',
    projectId: 'rapiddelivery-pfe-app',
    storageBucket: 'rapiddelivery-pfe-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBF4BSTGKtQzucJ-al7rTvMyNjJAtJJhc8',
    appId: '1:525273387990:ios:43e4ec3d33419fcc0b4a77',
    messagingSenderId: '525273387990',
    projectId: 'rapiddelivery-pfe-app',
    storageBucket: 'rapiddelivery-pfe-app.appspot.com',
    iosBundleId: 'com.example.rapidDeliveryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBF4BSTGKtQzucJ-al7rTvMyNjJAtJJhc8',
    appId: '1:525273387990:ios:43e4ec3d33419fcc0b4a77',
    messagingSenderId: '525273387990',
    projectId: 'rapiddelivery-pfe-app',
    storageBucket: 'rapiddelivery-pfe-app.appspot.com',
    iosBundleId: 'com.example.rapidDeliveryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBXJ7-3lr56mWHtIK2ej5ZowT_xwYKARnY',
    appId: '1:525273387990:web:b5f29d34f5dce36c0b4a77',
    messagingSenderId: '525273387990',
    projectId: 'rapiddelivery-pfe-app',
    authDomain: 'rapiddelivery-pfe-app.firebaseapp.com',
    storageBucket: 'rapiddelivery-pfe-app.appspot.com',
  );

}