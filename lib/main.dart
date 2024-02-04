import 'package:flutter/material.dart';
import 'package:oneplay/pages/Movies/Movies.dart';
import 'package:oneplay/pages/Profile/Profile.dart';
import 'package:oneplay/pages/Reels/Reels.dart';
import 'package:oneplay/pages/Series/Series.dart';
import 'package:oneplay/pages/Trending/Trending.dart';
import 'package:oneplay/pages/Tv/Tv.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Example',
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
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(), // Your Home page with TabBarView
    const Reels(), // Your Explore page
    const Tv(), // Your Settings page
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Navigation Example'),
      // ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Reels'),
          BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: 'Live Tv'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 49, 24, 53),
          leading: Container(
            // padding: const EdgeInsets.all(5),
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Image.asset(
              'images/logo.png',

              // height: 60,
            ),
          ),
          title: Title(
            color: const Color.fromARGB(255, 38, 174, 42),
            child: const Text(
              'Oneplay',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.search,
                size: 25,
                color: Colors.white,
              ),
            )
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Trending'),
              Tab(text: 'Movies'),
              Tab(text: 'Series'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Your content for Trending
            Trending(),
            // Your content for Movies
            Movies(),
            // Your content for Series
            Series()
          ],
        ),
      ),
    );
  }
}

// Implement ExplorePage and SettingsPage similarly with their content

