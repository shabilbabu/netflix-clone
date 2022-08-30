import 'package:flutter/material.dart';
import 'package:netflix/Screens/homescreen.dart';
import 'package:netflix/Screens/splash_screen.dart';


void main()async {
 await HomeScreen.loadMovies();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: const SplashScreen(),
    );
  }
}