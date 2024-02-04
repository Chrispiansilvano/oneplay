import 'package:flutter/material.dart';
import 'package:oneplay/pages/Comedy/Comedy.dart';
import 'package:oneplay/pages/Tv/Tv.dart';

import 'pages/Michezo/Michezo.dart';
import 'pages/Movies/Movies.dart';
import 'pages/Series/Series.dart';
import 'pages/Trending/Trending.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Index(),
    );
  }
}

class Index extends StatefulWidget {
  static final List<Widget> _pages = [
    const Trending(),
    const Movies(),
    const Series(),
    const Michezo(),
    const Comedy(),
    // const Tv()
  ];

  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  // const Index({super.key});
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this, // Provide vsync from the mixin
    );
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose of TabController
    super.dispose();
  }

  void _onItemTapped(int index) {
    _tabController.animateTo(index); // Use TabController to switch tabs
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 49, 24, 53),
        leading: Container(
          // padding: const EdgeInsets.all(5),
          padding: const EdgeInsets.fromLTRB(2, 5, 0, 5),
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
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
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
        bottom: TabBar(
          // isScrollable: true,
          controller: _tabController,
          // Using TabBar for a more compact layout
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.white,
          labelPadding: const EdgeInsets.fromLTRB(2, 0, 8, 0),

          tabs: const [
            Tab(text: 'Trending'),
            Tab(text: 'Movies'),
            Tab(text: 'Series'),
            Tab(text: 'Michezo'),
            Tab(text: 'Comedy'),
            // Tab(text: 'Tv'),
          ],
          onTap: _onItemTapped,
        ),
      ),
      body: TabBarView(
        // Use TabBarView to display corresponding pages
        controller: _tabController,
        children: Index._pages,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.settings), label: 'Settings'),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.amber[800],
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
