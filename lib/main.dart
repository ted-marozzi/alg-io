import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(AlgIO());
}

class AlgIO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color.fromARGB(100, 56, 99, 168),
        textTheme: TextTheme(
          headline: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 60,
            color: Colors.white,
          ),
          body1: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/sorting': (context) => SortingAlgScreen(),
      },
    );
  }
}

// The App will start as a stateful widget
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(children: [
          Divider(
            height: 250,
          ),
          Text(
            'alg.io',
            style: Theme.of(context).textTheme.headline,
          ),
          Divider(height: 20),
          // A button which will progress the app when pressed
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FlatButton(
              color: Colors.white24,
              onPressed: () => displayHomeScreen(context),
              child: Container(
                child: Text(
                  'Continue to App',
                  style: Theme.of(context).textTheme.body1,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  // Takes the app to the home screen
  void displayHomeScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/home');
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _topics = [
    'Sorting Algorithms',
    'Time Complexities',
    'Graphs and Trees',
    'Abstract Data Structures',
    'Design Patterns',
    'More'
  ];

  @override
  Widget build(BuildContext context) {
    TextStyle titleFont = GoogleFonts.ubuntu(
      textStyle: Theme.of(context).textTheme.display1,
      fontSize: 20,
      color: Colors.white,
    );
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
          elevation: 10,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            'alg.io',
            style: titleFont,
          )),
      body: _buildTopics(),
    );
  }

  Widget _buildTopics() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index < _topics.length) {
            return _buildRow(_topics[index]);
          } else {
            return _buildRow('');
          }
        });
  }

  Widget _buildRow(String topic) {
    final bool isEmpty = topic.isEmpty;
    return ListTile(
      title: Text(
        topic,
        style: GoogleFonts.ubuntu(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      trailing: isEmpty
          ? null
          : Icon(
              Icons.send,
              color: Colors.white.withOpacity(0.5),
              size: 20,
            ),
      onTap: () => visitPage(context, topic),
    );
  }

  void visitPage(BuildContext context, String directory) {
    if (directory == 'Sorting Algorithms') {
      Navigator.pushNamed(context, '/sorting');
    }
  }
}

class SortingAlgScreen extends StatefulWidget {
  @override
  _SortingAlgScreenState createState() => _SortingAlgScreenState();
}

class _SortingAlgScreenState extends State<SortingAlgScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Text(
          'Sorting Algorithms coming soon',
          style: Theme.of(context).textTheme.headline,
        ),
      ),
    );
  }
}
