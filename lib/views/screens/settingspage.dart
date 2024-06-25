import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:converter_app/views/widgets/showmoddombottomforfont.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SettingsPage extends StatefulWidget {
  final Function changeMainTheme;
  Function changeColorScheme;

  SettingsPage(
      {super.key,
      required this.changeMainTheme,
      required this.changeColorScheme});

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
  List<Color> colors = [
    Colors.blue,
    Colors.white,
    Colors.amber,
    Colors.red,
    Colors.deepPurple,
    Colors.cyan,
    Colors.green,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink
  ];

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
            mainAxisSize: MainAxisSize.min,
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
                  title: Text(
                    context.tr('lt'),
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
                  title: Text(
                    context.tr('lm'),
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
                  title: Text(
                    context.tr('dm'),
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
              context.tr('lng'),
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
                  context.setLocale(const Locale('uz'));
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
                title: Text(context.tr('uz'),
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
                  context.setLocale(const Locale('ru'));
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
                title: Text(context.tr('ru'),
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
                  context.setLocale(const Locale('en'));
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
                title: Text(context.tr('en'),
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

  void showForColor(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Change your app color',
                style: TextStyle(fontSize: 23, color: Colors.amber),
              ),
              Flexible(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return ZoomTapAnimation(
                      onTap: () {
                        widget.changeColorScheme(colors[index]);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: colors[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
        title: Text(context.tr('settingspg')),
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
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.language,
                    size: 50,
                  ),
                  title: Text(
                    context.tr('lng'),
                    style: const TextStyle(
                      fontSize: 20,
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
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.text_fields_sharp,
                    size: 50,
                  ),
                  title: Text(
                    context.tr('chfont'),
                    style: const TextStyle(
                      fontSize: 20,
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
                  _showModalBottomSheetForMode(context);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.dark_mode_outlined,
                    size: 50,
                  ),
                  title: Text(
                    context.tr('chmode'),
                    style: const TextStyle(fontSize: 23),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ZoomTapAnimation(
                onTap: () {
                  showForColor(context);
                },
                child: const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.color_lens_outlined,
                    size: 50,
                  ),
                  title: Text(
                    'Edit App Color',
                    style: TextStyle(fontSize: 23),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
