import 'dart:math';

import 'package:algo_io_files/util/app_bar.dart';
import 'package:flutter/material.dart';

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
  int padding = 25, numBoxes = 8, i = 1;

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

  void moveBoxTo(int from, int to) {
    for (var i = 0; i < animatedBoxes.length; i++) {
      if (animatedBoxes[i].pos == from) {
        animatedBoxes[i].moveAnimatedBox(to);
        break;
      }
    }
  }

  void swapBoxes(int box1, int box2) {
    for (var i = 0; i < animatedBoxes.length; i++) {
      if (animatedBoxes[i].pos == box1) {
        for (var j = 0; j < animatedBoxes.length; j++) {
          if (animatedBoxes[j].pos == box2) {
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
      //appBar: MyAppBar(context, "Merge Sort"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            swapBoxes(2, 3);
          });
        },
        child: Icon(Icons.play_arrow),
      ),
      body: Column(
        children: <Widget>[
          MyAppBar("Merge Sort"),
          Expanded(child: Stack(children: boxList)),
        ],
      )

    );
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
