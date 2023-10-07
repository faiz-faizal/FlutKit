import 'package:get/get.dart';

class EstateProfileController extends GetxController {
  bool showLoading = true, uiLoading = true;
  @override
  void onInit() {
    // super.save = false;
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }
}
