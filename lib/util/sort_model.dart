import 'package:flutter/material.dart';

class SortModel {
  SortModel(this.value) : key = UniqueKey();

  final int value;
  final UniqueKey key;
}
