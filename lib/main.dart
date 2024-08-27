import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyAldApChupOXTBap8IqwepzxS8xMEjFIgs',
        appId: 'com.example.movies_app',
        messagingSenderId: '202874023741',
        projectId: 'movies-4458b')
  )
      :
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
