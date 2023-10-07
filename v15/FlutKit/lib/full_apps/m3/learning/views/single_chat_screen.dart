import 'package:flutkit/full_apps/m3/learning/controllers/single_chat_controller.dart';
import 'package:flutkit/full_apps/m3/learning/models/chat.dart';
import 'package:flutkit/full_apps/m3/learning/models/message.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
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

  const SingleChatScreen(
    this.chat, {
    Key? key,
  }) : super(key: key);

  @override
  _SingleChatScreenState createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ThemeData theme;
  late SingleChatController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = SingleChatController(widget.chat);
  }

  Widget _buildMessageList() {
    List<Widget> list = [];
    for (int i = 0; i < controller.chat.messages.length; i++) {
      list.add(_buildSingleMessage(controller.chat.messages[i]));
    }
    return ListView(
      padding: MySpacing.x(20),
      children: list,
    );
  }

  Widget _buildSingleMessage(Message message) {
    bool isMentor = controller.fromMentor(message);
    return Align(
      alignment: isMentor ? Alignment.centerLeft : Alignment.centerRight,
      child: MyContainer(
        color: isMentor
            ? theme.colorScheme.primaryContainer
            : theme.colorScheme.secondaryContainer,
        paddingAll: 12,
        borderRadiusAll: Constant.containerRadius.large,
        margin: MySpacing.y(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText.bodySmall(
              message.text,
              color: isMentor
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground,
            ),
            MySpacing.width(8),
            MyText.bodySmall(
              message.time,
              xMuted: true,
              fontWeight: 600,
              fontSize: 10,
              color: isMentor
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleChatController>(
        init: controller,
        tag: 'single_chat_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          child: Column(
            children: [
              Padding(
                padding: MySpacing.x(20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.goBack();
                      },
                      child: Icon(
                        LucideIcons.chevronLeft,
                        size: 20,
                        color: theme.colorScheme.onBackground,
                      ).autoDirection(),
                    ),
                    MySpacing.width(16),
                    MyContainer.rounded(
                      paddingAll: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                        image: AssetImage(controller.chat.mentor.image),
                      ),
                    ),
                    MySpacing.width(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyMedium(
                          controller.chat.mentor.name,
                          fontWeight: 600,
                        ),
                        MySpacing.height(4),
                        MyText.bodySmall(
                          controller.chat.mentor.position,
                          muted: true,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(8),
              Divider(),
              Expanded(child: _buildMessageList()),
              Padding(
                padding: MySpacing.nTop(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Constant.containerRadius.large),
                        ),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Constant.containerRadius.large),
                        ),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Constant.containerRadius.large),
                        ),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0)),
                    labelText: 'Send a Message ...',
                    labelStyle: MyTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground, xMuted: true),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: theme.colorScheme.primaryContainer,
                    suffixIcon: Icon(
                      LucideIcons.send,
                      color: theme.colorScheme.primary,
                      size: 20,
                    ),
                    focusColor: Colors.transparent,
                  ),
                  cursorColor: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
