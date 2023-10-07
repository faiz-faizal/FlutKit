import 'package:flutkit/full_apps/m3/estate/models/chat.dart';
import 'package:flutkit/full_apps/m3/estate/views/single_chat_screen.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  bool showLoading = true, uiLoading = true;
  List<Chat>? chats;

  @override
  void onInit() {
    // super.save = false;
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    chats = await Chat.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleChatScreen(Chat chat) {
    Get.to(SingleChatScreen(chat));
    // Navigator.of(context, rootNavigator: true)
    //     .push(MaterialPageRoute(builder: (context) => SingleChatScreen(chat)));
  }
}
