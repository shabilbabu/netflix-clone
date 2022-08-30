import 'package:flutter/material.dart';
import 'package:netflix/Screens/coming_screen.dart';
import 'package:netflix/Screens/download_screen.dart';
import 'package:netflix/Screens/fast_laugh_screen.dart';
import 'package:netflix/Screens/homescreen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  final List pages = [
    const HomeScreen(),
    const ComingScreen(),
    const FastLaugh(),
    const DownloadScreen(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (newindex) {
            setState(() {
              _currentIndex = newindex;
            });
          },
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.home),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined),
                backgroundColor: Colors.black,
                label: 'Coming Soon'),
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_emotions_outlined),
                backgroundColor: Colors.black,
                label: 'Fast Laughs'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download_for_offline_outlined),
                backgroundColor: Colors.black,
                label: 'Downloads')
          ]),
    );
  }
}
