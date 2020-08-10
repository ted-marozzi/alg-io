import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(AlgIO());
}

Widget appBar(BuildContext context, String text) {
  TextStyle titleFont = GoogleFonts.ubuntu(
    textStyle: Theme.of(context).textTheme.headline4,
    fontSize: 20,
    color: Colors.white,
  );
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: AppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).backgroundColor,
        title: SafeArea(
          child: Text(
            text,
            style: titleFont,
            textAlign: TextAlign.center,
          ),
        )),
  );
}

class AlgIO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Color.fromARGB(100, 56, 99, 168),
        textTheme: TextTheme(
          headline5: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 60,
            color: Colors.white,
          ),
          bodyText1: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        '/': (context) => WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/sorting': (context) => SortingAlgScreen(),
        '/mergeSort': (context) => AnimatedMergeSort(),
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
            style: Theme.of(context).textTheme.headline5,
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
                  style: Theme.of(context).textTheme.bodyText1,
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context, "Algorithms and Data Structures"),
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
          textStyle: Theme.of(context).textTheme.headline4,
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
  final _topics = [
    'Merge Sort',
    'Quick Sort',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(context, "Sorting Algorithms"),
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
          textStyle: Theme.of(context).textTheme.headline4,
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
    if (directory == 'Merge Sort') {
      Navigator.pushNamed(context, '/mergeSort');
    }
  }
}

class AnimatedMergeSort extends StatefulWidget {
  AnimatedMergeSort({Key key}) : super(key: key);

  @override
  _AnimatedMergeSortState createState() => _AnimatedMergeSortState();
}

class _AnimatedMergeSortState extends State<AnimatedMergeSort>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController _controller;

  List<Widget> arrayBoxes = [];
  Random rng = new Random();

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear)
      ..addStatusListener((status) {});
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  bool top = false;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double boxWidth = 75;
    double padding = 100;



    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar(context, "Merge Sort"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (top) {

                _controller.forward();
                print("Forward");
                top = false;
              } else {

                _controller.reverse();
                print("Reverse");
                top = true;
              }

            });
          },
          child: Icon(Icons.play_arrow),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final Size biggest = constraints.biggest;
            return Stack(
              children: [
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromSize(
                        Rect.fromLTWH((screenWidth - boxWidth) / 2, padding,
                            boxWidth, boxWidth),
                        biggest),
                    end: RelativeRect.fromSize(
                        Rect.fromLTWH((screenWidth - boxWidth) / 2, screenHeight - boxWidth - padding,
                            boxWidth, boxWidth),
                        biggest),
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Curves.linear,
                  )),
                  child: Padding(
                      padding: const EdgeInsets.all(8), child: arrayBox(0)),
                ),
              ],
            );
          },
        ));
  }

  Widget arrayBox(int i) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: SizedBox(
              width: 75,
              height: 75,
              child: Center(
                  child: Text(
                i.toString(),
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 20),
              )))),
    );
  }
}
