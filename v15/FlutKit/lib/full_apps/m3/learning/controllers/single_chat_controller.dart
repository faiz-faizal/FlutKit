import 'package:flutkit/full_apps/m3/learning/models/chat.dart';
import 'package:flutkit/full_apps/m3/learning/models/message.dart';
import 'package:get/get.dart';

class SingleChatController extends GetxController {
  bool showLoading = false, uiLoading = false;

  late Chat chat;

  SingleChatController(this.chat);

  @override
  void onInit() {
    // super.save = false;
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  bool fromMentor(Message message) {
    return message.from.compareTo('mentor') == 0;
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }

  // @override
  // String getTag() {
  //   return "single_chat_controller";
  // }
}
