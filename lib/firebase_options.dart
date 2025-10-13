import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String _getEnv(String key) => dotenv.env[key] ?? '';

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static final String _projectId = _getEnv('FIREBASE_PROJECT_ID');
  static final String _messagingSenderId =
      _getEnv('FIREBASE_MESSAGING_SENDER_ID');
  static final String _databaseUrl = _getEnv('FIREBASE_DATABASE_URL');
  static final String _storageBucket = _getEnv('FIREBASE_STORAGE_BUCKET');

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: _getEnv('FIREBASE_WEB_API_KEY'),
    appId: _getEnv('FIREBASE_WEB_APP_ID'),
    messagingSenderId: _messagingSenderId,
    projectId: _projectId,
    authDomain: _getEnv('FIREBASE_WEB_AUTH_DOMAIN'),
    databaseURL: _databaseUrl,
    storageBucket: _storageBucket,
    measurementId: _getEnv('FIREBASE_WEB_MEASUREMENT_ID'),
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: _getEnv('FIREBASE_ANDROID_API_KEY'),
    appId: _getEnv('FIREBASE_ANDROID_APP_ID'),
    messagingSenderId: _messagingSenderId,
    projectId: _projectId,
    databaseURL: _databaseUrl,
    storageBucket: _storageBucket,
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: _getEnv('FIREBASE_IOS_MACOS_API_KEY'),
    appId: _getEnv('FIREBASE_IOS_MACOS_APP_ID'),
    messagingSenderId: _messagingSenderId,
    projectId: _projectId,
    databaseURL: _databaseUrl,
    storageBucket: _storageBucket,
    androidClientId: _getEnv('FIREBASE_IOS_MACOS_ANDROID_CLIENT_ID'),
    iosClientId: _getEnv('FIREBASE_IOS_MACOS_IOS_CLIENT_ID'),
    iosBundleId: _getEnv('FIREBASE_IOS_MACOS_BUNDLE_ID'),
  );

  static final FirebaseOptions macos = ios;

  static final FirebaseOptions windows = FirebaseOptions(
    apiKey: _getEnv('FIREBASE_WINDOWS_API_KEY'),
    appId: _getEnv('FIREBASE_WINDOWS_APP_ID'),
    messagingSenderId: _messagingSenderId,
    projectId: _projectId,
    authDomain: _getEnv('FIREBASE_WINDOWS_AUTH_DOMAIN'),
    databaseURL: _databaseUrl,
    storageBucket: _storageBucket,
    measurementId: _getEnv('FIREBASE_WINDOWS_MEASUREMENT_ID'),
  );
}
