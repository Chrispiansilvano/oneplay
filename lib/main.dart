import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oneplay/firebase_options.dart';
import 'package:oneplay/pages/Comedy/Comedy.dart';
import 'package:oneplay/pages/Michezo/Michezo.dart';
import 'package:oneplay/pages/Movies/Movies.dart';
import 'package:oneplay/pages/Profile/Profile.dart';
import 'package:oneplay/pages/Reels/Reels.dart';
import 'package:oneplay/pages/Series/Series.dart';
import 'package:oneplay/pages/Trending/Trending.dart';
import 'package:oneplay/pages/Tv/Tv.dart';
import 'package:oneplay/pages/auth/AuthCheck.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
      home: const AuthCheck(),
      // home: const MyHomePage(),
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
  final _controller = PersistentTabController(initialIndex: 0);
  final List<Widget> _pages = [
    const HomePage(), // Your Home page with TabBarView
    Reels(), // Your Explore page
    const Tv(), // Your Settings page
     Profile(),
    // SignUp(),
    // const LogIn(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 47, 119, 126),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.movie),
        title: ("Reels"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 47, 119, 126),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.live_tv),
        title: ("Live Tv"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 47, 119, 126),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        title: ("Profile"),
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: const Color.fromARGB(255, 47, 119, 126),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _pages,
      items: _navBarsItems(),
      controller: _controller,
      navBarStyle: NavBarStyle.simple,
      backgroundColor: const Color.fromARGB(255, 57, 32, 58),
      popAllScreensOnTapOfSelectedTab: true,
    );
    // return Scaffold(

    //   body: _pages[_selectedIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     // fixedColor: Colors.white,
    //     unselectedItemColor: const Color.fromARGB(255, 47, 119, 126),
    //     selectedItemColor: Colors.white,
    //     type: BottomNavigationBarType.fixed,
    //     backgroundColor: const Color.fromARGB(255, 57, 32, 58),
    //     items: const [
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.movie),
    //         label: 'Reels',
    //       ), 020

    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.live_tv),
    //         label: 'Live Tv',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.account_circle),
    //         label: 'Profile',
    //       ),
    //     ],
    //     currentIndex: _selectedIndex,
    //     onTap: _onItemTapped,
    //   ),
    // );
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
              'OnePlay',
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
            labelColor: Colors.white,
            unselectedLabelColor: Color.fromARGB(255, 47, 119, 126),
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

