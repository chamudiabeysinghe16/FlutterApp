import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:audio_inspect/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //This is a method that initializes the binding, which is required for the app to run.
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions
          .currentPlatform); //This is a method that initializes the Firebase services that you need to use in the app.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email and Password Login',
      theme: ThemeData(
        //'primarySwatch' allows you to define a primary color and derive shades of that color to use throughout your application.
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
