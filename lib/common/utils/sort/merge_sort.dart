import 'package:sort_app/common/utils/sort/sort_interface.dart';

class MergeSort implements SortStrategy {
  @override
  String sort(String str) {
    final List<String> lists = str.split('');
    final List<String> sortedList = _mergeSort(lists);
    return sortedList.join('');
  }

  List<String> _mergeSort(List<String> list) {
    if (list.length <= 1) {
      return list;
    }

    final int middle = (list.length / 2).floor();
    final List<String> left = list.sublist(0, middle);
    final List<String> right = list.sublist(middle);

    return _merge(_mergeSort(left), _mergeSort(right));
  }

  List<String> _merge(List<String> left, List<String> right) {
    List<String> result = [];

    while (left.isNotEmpty && right.isNotEmpty) {
      if (left.first.compareTo(right.first) <= 0) {
        result.add(left.first);
        left.removeAt(0);
      } else {
        result.add(right.first);
        right.removeAt(0);
      }
    }

    while (left.isNotEmpty) {
      result.add(left.first);
      left.removeAt(0);
    }

    while (right.isNotEmpty) {
      result.add(right.first);
      right.removeAt(0);
    }

    return result;
  }
}
