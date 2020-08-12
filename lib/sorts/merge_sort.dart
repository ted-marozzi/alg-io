import 'package:algo_io_files/util/app_bar.dart';
import 'package:algo_io_files/util/sort_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:algo_io_files/util/sort_model.dart';

class MergeSort extends StatefulWidget {
  MergeSort({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MergeSortState();
}

class _MergeSortState extends State<MergeSort> {
  List<SortModel> numbers = [];
  int numModels = 10;

  Random rng = new Random();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < numModels; i++) {
      numbers.add(SortModel(rng.nextInt(numModels)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Column(children: <Widget>[
      MyAppBar("Merge Sort"),
      Expanded(
        child: Stack(
          children: <Widget>[
            for (var i = 0; i < numbers.length; i++)
              SortWidget(
                key: numbers[i].key,
                number: numbers[i],
                index: i,
                containerWidth: width,
              )
          ],
        ),
      ),
      IconButton(
        icon: Icon(Icons.play_arrow),
        color: Theme.of(context).iconTheme.color,
        iconSize: Theme.of(context).iconTheme.size,
        onPressed: () {

          swap(0, 1);
          setState(() {

          });



        },
      ),
    ]);
  }

  void swap(int i, int j) {
    SortModel tmp = numbers[i];
    numbers[i] = numbers[j];
    numbers[j] = tmp;
  }
}
