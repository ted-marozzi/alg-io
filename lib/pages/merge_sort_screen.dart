import 'dart:math';

import 'package:algo_io_files/util/app_bar.dart';
import 'package:algo_io_files/util/sort_model.dart';
import 'package:algo_io_files/util/sort_widget.dart';
import 'package:flutter/material.dart';


class MergeSortScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SortModel> numbers = [];
    int numModels = 10;

    Random rng = new Random();
    for(var i = 0; i <  numModels; i++) {
      numbers.add(SortModel(rng.nextInt(numModels)));
    }


    final double width = MediaQuery.of(context).size.width;



    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.play_arrow),
        ),
        body: Column(
          children: <Widget>[
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

          ],
        ));
  }
}

