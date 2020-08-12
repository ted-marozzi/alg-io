

import 'package:algo_io_files/util/app_bar.dart';
import 'package:algo_io_files/util/sort_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:algo_io_files/util/sort_model.dart';

class BubbleSort extends StatefulWidget {
  BubbleSort({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BubbleSortState();
}

class _BubbleSortState extends State<BubbleSort> {
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
      MyAppBar("Bubble Sort"),
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

          bubbleSort(numbers);



        },
      ),
    ]);
  }

  void swap(int i, int j) {
    SortModel tmp = numbers[i];
    numbers[i] = numbers[j];
    numbers[j] = tmp;
  }

  void bubbleSort(List<SortModel> numbers) async {
    for(var i =0; i < numbers.length; i++)  {
      for(var j=0; j<numbers.length-i-1; j++)  {
        if(numbers[j].value > numbers[j+1].value) {
          swap(j, j+1);
          render();
          await pause();
        }

      }
    }

  }

  void mergeSort(List<SortModel> numbers) async {

    if(numbers.length > 1)  {
      var mid = numbers.length ~/ 2;
      var left = numbers.sublist(0,mid);
      var right = numbers.sublist(mid);
      mergeSort(left);
      mergeSort(right);

      var i = 0, j = 0, k = 0;

      while(i < left.length && j < right.length) {

        if(left[i].value < right[j].value)  {
          numbers[k] = left[i];

          i++;
        } else{
          numbers[k] = right[j];
          j++;
        }

        render();
        await pause();

        k++;
      }



      while(i<left.length) {
        numbers[k] = left[i];
        i++;
        k++;
      }

      render();
      await pause();

      while(j<right.length) {
        numbers[k] = right[j];
        render();
        j++;
        k++;
      }

      render();
      await pause();


    }

  }



  void render() {


    setState(() {

    });

  }

  Future pause() async {
    var executionSpeed = 600;
    await Future.delayed(Duration(milliseconds: executionSpeed));
  }


}
