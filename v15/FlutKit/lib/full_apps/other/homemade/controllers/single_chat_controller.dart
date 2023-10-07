import 'package:flutkit/full_apps/other/homemade/models/chat.dart';
import 'package:get/get.dart';

class SingleChatController extends GetxController {
  bool showLoading = true, uiLoading = true;

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
}
