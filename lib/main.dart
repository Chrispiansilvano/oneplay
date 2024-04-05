import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oneplay/Widgets/SplashScreen.dart';
import 'package:oneplay/firebase_options.dart';
import 'package:oneplay/pages/Comedy/Comedy.dart';
import 'package:oneplay/pages/Michezo/Michezo.dart';
import 'package:oneplay/pages/Movies/Movies.dart';
import 'package:oneplay/pages/Profile/Profile.dart';
import 'package:oneplay/pages/Reels/Reels.dart';
import 'package:oneplay/pages/SearchComponent/Searchpage.dart';
import 'package:oneplay/pages/Series/Series.dart';
import 'package:oneplay/pages/Trending/Trending.dart';
import 'package:oneplay/pages/Tv/Tv.dart';
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
        // inputDecorationTheme: const InputDecorationTheme(
        //     labelStyle: TextStyle(color: Color.fromARGB(255, 47, 119, 126))),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          background: const Color.fromARGB(255, 7, 23, 33),
        ),
      ),
      home: const Splash(),
      // home: const AuthCheck(),
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
    const Profile(),
    // SignUp(),
    // const LogIn(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: const Color.fromARGB(255, 134, 135, 135),
          activeColorSecondary: const Color.fromARGB(255, 126, 196, 236)),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.movie),
          title: ("Reels"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: const Color.fromARGB(255, 134, 135, 135),
          activeColorSecondary: const Color.fromARGB(255, 126, 196, 236)),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.live_tv),
          title: ("Live Tv"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: const Color.fromARGB(255, 134, 135, 135),
          activeColorSecondary: const Color.fromARGB(255, 126, 196, 236)),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.account_circle),
          title: ("Profile"),
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: const Color.fromARGB(255, 134, 135, 135),
          activeColorSecondary: const Color.fromARGB(255, 126, 196, 236)),
    ];
  }

  int currentIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(), // Your Home page with TabBarView
    Reels(), // Your Explore page
    const Tv(), // Your Settings page
    const Profile(),
    // SignUp(),
    // const LogIn(),
  ];

  @override
  Widget build(BuildContext context) {
    // bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom != 0.0;

    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar:
          // bottomNavigationBar: Theme(

          //   data: Theme.of(context).copyWith(
          //     // sets the background color of the `BottomNavigationBar`
          //     canvasColor: const Color.fromARGB(255, 7, 23, 33), // Updated to white

          //     // sets the active color of the `BottomNavigationBar`
          //     primaryColor:
          //         const Color.fromARGB(255, 126, 196, 236), // Updated to green

          //     // sets the inactive color of the `BottomNavigationBar`
          //     unselectedWidgetColor: Colors.black, // Updated to black
          //     textTheme: Theme.of(context).textTheme.copyWith(
          //           bodySmall: const TextStyle(
          //             color: Colors.black, // Updated to black
          //             fontWeight: FontWeight.normal, // Updated to normal weight
          //           ),
          //           // Optionally, you can also modify the selected label style
          //           // caption: const TextStyle(
          //           //   color: Colors.green,
          //           //   fontWeight: FontWeight.bold,
          //           // ),
          //         ),
          //   ),
          //   child:
          BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Container(
                  height: 35,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 47, 119, 126),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Center(
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                        Icon(Icons.home_filled),
                        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                        Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ))),
          BottomNavigationBarItem(
              icon: const Icon(Icons.movie_outlined),
              label: 'Reels',
              activeIcon: Container(
                  height: 35,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 47, 119, 126),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Icon(Icons.movie_rounded),
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Text(
                        'Reels',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ))),
          BottomNavigationBarItem(
              icon: const Icon(Icons.live_tv_outlined),
              label: 'Live Tv',
              activeIcon: Container(
                  height: 35,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 47, 119, 126),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Icon(Icons.live_tv_rounded),
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Text(
                        'Live Tv',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ))),
          BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle_outlined),
              label: 'Profile',
              activeIcon: Container(
                  height: 35,
                  width: 100,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 47, 119, 126),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Icon(Icons.account_circle),
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                      Text(
                        'Reels',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ))),
        ],
        currentIndex: currentIndex,
        onTap: ((int index) {
          setState(() {
            currentIndex = index;
          });
        }),
        // The background color should be white, so it is removed here.
        // backgroundColor: Colors.white,
        selectedItemColor:
            const Color.fromARGB(255, 255, 255, 255), // Updated to green
        unselectedItemColor:
            const Color.fromARGB(255, 134, 135, 135), // Updated to black
      ),
      // ),
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
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          // backgroundColor: const Color.fromARGB(255, 7, 39, 59),
          backgroundColor: const Color.fromARGB(255, 20, 62, 87),
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
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage()));
                },
                child: const Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            )
          ],
          elevation: 0.0,
          bottom: const TabBar(
            dividerColor: Colors.transparent,
            labelPadding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            labelColor: Color.fromARGB(255, 126, 196, 236),
            unselectedLabelColor: Color.fromARGB(255, 255, 255, 255),
            indicatorColor: Color.fromARGB(255, 126, 196, 236),
            tabs: [
              Tab(text: 'Trending'),
              Tab(text: 'Movies'),
              Tab(text: 'Series'),
              Tab(text: 'Michezo'),
              Tab(text: 'Comedy'),
            ],
          ),
        ),
        body: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment
                  .topCenter, // Adjust as desired (top left by default)
              end: Alignment
                  .bottomCenter, // Adjust as desired (bottom right by default)s
              colors: [
                Color.fromARGB(255, 20, 62, 87),
                Color.fromARGB(255, 15, 44, 61),
                Color.fromARGB(255, 13, 37, 52),
                Color.fromARGB(255, 10, 31, 44),
                Color.fromARGB(255, 7, 23, 33),
              ],
            ),
          ),
          child: const TabBarView(
            children: [Trending(), Movies(), Series(), Michezo(), Comedy()],
          ),
        ),
      ),
    );
  }
}
