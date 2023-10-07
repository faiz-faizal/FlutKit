import 'package:flutkit/full_apps/other/dating/models/profile.dart';
import 'package:get/get.dart';

class DatingSingleChatController extends GetxController {
  Profile profile;

  DatingSingleChatController(this.profile);

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
