import 'package:flutter/material.dart';
import 'package:flutterapp/home_page.dart';
import 'package:flutterapp/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: currentPage == 0 ? const Text('Home') : const Text('Users'),
      ),
      body: pages[currentPage],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Pressed add button!');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Colors.amber,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              color: Colors.amber,
            ),
            label: "Users",
          ),
        ],
        onDestinationSelected: (int indexOfPage) {
          setState(() {
            currentPage = indexOfPage;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
