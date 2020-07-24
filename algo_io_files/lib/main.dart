import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(AlgIO());
}

// The App will start as a stateful widget
class AlgIO extends StatefulWidget {
  @override
  _AlgIOState createState() => _AlgIOState();
}

class _AlgIOState extends State<AlgIO> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(100, 56, 99, 168),
        child: Text(
          'AlgIO',
          style: GoogleFonts.getFont('Ubuntu'),
        ));
  }
}
