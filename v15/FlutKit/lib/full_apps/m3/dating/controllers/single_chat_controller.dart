import 'package:flutkit/full_apps/m3/dating/models/profile.dart';
import 'package:get/get.dart';

class SingleChatController extends GetxController {
  Profile profile;

  SingleChatController(this.profile);

  bool showLoading = true, uiLoading = true;

  @override
  void onInit() {
    // save = false;
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }
}
