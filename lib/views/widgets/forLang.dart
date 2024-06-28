import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Bottomforlang extends StatefulWidget {
  const Bottomforlang({super.key});

  @override
  State<Bottomforlang> createState() => _BottomforlangState();
}

class _BottomforlangState extends State<Bottomforlang> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.tr('lng'),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),
        ),
        ZoomTapAnimation(
          onTap: () {
            setState(() {
              context.setLocale(const Locale('uz'));
            });
            Navigator.pop(context);
          },
          child: ListTile(
            trailing: Localizations.localeOf(context).languageCode == 'uz'
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
              context.setLocale(const Locale('ru'));
            });
            Navigator.pop(context);
          },
          child: ListTile(
            trailing: Localizations.localeOf(context).languageCode == 'ru'
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
              context.setLocale(const Locale('en'));
            });
            Navigator.pop(context);
          },
          child: ListTile(
            trailing: Localizations.localeOf(context).languageCode == 'en'
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
  }
}
