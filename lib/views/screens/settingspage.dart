import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:converter_app/views/widgets/showmoddombottomforfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SettingsPage extends StatefulWidget {
  final Function changeMainTheme;

  SettingsPage({super.key, required this.changeMainTheme});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool isChoiceuzbek = false;
  bool isChoicerus = false;
  bool isChoiceeng = false;
  bool isSystem = true;
  bool isDark = false;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    _getCurrentTheme();
  }

  Future<void> _getCurrentTheme() async {
    final themeMode = await AdaptiveTheme.getThemeMode();
    setState(() {
      isDarkMode = themeMode == AdaptiveThemeMode.dark;
    });
  }

  void _showModalBottomSheetForMode(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              ZoomTapAnimation(
                onTap: () {
                  isSystem = true;
                  isDark = false;
                  isLight = false;
                  setState(() {});
                  Navigator.pop(context);
                  AdaptiveTheme.of(context).setSystem();
                },
                child: ListTile(
                  trailing: isSystem
                      ? Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )
                      : null,
                  leading: const Icon(CupertinoIcons.device_phone_portrait),
                  title: const Text(
                    'Like a telephone',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  isSystem = false;
                  isDark = false;
                  isLight = true;
                  setState(() {});
                  Navigator.pop(context);
                  AdaptiveTheme.of(context).setLight();
                },
                child: ListTile(
                  trailing: isLight
                      ? Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )
                      : null,
                  leading: const Icon(Icons.light_mode),
                  title: const Text(
                    'Light mode',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              ZoomTapAnimation(
                onTap: () {
                  isSystem = false;
                  isDark = true;
                  isLight = false;
                  setState(() {});
                  Navigator.pop(context);
                  AdaptiveTheme.of(context).setDark();
                },
                child: ListTile(
                  trailing: isDark
                      ? Icon(
                          Icons.done,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        )
                      : null,
                  leading: const Icon(Icons.dark_mode),
                  title: const Text(
                    'Dark mode',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Language',
              style: GoogleFonts.aboreto(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            ZoomTapAnimation(
              onTap: () {
                setState(() {
                  isChoiceuzbek = true;
                  isChoiceeng = false;
                  isChoicerus = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                trailing: isChoiceuzbek
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
                title: Text('Uzbek',
                    style: GoogleFonts.aboreto(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary)),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.worldatlas.com/img/flag/uz-flag.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                setState(() {
                  isChoiceuzbek = false;
                  isChoiceeng = false;
                  isChoicerus = true;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                trailing: isChoicerus
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
                title: Text('Russian',
                    style: GoogleFonts.aboreto(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary)),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://yourflag.com.au/wp-content/uploads/russia-federation-flag.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                setState(() {
                  isChoiceuzbek = false;
                  isChoiceeng = true;
                  isChoicerus = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                trailing: isChoiceeng
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
                title: Text('English',
                    style: GoogleFonts.aboreto(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary)),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://upload.wikimedia.org/wikipedia/en/thumb/a/ae/Flag_of_the_United_Kingdom.svg/800px-Flag_of_the_United_Kingdom.svg.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _showFontBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Showmoddombottomforfont(
          changeMainTheme: widget.changeMainTheme,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings page"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ZoomTapAnimation(
                onTap: () {
                  _showModalBottomSheet(context);
                },
                child: const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.language,
                    size: 50,
                  ),
                  title: Text(
                    "Language",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ZoomTapAnimation(
                onTap: () {
                  _showFontBottomSheet(context);
                },
                child: const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.text_fields_sharp,
                    size: 50,
                  ),
                  title: Text(
                    "Change Font",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ZoomTapAnimation(
                onTap: () {
                  _showModalBottomSheetForMode(context);
                },
                child: const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.dark_mode_outlined,
                    size: 50,
                  ),
                  title: Text(
                    "Change mode",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
