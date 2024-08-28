import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movies_app/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/model/added_movie_provider.dart';
import 'package:provider/provider.dart';

import 'home/movie_details/movie_details_tab.dart';
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
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AddedMovieProvider(),
        ),
      ],child: MyApp(),
  )
      );
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        MovieDetailsTab.routeName:(context) => MovieDetailsTab(),
        HomeScreen.routeName:(context) => HomeScreen(),
},
    );
  }
}
