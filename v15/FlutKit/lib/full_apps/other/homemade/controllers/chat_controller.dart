import 'package:flutkit/full_apps/other/homemade/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  bool showLoading = true, uiLoading = true;
  List<Chat>? chats;
  late TextEditingController searchController;

  @override
  void onInit() {
    searchController = TextEditingController();
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    chats = await Chat.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }
}
