

import 'package:algo_io_files/pages/MergeSort.dart';
import 'package:algo_io_files/pages/SortingAlgScreen.dart';
import 'package:algo_io_files/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:algo_io_files/pages/welcome_screen.dart';

void main() {
  runApp(AlgIO());
}

class AlgIO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color.fromARGB(100, 56, 99, 168),
        primaryColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.5),
          size: 20,
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 100,
            color: Colors.white,
          ),
          headline2: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: 22,
            color: Colors.white,
          ),
          bodyText1: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.bodyText1,
            fontSize: 20,
            color: Colors.white,
          ),
          bodyText2: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.bodyText2,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/Sorting Algorithms': (context) => SortingAlgScreen(),
        '/Merge Sort': (context) => AnimatedMergeSort(),
      },
    );
  }
}


