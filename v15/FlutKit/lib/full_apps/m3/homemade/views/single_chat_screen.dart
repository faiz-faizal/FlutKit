import 'package:flutkit/full_apps/m3/homemade/controllers/single_chat_controller.dart';
import 'package:flutkit/full_apps/m3/homemade/models/chat.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleChatScreen extends StatefulWidget {
  final Chat chat;

  const SingleChatScreen(this.chat);

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ThemeData theme;
  late SingleChatController singleChatController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.homemadeTheme;
    singleChatController = SingleChatController(widget.chat);
  }

  Widget _buildReceiveMessage({String? message, String? time}) {
    return Padding(
      padding: MySpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: MyContainer(
              margin: MySpacing.right(140),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.bodySmall(
                    message!,
                    color: theme.colorScheme.onBackground,
                    xMuted: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyText.bodySmall(
                      time!,
                      fontSize: 10,
                      color: theme.colorScheme.onBackground,
                      xMuted: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSendMessage({String? message, String? time}) {
    return Padding(
      padding: MySpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: MyContainer(
              color: theme.colorScheme.primary,
              margin: MySpacing.left(140),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.bodySmall(
                    message!,
                    color: theme.colorScheme.onPrimary,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyText.bodySmall(
                      time!,
                      fontSize: 10,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleChatController>(
        init: singleChatController,
        tag: 'single_chat_controller',
        builder: (singleChatController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (singleChatController.uiLoading) {
      return Scaffold(
        body: Container(
            margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(32),
          child: Column(
            children: [
              MyContainer(
                color: theme.scaffoldBackgroundColor,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            LucideIcons.chevronLeft,
                            size: 20,
                            color: theme.colorScheme.onBackground,
                          ),
                          MySpacing.width(4),
                          MyContainer.rounded(
                            paddingAll: 0,
                            child: Image(
                              width: 40,
                              height: 40,
                              image: AssetImage(
                                singleChatController.chat.url,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    MySpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyMedium(
                            singleChatController.chat.name,
                            fontWeight: 600,
                          ),
                          MySpacing.height(2),
                          Row(
                            children: [
                              MyContainer.rounded(
                                paddingAll: 3,
                                color: Colors.green,
                                child: Container(),
                              ),
                              MySpacing.width(4),
                              MyText.bodySmall(
                                'Online',
                                color: theme.colorScheme.onBackground,
                                xMuted: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    MySpacing.width(16),
                    MyContainer.rounded(
                        color: theme.colorScheme.primary,
                        paddingAll: 8,
                        child: Icon(
                          Icons.videocam_rounded,
                          color: theme.colorScheme.onPrimary,
                          size: 16,
                        )),
                    MySpacing.width(8),
                    MyContainer.rounded(
                      color: theme.colorScheme.primary,
                      paddingAll: 8,
                      child: Icon(
                        Icons.call,
                        color: theme.colorScheme.onPrimary,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  _buildReceiveMessage(
                      message: 'Yes, What help do you need?', time: '08:25'),
                  MySpacing.height(16),
                  _buildSendMessage(
                      message: 'Should I come to hospital tomorrow?',
                      time: '08:30'),
                  MySpacing.height(16),
                  _buildReceiveMessage(
                      message: 'Yes sure, you can come after 2:00 pm',
                      time: '08:35'),
                  MySpacing.height(16),
                  _buildSendMessage(
                      message: 'Sure, Thank you!!', time: '08:40'),
                  MySpacing.height(24),
                ],
              )),
              MyContainer(
                marginAll: 24,
                paddingAll: 0,
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Type Something...",
                    hintText: "Type Something...",
                    labelStyle: MyTextStyle.getStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 14,
                      fontWeight: 600,
                    ),
                    hintStyle: MyTextStyle.getStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 14,
                      fontWeight: 600,
                    ),
                    fillColor: theme.colorScheme.primaryContainer,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        borderSide: BorderSide.none),
                    contentPadding: MySpacing.all(16),
                    suffixIcon: Icon(
                      LucideIcons.send,
                      size: 20,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                    prefixIconColor: theme.colorScheme.primary,
                    focusColor: theme.colorScheme.primary,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  cursorColor: theme.colorScheme.primary,
                  autofocus: true,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
