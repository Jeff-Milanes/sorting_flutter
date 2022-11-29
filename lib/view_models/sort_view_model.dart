import 'package:flutter/material.dart';
import 'package:sort_app/common/utils/sort.dart';
import 'package:sort_app/common/utils/sort/bubble_sort.dart';
import 'package:sort_app/common/utils/sort/merge_sort.dart';
import 'package:sort_app/models/sort_model.dart';

class SortViewModel extends ChangeNotifier {
  String _textfieldString = '';
  SortModel _currentSort = SortModel.mergeSort;

  String get textfieldString => _textfieldString;

  setTextFieldString(String value) {
    if (currentSort == SortModel.mergeSort) {
      SortContext ctx = SortContext(MergeSort());
      _textfieldString = ctx.arrange(value);
    } else if (currentSort == SortModel.bubbleSort) {
      SortContext ctx = SortContext(BubbleSort());
      _textfieldString = ctx.arrange(value);
    } else {
      _textfieldString = value;
    }
    notifyListeners();
  }

  SortModel get currentSort => _currentSort;

  setCurrentSort(SortModel currentSort) {
    _currentSort = currentSort;
    notifyListeners();
  }
}
