import 'package:flutter/material.dart';
import 'package:stage/screens/following_screen.dart';
import 'package:stage/screens/for_you_screen.dart';
import 'package:stage/widgets/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int page = 0;
  final _screens = const [
    ForYouScreen(),
    FollowingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          currentIndex: page,
          onTap: (value) {
            setState(() {
              page = value;
            });
          },
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'For you'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Following')
          ],
        ),
        body: _screens[page]);
  }
}
