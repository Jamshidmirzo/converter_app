import 'package:converter_app/views/screens/excahngepage.dart';
import 'package:converter_app/views/screens/homepage.dart';
import 'package:converter_app/views/screens/settingspage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottomnavpage extends StatefulWidget {
  final Function changeMainTheme;

  Bottomnavpage({Key? key, required this.changeMainTheme}) : super(key: key);

  @override
  State<Bottomnavpage> createState() => _BottomnavpageState();
}

class _BottomnavpageState extends State<Bottomnavpage> {
  late List<Widget> screens;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    screens = [
      const Homepage(),
      const ExchangePage(),
      SettingsPage(changeMainTheme: widget.changeMainTheme),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.inverseSurface,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              CupertinoIcons.money_dollar_circle,
              size: 27,
            ),
            label: tr('courses'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.currency_exchange_outlined),
            label: tr('exchange'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: tr('settings'),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
