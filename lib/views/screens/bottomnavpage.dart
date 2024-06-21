import 'package:converter_app/views/screens/homepage.dart';
import 'package:converter_app/views/screens/settingspage.dart';
import 'package:flutter/material.dart';

class Bottomnavpage extends StatefulWidget {
  final Function changeMainTheme;
  Bottomnavpage({super.key, required this.changeMainTheme});
  @override
  State<Bottomnavpage> createState() => _BottomnavpageState();
}

class _BottomnavpageState extends State<Bottomnavpage> {
  List screens = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    screens = [
      const Homepage(),
      SettingsPage(changeMainTheme: widget.changeMainTheme)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).colorScheme.inverseSurface,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.currency_exchange_outlined), label: 'Courses'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
