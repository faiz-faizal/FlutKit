import 'package:flutkit/full_apps/other/estate/controllers/single_chat_controller.dart';
import 'package:flutkit/full_apps/other/estate/models/chat.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EstateSingleChatScreen extends StatefulWidget {
  final Chat chat;

  const EstateSingleChatScreen(this.chat);

  @override
  _EstateSingleChatScreenState createState() => _EstateSingleChatScreenState();
}

class _EstateSingleChatScreenState extends State<EstateSingleChatScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateSingleChatController estateSingleChatController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateSingleChatController = EstateSingleChatController(widget.chat);
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
              //color: customTheme.medicarePrimary.withAlpha(40),
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
                    child: MyText.labelSmall(
                      time!,
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
              color: customTheme.estatePrimary,
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
                    color: customTheme.estateOnPrimary,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyText.labelSmall(
                      time!,
                      color: customTheme.estateOnPrimary,
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
    return GetBuilder<EstateSingleChatController>(
        init: estateSingleChatController,
        tag: 'estate_single_chat_controller',
        builder: (estateSingleChatController) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.top(32),
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                    child: estateSingleChatController.showLoading
                        ? LinearProgressIndicator(
                            color: customTheme.estatePrimary,
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
          );
        });
  }

  Widget _buildBody() {
    if (estateSingleChatController.uiLoading) {
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
                    image: AssetImage(estateSingleChatController.chat.image),
                  ),
                ),
                MySpacing.width(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium(
                        estateSingleChatController.chat.name,
                        fontWeight: 600,
                      ),
                      MySpacing.height(2),
                      Row(
                        children: [
                          MyContainer.rounded(
                            paddingAll: 3,
                            color: customTheme.groceryPrimary,
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
                    color: customTheme.estatePrimary,
                    paddingAll: 8,
                    child: Icon(
                      Icons.videocam_rounded,
                      color: customTheme.estateOnPrimary,
                      size: 16,
                    )),
                MySpacing.width(8),
                MyContainer.rounded(
                  color: customTheme.estatePrimary,
                  paddingAll: 8,
                  child: Icon(
                    Icons.call,
                    color: customTheme.estateOnPrimary,
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
              _buildSendMessage(message: 'Sure, Thank you!!', time: '08:40'),
              MySpacing.height(24),
            ],
          )),
          MyContainer(
            marginAll: 24,
            paddingAll: 0,
            child: TextField(
              decoration: InputDecoration(
                focusColor: customTheme.estatePrimary,
                labelText: 'Type Something ...',
                labelStyle: MyTextStyle.bodySmall(
                    color: theme.colorScheme.onBackground, xMuted: true),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: customTheme.border,
                suffixIcon: Icon(
                  LucideIcons.send,
                  color: customTheme.estatePrimary,
                  size: 20,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: MySpacing.all(8),
              ),
              cursorColor: customTheme.estatePrimary,
            ),
          ),
        ],
      );
    }
  }
}
