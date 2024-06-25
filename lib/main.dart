import 'package:adaptive_theme/adaptive_theme.dart';

import 'package:converter_app/views/screens/splashpage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      path: 'resources/langs/',
      startLocale: const Locale("uz"),
      child: Converter(),
    ),
  );
}

class Converter extends StatefulWidget {
  Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  TextTheme mainTextTheme = GoogleFonts.aboretoTextTheme();

  @override
  void initState() {
    super.initState();
    _loadFontPreference();
  }

  Future<void> _loadFontPreference() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    String? font = sharedpref.getString('font');
    setState(() {
      mainTextTheme = _getFontByName(font);
    });
  }

  TextTheme _getFontByName(String? fontName) {
    switch (fontName) {
      case 'RobotoCondensed':
        return GoogleFonts.robotoCondensedTextTheme();
      case 'NewRocker':
        return GoogleFonts.newRockerTextTheme();
      case 'Actor':
        return GoogleFonts.actorTextTheme();
      case 'Poppins':
        return GoogleFonts.poppinsTextTheme();
      case 'RobotoMono':
        return GoogleFonts.robotoMonoTextTheme();
      case 'Oswald':
        return GoogleFonts.oswaldTextTheme();
      case 'Sacramento':
        return GoogleFonts.sacramentoTextTheme();
      case 'Rubik':
        return GoogleFonts.rubikTextTheme();
      case 'PlayfairDisplay':
        return GoogleFonts.playfairDisplayTextTheme();
      default:
        return GoogleFonts.aboretoTextTheme();
    }
  }

  void changeMainTheme(int id) async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();
    String fontName;
    switch (id) {
      case 1:
        fontName = 'RobotoCondensed';
        mainTextTheme = GoogleFonts.robotoCondensedTextTheme();
        break;
      case 2:
        fontName = 'NewRocker';
        mainTextTheme = GoogleFonts.newRockerTextTheme();
        break;
      case 3:
        fontName = 'Actor';
        mainTextTheme = GoogleFonts.actorTextTheme();
        break;
      case 4:
        fontName = 'Poppins';
        mainTextTheme = GoogleFonts.poppinsTextTheme();
        break;
      case 5:
        fontName = 'RobotoMono';
        mainTextTheme = GoogleFonts.robotoMonoTextTheme();
        break;
      case 6:
        fontName = 'Oswald';
        mainTextTheme = GoogleFonts.oswaldTextTheme();
        break;
      case 7:
        fontName = 'Sacramento';
        mainTextTheme = GoogleFonts.sacramentoTextTheme();
        break;
      case 8:
        fontName = 'Rubik';
        mainTextTheme = GoogleFonts.rubikTextTheme();
        break;
      case 9:
        fontName = 'PlayfairDisplay';
        mainTextTheme = GoogleFonts.playfairDisplayTextTheme();
        break;
      default:
        fontName = 'Aboreto';
        mainTextTheme = GoogleFonts.aboretoTextTheme();
        break;
    }
    await sharedpref.setString('font', fontName);
    setState(() {});
  }

  Color maincolor = Colors.blue;
  changeColorScheme(Color color) {
    print(maincolor);
    maincolor = color;
    print(maincolor);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        textTheme: mainTextTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      dark: ThemeData.dark().copyWith(
        textTheme: mainTextTheme,
        colorScheme: ColorScheme.fromSeed(
          seedColor: maincolor,
          brightness: Brightness.dark,
        ),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) {
        return MaterialApp(
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: Splashpage(
              changeMainTheme: changeMainTheme,
              changeColorScheme: changeColorScheme),
        );
      },
    );
  }
}
