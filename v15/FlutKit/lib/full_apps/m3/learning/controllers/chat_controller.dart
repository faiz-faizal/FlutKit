import 'package:flutkit/full_apps/m3/learning/models/chat.dart';
import 'package:flutkit/full_apps/m3/learning/models/message.dart';
import 'package:flutkit/full_apps/m3/learning/views/single_chat_screen.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  bool showLoading = true, uiLoading = true;
  List<Chat>? chats;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    chats = await Chat.getDummyList();
    showLoading = false;
    uiLoading = false;
    update();
  }

  int notSeenMessages(List<Message> messages) {
    int count = 0;
    for (int i = messages.length - 1; i > 0; i--) {
      if (messages[i].from.compareTo('mentor') == 0 &&
          messages[i].status.compareTo('seen') != 0) {
        count++;
      }
    }
    return count;
  }

  void goToSingleChatScreen(Chat chat) {
    Get.to(SingleChatScreen(chat));
    // Navigator.of(context, rootNavigator: true)
    //     .push(MaterialPageRoute(builder: (context) => SingleChatScreen(chat)));
  }
}
