import 'package:sort_app/common/utils/sort/sort_interface.dart';

class BubbleSort implements SortStrategy {
  @override
  String sort(String str) {
    final List<String> lists = str.split('');
    final List<String> sortedList = _bubbleSort(lists);
    return sortedList.join('');
  }

  List<String> _bubbleSort(List<String> string) {
    for (int i = 0; i < string.length; i++) {
      for (int j = 0; j < string.length - i - 1; j++) {
        if (string[j].compareTo(string[j + 1]) > 0) {
          final String temp = string[j];
          string[j] = string[j + 1];
          string[j + 1] = temp;
        }
      }
    }
    return string;
  }
}
