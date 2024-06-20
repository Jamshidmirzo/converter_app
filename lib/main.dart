import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:converter_app/views/screens/bottomnavpage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale("uz"),
        Locale("en"),
        Locale("ru"),
      ],
      path: 'resources/langs',
      startLocale: const Locale("en"),
      child: const Converter(),
    ),
  );
}

class Converter extends StatelessWidget {
  const Converter({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        textTheme: GoogleFonts.aboretoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      dark: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.aboretoTextTheme(
          ThemeData(brightness: Brightness.dark).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) => MaterialApp(
        theme: light,
        darkTheme: dark,
        debugShowCheckedModeBanner: false,
        home: const Bottomnavpage(),
      ),
    );
  }
}
