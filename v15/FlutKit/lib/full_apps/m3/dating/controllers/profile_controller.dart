import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool showLoading = true, uiLoading = true;

  @override
  void onInit() {
    super.onInit();
    // save = false;
    fetchData();
  }

  void fetchData() async {
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }
}
