import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutx/flutx.dart';

import '../controllers/single_chat_controller.dart';
import '../models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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
    estateSingleChatController =
        FxControllerStore.putOrFind(EstateSingleChatController(widget.chat));
  }

  Widget _buildReceiveMessage({String? message, String? time}) {
    return Padding(
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: FxContainer(
              //color: customTheme.medicarePrimary.withAlpha(40),
              margin: FxSpacing.right(140),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodySmall(
                    message!,
                    color: theme.colorScheme.onBackground,
                    xMuted: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.labelSmall(
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
      padding: FxSpacing.horizontal(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: FxContainer(
              color: customTheme.estatePrimary,
              margin: FxSpacing.left(140),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FxText.bodySmall(
                    message!,
                    color: customTheme.estateOnPrimary,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FxText.labelSmall(
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
    return FxBuilder<EstateSingleChatController>(
        controller: estateSingleChatController,
        builder: (estateSingleChatController) {
          return Scaffold(
            body: Padding(
              padding: FxSpacing.top(32),
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
          margin: FxSpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return Column(
        children: [
          FxContainer(
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
                FxSpacing.width(8),
                FxContainer.rounded(
                  paddingAll: 0,
                  child: Image(
                    width: 40,
                    height: 40,
                    image: AssetImage(estateSingleChatController.chat.image),
                  ),
                ),
                FxSpacing.width(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FxText.bodyMedium(
                        estateSingleChatController.chat.name,
                        fontWeight: 600,
                      ),
                      FxSpacing.height(2),
                      Row(
                        children: [
                          FxContainer.rounded(
                            paddingAll: 3,
                            color: customTheme.groceryPrimary,
                            child: Container(),
                          ),
                          FxSpacing.width(4),
                          FxText.bodySmall(
                            'Online',
                            color: theme.colorScheme.onBackground,
                            xMuted: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                FxSpacing.width(16),
                FxContainer.rounded(
                    color: customTheme.estatePrimary,
                    paddingAll: 8,
                    child: Icon(
                      Icons.videocam_rounded,
                      color: customTheme.estateOnPrimary,
                      size: 16,
                    )),
                FxSpacing.width(8),
                FxContainer.rounded(
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
              FxSpacing.height(16),
              _buildSendMessage(
                  message: 'Should I come to hospital tomorrow?',
                  time: '08:30'),
              FxSpacing.height(16),
              _buildReceiveMessage(
                  message: 'Yes sure, you can come after 2:00 pm',
                  time: '08:35'),
              FxSpacing.height(16),
              _buildSendMessage(message: 'Sure, Thank you!!', time: '08:40'),
              FxSpacing.height(24),
            ],
          )),
          FxContainer(
            marginAll: 24,
            paddingAll: 0,
            child: FxTextField(
              focusedBorderColor: customTheme.estatePrimary,
              cursorColor: customTheme.estatePrimary,
              textFieldStyle: FxTextFieldStyle.outlined,
              labelText: 'Type Something ...',
              labelStyle: FxTextStyle.bodySmall(
                  color: theme.colorScheme.onBackground, xMuted: true),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              filled: true,
              fillColor: customTheme.border,
              suffixIcon: Icon(
                FeatherIcons.send,
                color: customTheme.estatePrimary,
                size: 20,
              ),
            ),
          ),
        ],
      );
    }
  }
}
