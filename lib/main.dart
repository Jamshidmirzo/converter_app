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
  const Converter({super.key});

  @override
  State<Converter> createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  TextTheme mainTextTheme = GoogleFonts.aboretoTextTheme();

  late Future<Color> mainColorFuture;

  @override
  void initState() {
    super.initState();
    mainColorFuture = initializeSharedPreference();
  }

  Future<Color> initializeSharedPreference() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    int? color = sharedPrefs.getInt('color');

    if (color == null) {
      color = Colors.blue.value;
      await sharedPrefs.setInt('color', color);
    }

    return Color(color);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color>(
      future: mainColorFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error loading color'));
        } else if (snapshot.hasData) {
          final mainColor = snapshot.data!;
          return AdaptiveTheme(
            light: ThemeData(
              textTheme: mainTextTheme,
              colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
            ),
            dark: ThemeData.dark().copyWith(
              textTheme: mainTextTheme,
              colorScheme: ColorScheme.fromSeed(
                seedColor: mainColor,
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
                home: Splashpage(),
              );
            },
          );
        } else {
          return const Center(child: Text('Unexpected error'));
        }
      },
    );
  }
}
