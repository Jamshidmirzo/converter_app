import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:converter_app/views/screens/splashpage.dart';
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

  changeMainTheme(int id) {
    print(id);
    switch (id) {
      case 1:
        mainTextTheme = GoogleFonts.robotoCondensedTextTheme();
        break;
      case 2:
        mainTextTheme = GoogleFonts.newRockerTextTheme();
        break;
      case 3:
        mainTextTheme = GoogleFonts.actorTextTheme();
        break;
      case 4:
        mainTextTheme = GoogleFonts.poppinsTextTheme();
        break;
      case 5:
        mainTextTheme = GoogleFonts.robotoMonoTextTheme();
        break;
      case 6:
        mainTextTheme = GoogleFonts.oswaldTextTheme();
        break;
      case 7:
        mainTextTheme = GoogleFonts.sacramentoTextTheme();
        break;
      case 8:
        mainTextTheme = GoogleFonts.rubikTextTheme();
        break;
      case 9:
        mainTextTheme = GoogleFonts.playfairTextTheme();
        break;
      default:
        mainTextTheme = GoogleFonts.aboretoTextTheme();
        break;
    }
    // AdaptiveTheme.of(context).reset();
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
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) {
        return MaterialApp(
          theme: light,
          darkTheme: dark,
          debugShowCheckedModeBanner: false,
          home: Splashpage(
            changeMainTheme: changeMainTheme,
          ),
        );
      },
    );
  }
}
