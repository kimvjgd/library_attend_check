import 'package:get/get.dart';

enum PageName{MAP, CALENDAR, SETTING,}

class EndDrawerController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int value) {
    var page = PageName.values[value];
    switch(page) {
      case PageName.MAP:
      case PageName.CALENDAR:
      case PageName.SETTING:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value) {
    pageIndex(value);
  }
}