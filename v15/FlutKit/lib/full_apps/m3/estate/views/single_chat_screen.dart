import 'package:flutkit/full_apps/m3/estate/controllers/single_chat_controller.dart';
import 'package:flutkit/full_apps/m3/estate/models/chat.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
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
  late SingleChatController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
    controller = SingleChatController(widget.chat);
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
              color: theme.colorScheme.primaryContainer,
              margin: MySpacing.right(140),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Constant.containerRadius.medium),
                  bottomRight: Radius.circular(Constant.containerRadius.medium),
                  bottomLeft: Radius.circular(Constant.containerRadius.medium)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyText.bodySmall(
                    message!,
                    color: theme.colorScheme.onPrimaryContainer,
                    xMuted: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyText.bodySmall(
                      time!,
                      fontSize: 10,
                      color: theme.colorScheme.onPrimaryContainer,
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
                  topLeft: Radius.circular(Constant.containerRadius.medium),
                  bottomRight: Radius.circular(Constant.containerRadius.medium),
                  bottomLeft: Radius.circular(Constant.containerRadius.medium)),
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
        init: controller,
        tag: 'single_chat_controller',
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Padding(
                padding: MySpacing.top(MySpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                      child: controller.showLoading
                          ? LinearProgressIndicator(
                              color: theme.colorScheme.primary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Container(
          margin: MySpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return Column(
        children: [
          MyContainer(
            color: theme.scaffoldBackgroundColor,
            child: Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                MySpacing.width(8),
                MyContainer.rounded(
                  paddingAll: 0,
                  child: Image(
                    width: 40,
                    height: 40,
                    image: AssetImage(controller.chat.image),
                  ),
                ),
                MySpacing.width(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium(
                        controller.chat.name,
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
                  message: 'Should I come to meet you tomorrow?',
                  time: '08:30'),
              MySpacing.height(16),
              _buildReceiveMessage(
                  message: 'Yes sure, you can come after 2:00 pm',
                  time: '08:35'),
              MySpacing.height(16),
              _buildSendMessage(message: 'Sure, Thank you!!', time: '08:40'),
              MySpacing.height(24),
            ],
          )),
          MyContainer(
            marginAll: 24,
            paddingAll: 0,
            borderRadiusAll: Constant.containerRadius.medium,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Type Something...",
                hintStyle: MyTextStyle.bodySmall(
                    color: theme.colorScheme.primary, xMuted: true),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: theme.colorScheme.primaryContainer,
                suffixIcon: Icon(
                  LucideIcons.send,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: MySpacing.all(12),
              ),
              cursorColor: theme.colorScheme.primary,
            ),
          ),
        ],
      );
    }
  }
}
