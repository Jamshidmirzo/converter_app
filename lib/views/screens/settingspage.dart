import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:converter_app/views/widgets/forColor.dart';
import 'package:converter_app/views/widgets/forLang.dart';
import 'package:converter_app/views/widgets/forMode.dart';
import 'package:converter_app/views/widgets/forFont.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ignore: must_be_immutable
class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

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
        return Bottomformode();
      },
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Bottomforlang();
      },
    );
  }

  void showForColor(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Bottomforcolor();
      },
    );
  }

  void _showFontBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Showmoddombottomforfont();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('settingspg'),
        ),
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
