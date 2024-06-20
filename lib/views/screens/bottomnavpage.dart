import 'package:converter_app/views/screens/homepage.dart';
import 'package:converter_app/views/screens/settingspage.dart';
import 'package:flutter/material.dart';

class Bottomnavpage extends StatefulWidget {
  const Bottomnavpage({super.key});

  @override
  State<Bottomnavpage> createState() => _BottomnavpageState();
}

class _BottomnavpageState extends State<Bottomnavpage> {
  List screens = [Homepage(), SettingsPage()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).colorScheme.inverseSurface,
        // selectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Money'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
