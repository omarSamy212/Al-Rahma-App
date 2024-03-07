import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDAEPim34aQm1DfIvkpN36nn36JV27YYfU",
            authDomain: "storage-kbaczx.firebaseapp.com",
            projectId: "storage-kbaczx",
            storageBucket: "storage-kbaczx.appspot.com",
            messagingSenderId: "748044862889",
            appId: "1:748044862889:web:a3c51556f5eefc716b70b8"));
  } else {
    await Firebase.initializeApp();
  }
}
