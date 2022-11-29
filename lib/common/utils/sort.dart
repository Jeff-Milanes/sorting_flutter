import 'package:sort_app/common/utils/sort/sort_interface.dart';

class SortContext {
  SortContext(this.sortStrategy);

  final SortStrategy sortStrategy;

  String arrange(String str) {
    return sortStrategy.sort(str);
  }
}
