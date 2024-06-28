import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Showmoddombottomforfont extends StatefulWidget {
  const Showmoddombottomforfont({super.key});

  @override
  State<Showmoddombottomforfont> createState() =>
      _ShowmoddombottomforfontState();
}

class _ShowmoddombottomforfontState extends State<Showmoddombottomforfont> {
  SharedPreferences? sharedPreferences;

  List<String> fontFamilies = [
    GoogleFonts.robotoCondensed().fontFamily!,
    GoogleFonts.newRocker().fontFamily!,
    GoogleFonts.actor().fontFamily!,
    GoogleFonts.poppins().fontFamily!,
    GoogleFonts.robotoMono().fontFamily!,
    GoogleFonts.oswald().fontFamily!,
    GoogleFonts.sacramento().fontFamily!,
    GoogleFonts.rubik().fontFamily!,
    GoogleFonts.playfairDisplay().fontFamily!,
    GoogleFonts.aboreto().fontFamily!,
  ];

  @override
  void initState() {
    super.initState();
    initializeSharedPreference();
  }

  void initializeSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {});
  }

  void changeFontFamily(String fontFamily) {
    AdaptiveTheme.of(context).setTheme(
      light: AdaptiveTheme.of(context).lightTheme.copyWith(
            textTheme: Typography().white.apply(
                  fontFamily: fontFamily,
                ),
          ),
      dark: AdaptiveTheme.of(context).darkTheme.copyWith(
            textTheme: Typography().white.apply(
                  fontFamily: fontFamily,
                ),
          ),
    );
    sharedPreferences?.setString("font", fontFamily);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: fontFamilies.map((fontFamily) {
            return ZoomTapAnimation(
              onTap: () {
                changeFontFamily(fontFamily);
              },
              child: ListTile(
                title: Text(
                  fontFamily.substring(0, fontFamily.indexOf("_")),
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 25,
                  ),
                ),
                trailing: sharedPreferences?.getString("font") == fontFamily
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
