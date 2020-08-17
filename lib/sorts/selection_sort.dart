import 'package:algo_io_files/sorts/base_sort.dart';

class SelectionSort extends BaseSort {
  @override
  void sort() async {
    var min, mIndex;
    bool minAssigned = false;
    for (var i = 0; i < numbers.length; i++) {
      for (var j = i; j < numbers.length; j++) {
        if (minAssigned) {
          if (numbers[j].value < min) {
            min = numbers[j].value;
            mIndex = j;
          }
        } else {
          min = numbers[j].value;
          mIndex = j;
          minAssigned = true;
        }
      }
      print('Placing ${numbers[mIndex].value}, index $i\n');
      swap(i, mIndex, numbers);

      render();
      await pause();
      minAssigned = false;
    }
  }
}
