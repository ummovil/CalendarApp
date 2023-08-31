import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAvzT8q_liygok5i6FKWPjVahv470k_hDk",
            authDomain: "calendar-e3c51.firebaseapp.com",
            projectId: "calendar-e3c51",
            storageBucket: "calendar-e3c51.appspot.com",
            messagingSenderId: "771667961238",
            appId: "1:771667961238:web:888a7a488256a038eba9b7"));
  } else {
    await Firebase.initializeApp();
  }
}
