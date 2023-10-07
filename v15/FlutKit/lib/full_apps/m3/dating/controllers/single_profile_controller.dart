import 'package:flutkit/full_apps/m3/dating/models/profile.dart';
import 'package:flutkit/full_apps/m3/dating/views/single_chat_screen.dart';
import 'package:get/get.dart';

class SingleProfileController extends GetxController {
  Profile profile;

  SingleProfileController(this.profile);

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

  void goToSingleChatScreen() {
    Get.to(SingleChatScreen(profile));
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => SingleChatScreen(profile)));
  }
}
