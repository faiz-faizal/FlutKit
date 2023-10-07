import 'package:get/get.dart';

class RadialMenuController extends GetxController {
  bool opened = false;

  void close() {
    opened = false;
    update();
  }

  void open() {
    opened = true;
    update();
  }
}
