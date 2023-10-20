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
    apiKey: 'AIzaSyBckiPXA-Jm80RKJa8gbG3it7tjPM8fhlM',
    appId: '1:185434535816:web:9a58691cb24144077fac3d',
    messagingSenderId: '185434535816',
    projectId: 'nilanotes-flutter-proj',
    authDomain: 'nilanotes-flutter-proj.firebaseapp.com',
    storageBucket: 'nilanotes-flutter-proj.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlnz0Bym6jIZoHGowhgyYvk9VYgpMaY5Q',
    appId: '1:185434535816:android:2d868a800cc2eb887fac3d',
    messagingSenderId: '185434535816',
    projectId: 'nilanotes-flutter-proj',
    storageBucket: 'nilanotes-flutter-proj.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCdv9L1WasTRANZtTKaWcOKTYLD1KTO2Ys',
    appId: '1:185434535816:ios:f7472e676aa926e17fac3d',
    messagingSenderId: '185434535816',
    projectId: 'nilanotes-flutter-proj',
    storageBucket: 'nilanotes-flutter-proj.appspot.com',
    iosBundleId: 'in.nilabanu.nilanotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCdv9L1WasTRANZtTKaWcOKTYLD1KTO2Ys',
    appId: '1:185434535816:ios:00666da89391c5967fac3d',
    messagingSenderId: '185434535816',
    projectId: 'nilanotes-flutter-proj',
    storageBucket: 'nilanotes-flutter-proj.appspot.com',
    iosBundleId: 'in.nilabanu.nilanotes.RunnerTests',
  );
}
