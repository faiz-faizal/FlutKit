import 'package:flutkit/full_apps/other/estate/models/chat.dart';
import 'package:get/get.dart';

class EstateSingleChatController extends GetxController {
  bool showLoading = true, uiLoading = true;

  late Chat chat;

  EstateSingleChatController(this.chat);

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
