import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Screens/bottom_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  AnimatedSplashScreen build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash:  Scaffold(backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height*1,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_3gmfFFrH16JkHSlJhuo2Hvw6vtpWuzKHPVAg1bNqlfhgjMSUSCFRAuxEi9rVOBX-YFg&usqp=CAU'),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          )
        )
        
      ),
      ),
      nextScreen: const BottomScreen(),
    );
  }
}