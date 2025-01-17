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
    apiKey: 'AIzaSyA6mtWQJPEGEliVUyRYqWnBxyCO3k2Q8tU',
    appId: '1:382889126502:web:6117bf32d7fa6e4e671ba7',
    messagingSenderId: '382889126502',
    projectId: 'my-projext-first',
    authDomain: 'my-projext-first.firebaseapp.com',
    storageBucket: 'my-projext-first.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjWxO9903nyE3WDWSX0AYLKSNwVjTe5AQ',
    appId: '1:382889126502:android:ea32260c59b1f649671ba7',
    messagingSenderId: '382889126502',
    projectId: 'my-projext-first',
    storageBucket: 'my-projext-first.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8QYyY8jywlK48rluqQa73CjvXwzcFjGM',
    appId: '1:382889126502:ios:e8b9beafd9a629a1671ba7',
    messagingSenderId: '382889126502',
    projectId: 'my-projext-first',
    storageBucket: 'my-projext-first.appspot.com',
    iosBundleId: 'com.example.untitled6',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8QYyY8jywlK48rluqQa73CjvXwzcFjGM',
    appId: '1:382889126502:ios:fdfb8722457f490f671ba7',
    messagingSenderId: '382889126502',
    projectId: 'my-projext-first',
    storageBucket: 'my-projext-first.appspot.com',
    iosBundleId: 'com.example.untitled6.RunnerTests',
  );
}
