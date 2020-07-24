import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(AlgIO());
}

class AlgIO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

// The App will start as a stateful widget
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextStyle algoFont = GoogleFonts.ubuntu(fontSize: 40);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(100, 56, 99, 168),
        child: Center(
          child: Column(children: [
            Divider(
              height: 250,
            ),
            Text(
              'AlgIO',
            ),
            FlatButton(
              color: Colors.grey,
              onPressed: null,
              child: Text(
                'Continue to App',
                textDirection: TextDirection.ltr,
              ),
            ),
          ]),
        ));
  }
}
