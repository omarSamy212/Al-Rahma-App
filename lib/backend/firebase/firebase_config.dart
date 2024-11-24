import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDxsSdE1L3VoijuWJp2sdM3w2qCfZWeY9U",
            authDomain: "al-rahma-testing.firebaseapp.com",
            projectId: "al-rahma-testing",
            storageBucket: "al-rahma-testing.appspot.com",
            messagingSenderId: "27595286934",
            appId: "1:27595286934:web:5b4cd5341b273fad7815b7",
            measurementId: "G-QXND3TWBVZ"));
  } else {
    await Firebase.initializeApp();
  }
}
