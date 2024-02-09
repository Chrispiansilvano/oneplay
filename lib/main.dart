import 'package:flutter/material.dart';
import 'package:oneplay/pages/Comedy/Comedy.dart';
import 'package:oneplay/pages/Michezo/Michezo.dart';
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
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          background: const Color.fromARGB(255, 76, 17, 86),
        ),
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
        // fixedColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 47, 119, 126),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 57, 32, 58),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            label: 'Live Tv',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
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
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 57, 32, 58),
          leading: Container(
            // padding: const EdgeInsets.all(5),
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
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
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.search,
                size: 25,
                color: Colors.white,
              ),
            )
          ],
          bottom: const TabBar(
            labelPadding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            labelColor: Color.fromARGB(255, 47, 119, 126),
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Trending'),
              Tab(text: 'Movies'),
              Tab(text: 'Series'),
              Tab(text: 'Michezo'),
              Tab(text: 'Comedy'),
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
            Series(),
            Michezo(),
            Comedy()
          ],
        ),
      ),
    );
  }
}

// Implement ExplorePage and SettingsPage similarly with their content

