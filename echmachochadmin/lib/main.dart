import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/validators/mainpage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDAx5aGpKcM4nJHP9VmwQrXXKRhdj_pp7g",
            projectId: "phone-auth-4b58f",
            storageBucket: "phone-auth-4b58f.appspot.com",
            messagingSenderId: "168370540301",
            appId: "1:168370540301:web:18d684c599a76d0f1dea44"
            // apiKey: "AIzaSyCflwUo-URtohsjorKU0JC4f5vunD8A4Nc",
            // projectId: "final-esemachoch-db",
            // storageBucket: "final-esemachoch-db.appspot.com",
            // messagingSenderId: "287041487046",
            // appId: "1:287041487046:web:06b59861a4b8adeef517c7",
            //measurementId: "G-NKG3NJB3SG,
            //authDomain: "final-esemachoch-db.firebaseapp.com",
            ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _mainState();
}

class _mainState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainpage(),
    );
  }
}
