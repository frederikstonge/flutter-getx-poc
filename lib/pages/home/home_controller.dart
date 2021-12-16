import 'package:get/get.dart';

class HomeController extends GetxController {
  var bottomNavBarIndex = 0.obs;

  void updateIndex(int index) {
    bottomNavBarIndex.value = index;
  }
}
