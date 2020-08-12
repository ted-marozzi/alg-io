import 'dart:math';

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

Widget appBar(BuildContext context, String text) {
  TextStyle titleFont = GoogleFonts.ubuntu(
    textStyle: Theme.of(context).textTheme.headline4,
    fontSize: 20,
    color: Colors.white,
  );
  return AppBar(
    elevation: 10,
    backgroundColor: Theme.of(context).backgroundColor,
    title: Text(
      text,
      style: titleFont,
      textAlign: TextAlign.center,
    ),
  );
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
    return ListView(
      physics: ClampingScrollPhysics(),
      children: createTopicsList(_topics),
    );
  }

  List<Widget> createTopicsList(_topics) {
    List<Widget> _topicsWidget = [];
    for (int i = 0; i < _topics.length; i++) {
      _topicsWidget.add(_buildRow(_topics[i]));
    }

    return _topicsWidget;
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
    return ListView(
      physics: ClampingScrollPhysics(),
      children: createTopicsList(_topics),
    );
  }

  List<Widget> createTopicsList(_topics) {
    List<Widget> _topicsWidget = [];
    for (int i = 0; i < _topics.length; i++) {
      _topicsWidget.add(_buildRow(_topics[i]));
    }

    return _topicsWidget;
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

  List<AnimatedBox> animatedBoxes = [];

  List<int> values;

  bool flipFlop;
  double x, y, boxSize = 50;
  int padding = 25, numBoxes = 10, i = 1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeInCirc)
      ..addStatusListener((status) {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height - 2 * (padding + boxSize);

    x = (screenWidth - boxSize) / 2;
    y = (screenHeight) / numBoxes;

    for (var i = 0; i < numBoxes; i++) {
      animatedBoxes.add(AnimatedBox(x, y, i));

      print("Making boxes");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<AnimatedBox> swap(List<AnimatedBox> animatedBoxes, int x, int y) {
    animatedBoxes[x].moveAnimatedBox(y);
    animatedBoxes[y].moveAnimatedBox(x);

    //TODO: Work out how to keep track of array that is being sorted


    return animatedBoxes;
  }
  
  void moveBoxTo(int from, int to)  {
    
    for(var i = 0; i < animatedBoxes.length; i++) {


      if(animatedBoxes[i].pos == from)  {
        animatedBoxes[i].moveAnimatedBox(to);
        break;
      }
    }
       
  }

  void swapBoxes(int box1, int box2)  {
    int tmp;

    for(var i = 0; i < animatedBoxes.length; i++) {

      if(animatedBoxes[i].pos == box1)  {

        for(var j = 0; j < animatedBoxes.length; j++) {
          if(animatedBoxes[j].pos == box2)  {
            moveBoxTo(box2, box1);
            break;
          }
        }

      }
    }

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> boxList =
        animatedBoxes.map((box) => box.getAnimatedBox()).toList();
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: appBar(context, "Merge Sort"),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              
              swapBoxes(2, 3);





              
            });
          },
          child: Icon(Icons.play_arrow),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(children: boxList);
          },
        ));
  }
}

class AnimatedBox {
  int translation = 35;
  int value;
  int pos;
  double boxSize = 50, l, t;
  Widget arrayBox;
  Random rng = new Random();
  int numDigits = 10;

  double x, y;

  Widget animatedBox;

  AnimatedBox(double x, double y, int pos) {
    this.x = x;
    this.y = y;

    this.value = rng.nextInt(numDigits);
    this.boxSize = boxSize;

    this.arrayBox = _makeBox();

    this.pos = pos;
  }

  Widget _makeBox() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: SizedBox(
              width: boxSize,
              height: boxSize,
              child: Center(
                  child: Text(
                value.toString(),
                style: TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontSize: 20),
              )))),
    );
  }

  Widget getAnimatedBox() {

    this.l = x;
    this.t = y * pos + translation;
    animatedBox = AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: t,
      left: l,
      child: arrayBox,
    );

    return animatedBox;
  }

  Widget moveAnimatedBox(int pos) {
    this.pos = pos;
    this.l = x;
    this.t = y * pos + translation;
    animatedBox = AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      top: t,
      left: l,
      child: arrayBox,
    );

    return animatedBox;
  }

  void setValue(int newValue) {
    this.value = value;
  }

  int getValue() {
    return this.value;
  }
}
