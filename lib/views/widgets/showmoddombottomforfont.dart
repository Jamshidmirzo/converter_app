import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Showmoddombottomforfont extends StatefulWidget {
  final Function changeMainTheme;

  Showmoddombottomforfont({super.key, required this.changeMainTheme});

  @override
  State<Showmoddombottomforfont> createState() =>
      _ShowmoddombottomforfontState();
}

class _ShowmoddombottomforfontState extends State<Showmoddombottomforfont> {
  bool isRoboto = false;
  bool isRobotoMono = false;
  bool newRocker = false;
  bool actor = false;
  bool oswald = false;
  bool popins = false;
  bool sacramento = false;
  bool rubik = false;
  bool playfair = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(1);
                setState(() {
                  isRoboto = true;
                  isRobotoMono = false;
                  newRocker = false;
                  actor = false;
                  oswald = false;
                  popins = false;
                  sacramento = false;
                  rubik = false;
                  playfair = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Roboto',
                  style: GoogleFonts.roboto(fontSize: 25),
                ),
                trailing: isRoboto
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(2);
                setState(() {
                  isRoboto = false;
                  isRobotoMono = false;
                  newRocker = true;
                  actor = false;
                  oswald = false;
                  popins = false;
                  sacramento = false;
                  rubik = false;
                  playfair = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'New Rocker',
                  style: GoogleFonts.newRocker(fontSize: 25),
                ),
                trailing: newRocker
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(3);
                setState(() {
                  isRoboto = false;
                  isRobotoMono = false;
                  newRocker = false;
                  actor = true;
                  oswald = false;
                  popins = false;
                  sacramento = false;
                  rubik = false;
                  playfair = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Actor',
                  style: GoogleFonts.actor(fontSize: 25),
                ),
                trailing: actor
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(4);
                setState(() {
                  isRoboto = false;
                  isRobotoMono = false;
                  newRocker = false;
                  actor = false;
                  oswald = false;
                  popins = true;
                  sacramento = false;
                  rubik = false;
                  playfair = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Poppins',
                  style: GoogleFonts.poppins(fontSize: 25),
                ),
                trailing: popins
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(5);
                setState(() {
                  isRoboto = false;
                  isRobotoMono = true;
                  newRocker = false;
                  actor = false;
                  oswald = false;
                  popins = false;
                  sacramento = false;
                  rubik = false;
                  playfair = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Roboto Mono',
                  style: GoogleFonts.robotoMono(fontSize: 25),
                ),
                trailing: isRobotoMono
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(6);
                setState(() {
                  isRoboto = false;
                  isRobotoMono = false;
                  newRocker = false;
                  actor = false;
                  oswald = true;
                  popins = false;
                  sacramento = false;
                  rubik = false;
                  playfair = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Oswald',
                  style: GoogleFonts.oswald(fontSize: 25),
                ),
                trailing: oswald
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(7);
                setState(() {
                  isRoboto = false;
                  isRobotoMono = false;
                  newRocker = false;
                  actor = false;
                  oswald = false;
                  popins = false;
                  sacramento = true;
                  rubik = false;
                  playfair = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Sacramento',
                  style: GoogleFonts.sacramento(fontSize: 25),
                ),
                trailing: sacramento
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(8);
                setState(() {
                  isRoboto = false;
                  isRobotoMono = false;
                  newRocker = false;
                  actor = false;
                  oswald = false;
                  popins = false;
                  sacramento = false;
                  rubik = true;
                  playfair = false;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Rubik',
                  style: GoogleFonts.rubik(fontSize: 25),
                ),
                trailing: rubik
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
            ZoomTapAnimation(
              onTap: () {
                widget.changeMainTheme(9);
                setState(() {
                  isRoboto = false;
                  isRobotoMono = false;
                  newRocker = false;
                  actor = false;
                  oswald = false;
                  popins = false;
                  sacramento = false;
                  rubik = false;
                  playfair = true;
                });
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text(
                  'Playfair',
                  style: GoogleFonts.playfairDisplay(fontSize: 25),
                ),
                trailing: playfair
                    ? Icon(
                        Icons.done,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
