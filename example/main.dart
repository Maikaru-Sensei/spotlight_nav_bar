import 'package:flutter/material.dart';
import 'package:highlight_nav_bar/spotlight_item.dart';
import 'package:highlight_nav_bar/spotlight_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SpotlightNavBar Example',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: SpotlightNavBar(
          items: [
            SpotlightItem(
              title: 'Home',
              screen: const Center(
                child: Text('Home'),
              ),
            ),
            SpotlightItem(
              title: 'Search',
              screen: const Center(
                child: Text('Search'),
              ),
              icon: Icons.search,
              spotlightColor: Colors.green,
            ),
            SpotlightItem(
              title: 'Profile',
              screen: const Center(
                child: Text('Profile'),
              ),
              icon: Icons.person,
              lampColor: Colors.red,
              spotlightColor: Colors.blue,
            ),
          ],
        ));
  }
}
