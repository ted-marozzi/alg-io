import 'package:algo_io_files/alg_io_library.dart';
import 'package:algo_io_files/sorts/base_sort.dart';
import 'package:flutter/cupertino.dart';

class MergeSort extends BaseSort {
  @override
  void sort() {
    mergeSort(numbers, 0, numbers.length - 1);
  }

  void mergeSort(List<SortModel> numbers, int leftIndex, int rightIndex) async {
    //TODO: Implement merge sort


  }


}
