// main.dart
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'favorites_manager.dart';
import 'loading_screen.dart';
import 'theme.dart';
import 'gradient_background.dart';
import 'toggle_theme_button.dart';
import 'home_page.dart';
import 'list_page.dart';
import 'more_page.dart';
import 'list_page2.dart';
import 'list_page3.dart';
import 'list_page4.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Required for async operations before runApp
  await FavoritesManager.instance.loadFavorites(); // Load favorites
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light; // Default to light mode

  void _toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(onFinish: () {
              Navigator.pushReplacementNamed(context, '/home');
            }),
        '/home': (context) => MyHomePage(
              toggleTheme: _toggleTheme,
              themeMode: _themeMode,
            ),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final void Function(bool) toggleTheme;
  final ThemeMode themeMode;

  const MyHomePage({
    super.key,
    required this.toggleTheme,
    required this.themeMode,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _preloadImages = [
    'assets/logo1.jpg',
  ];

  final List<Widget> _pages = const [
    HomePageContent(),
    ListPage(),
    ListPage2(),
    ListPage3(),
    ListPage4(),
    MorePage(),
  ];

  final List<String> _titles = [
    '',
    'VÂNRAM NGAIH HLA',
    'FAKNA HLA DANG',
    'RAM NGAIH HLA',
    'LÈNGKHÂWM ZÀI',
    'A DANGTE',
  ];

  final List<Icon> _navIcons = const [
    Icon(Icons.home, size: 30, color: Colors.white),
    Icon(Icons.menu_book, size: 30, color: Colors.white),
    Icon(Icons.church, size: 30, color: Colors.white),
    Icon(Icons.forest, size: 30, color: Colors.white),
    Icon(Icons.diversity_1, size: 30, color: Colors.white),
    Icon(Icons.more_horiz, size: 30, color: Colors.white),
  ];

  @override
  void initState() {
    super.initState();
    _preloadImagesToCache();
  }

  Future<void> _preloadImagesToCache() async {
    for (var imagePath in _preloadImages) {
      await precacheImage(AssetImage(imagePath), context);
    }
    setState(() {});
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onNavBarTapped(int index) {
    if ((_currentPage - index).abs() > 1) {
      _pageController.jumpToPage(index); // Skip animation for jumps > 1 page
    } else {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToPage(int pageIndex) {
    Navigator.pop(context); // Close the drawer
    _onNavBarTapped(pageIndex); // Navigate to the page
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackgroundPage(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            _titles[_currentPage],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            ToggleThemeButton(
              isDarkMode: widget.themeMode == ThemeMode.dark,
              toggleTheme: (isDark) {
                setState(() {
                  widget.toggleTheme(isDark);
                });
              },
            ),
          ],
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  image: const DecorationImage(
                    image: AssetImage('assets/logo1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'BYMA Hla Bu Thuhmahruai',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () => _navigateToPage(0),
              ),
              ListTile(
                leading: const Text(
                  'I',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.w900,
                    fontSize: 23.0,
                  ),
                ),
                title: const Text(
                  'VÂNRAM NGAIH HLA',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                trailing: const Text(
                  '(1-86)',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
                onTap: () => _navigateToPage(1),
              ),
              ListTile(
                leading: const Text(
                  'II',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.w900,
                    fontSize: 23.0,
                  ),
                ),
                title: const Text(
                  'FAKNA HLA DANG',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                trailing: const Text(
                  '(87-170)',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
                onTap: () => _navigateToPage(2),
              ),
              ListTile(
                leading: const Text(
                  'III',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.w900,
                    fontSize: 23.0,
                  ),
                ),
                title: const Text(
                  'RAM NGAIH HLA',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                trailing: const Text(
                  '(171-180)',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
                onTap: () => _navigateToPage(3),
              ),
              ListTile(
                leading: const Text(
                  'IV',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontWeight: FontWeight.w900,
                    fontSize: 23.0,
                  ),
                ),
                title: const Text(
                  'LÈNGKHÂWM ZÀI',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                trailing: const Text(
                  '(1-153)',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
                onTap: () => _navigateToPage(4),
              ),
              ListTile(
                leading: const Icon(Icons.more_vert_rounded),
                title: const Text(
                  'A DANGTE (More)',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                onTap: () => _navigateToPage(5),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _currentPage,
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
          backgroundColor: Colors.transparent,
          items: _navIcons,
          onTap: _onNavBarTapped,
        ),
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: _pages.length,
          physics:
              const NeverScrollableScrollPhysics(), // Disable swipe gestures
          itemBuilder: (context, index) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _pages[index],
            );
          },
        ),
      ),
    );
  }
}
