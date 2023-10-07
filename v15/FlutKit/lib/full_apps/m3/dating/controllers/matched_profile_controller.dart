import 'package:flutkit/full_apps/m3/dating/models/profile.dart';
import 'package:flutkit/full_apps/m3/dating/views/home_screen.dart';
import 'package:flutkit/full_apps/m3/dating/views/single_chat_screen.dart';
import 'package:get/get.dart';

class MatchedProfileController extends GetxController {
  Profile profile;

  MatchedProfileController(this.profile);

  bool showLoading = true, uiLoading = true;

  @override
  void onInit() {
    // save = false;
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToHomeScreen() async {
    Get.off(HomeScreen());
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void goToChatScreen() async {
    Get.off(SingleChatScreen(profile));
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => SingleChatScreen(profile)));  }
  }
}
