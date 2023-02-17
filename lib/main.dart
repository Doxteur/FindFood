import 'package:flutter/material.dart';
import 'package:spotifyclone/Views/bottomNavigation.dart';

import 'Views/searchBar.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 125,
          elevation: 0,
          title: const Text('Main App'),
        ),
        body: Center(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}
