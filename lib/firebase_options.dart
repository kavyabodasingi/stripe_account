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
    apiKey: 'AIzaSyB2PUBgptOvOhswXOxoajc4fwXAdf7EbEU',
    appId: '1:849402729771:web:ff11fa6ac67331164ba16e',
    messagingSenderId: '849402729771',
    projectId: 'stripeaccount-11a65',
    authDomain: 'stripeaccount-11a65.firebaseapp.com',
    storageBucket: 'stripeaccount-11a65.appspot.com',
    measurementId: 'G-PLBJFTB0M7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBn4yJdnKHhCwC6HYiokgy2jCffk_LEDho',
    appId: '1:849402729771:android:cfb3b7af04bec7c04ba16e',
    messagingSenderId: '849402729771',
    projectId: 'stripeaccount-11a65',
    storageBucket: 'stripeaccount-11a65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtHr88_2smvsp0n_2xNnVjUfurs37Koqo',
    appId: '1:849402729771:ios:8659e258e2c6fd6a4ba16e',
    messagingSenderId: '849402729771',
    projectId: 'stripeaccount-11a65',
    storageBucket: 'stripeaccount-11a65.appspot.com',
    iosBundleId: 'com.example.stripeAccount',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtHr88_2smvsp0n_2xNnVjUfurs37Koqo',
    appId: '1:849402729771:ios:8659e258e2c6fd6a4ba16e',
    messagingSenderId: '849402729771',
    projectId: 'stripeaccount-11a65',
    storageBucket: 'stripeaccount-11a65.appspot.com',
    iosBundleId: 'com.example.stripeAccount',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB2PUBgptOvOhswXOxoajc4fwXAdf7EbEU',
    appId: '1:849402729771:web:0587fe2daed0ef634ba16e',
    messagingSenderId: '849402729771',
    projectId: 'stripeaccount-11a65',
    authDomain: 'stripeaccount-11a65.firebaseapp.com',
    storageBucket: 'stripeaccount-11a65.appspot.com',
    measurementId: 'G-YZKWN0H54L',
  );
}