import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDKP2KOtfzFOTsoZ_uH1f3nBANGgeMw5xE",
            authDomain: "emergency-media-app.firebaseapp.com",
            projectId: "emergency-media-app",
            storageBucket: "emergency-media-app.appspot.com",
            messagingSenderId: "787191181451",
            appId: "1:787191181451:web:79863340c8c62b7b07248e",
            measurementId: "G-P0QXJPB0VB"));
  } else {
    await Firebase.initializeApp();
  }
}
