import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyACM8luizHXFIKWvoK5paOjSegCdRjMU-I",
            authDomain: "testdemo-5f4be.firebaseapp.com",
            projectId: "testdemo-5f4be",
            storageBucket: "testdemo-5f4be.appspot.com",
            messagingSenderId: "400384978728",
            appId: "1:400384978728:web:ba0e548daa1bcd763eaa1d"));
  } else {
    await Firebase.initializeApp();
  }
}
