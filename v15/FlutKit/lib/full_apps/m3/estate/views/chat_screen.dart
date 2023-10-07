import 'package:flutkit/full_apps/m3/estate/controllers/chat_controller.dart';
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

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ThemeData theme;
  late ChatController controller;

  @override
  void initState() {
    super.initState();
    controller = ChatController();
    theme = AppTheme.estateTheme;
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(MySpacing.width(16));

    for (Chat chat in controller.chats!) {
      list.add(_buildSingleChat(chat));
    }
    return list;
  }

  Widget _buildSingleChat(Chat chat) {
    return MyContainer(
      onTap: () {
        controller.goToSingleChatScreen(chat);
      },
      margin: MySpacing.bottom(16),
      paddingAll: 16,
      borderRadiusAll: Constant.containerRadius.medium,
      child: Row(
        children: [
          Stack(
            children: [
              MyContainer.rounded(
                paddingAll: 0,
                child: Image(
                  height: 54,
                  width: 54,
                  image: AssetImage(chat.image),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 2,
                child: MyContainer.rounded(
                  paddingAll: 5,
                  color: Colors.green,
                  child: Container(),
                ),
              )
            ],
          ),
          MySpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  chat.name,
                  fontWeight: 600,
                ),
                MySpacing.height(4),
                MyText.bodySmall(
                  chat.chat,
                  xMuted: chat.replied,
                  muted: !chat.replied,
                  fontWeight: chat.replied ? 400 : 600,
                ),
              ],
            ),
          ),
          MySpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyText.bodySmall(
                chat.time,
                fontSize: 10,
                color: theme.colorScheme.onBackground,
                xMuted: true,
              ),
              chat.replied
                  ? MySpacing.height(16)
                  : MyContainer.rounded(
                      paddingAll: 6,
                      color: theme.colorScheme.primary,
                      child: MyText.bodySmall(
                        chat.messages,
                        fontSize: 10,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: controller,
        tag: 'chat_controller',
        builder: (estateHomeController) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Container(
                padding: MySpacing.top(MySpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                      child: estateHomeController.showLoading
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
          child: LoadingEffect.getSearchLoadingScreen(
        context,
      ));
    } else {
      return ListView(
        padding: MySpacing.x(20),
        children: [
          MySpacing.height(16),
          Center(
            child: MyText.bodyLarge(
              'Chats',
              fontWeight: 700,
            ),
          ),
          MySpacing.height(16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Search Your agent...',
              labelStyle: MyTextStyle.bodySmall(
                  color: theme.colorScheme.onPrimaryContainer, xMuted: true),
              focusColor: theme.colorScheme.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Icon(
                LucideIcons.search,
                color: theme.colorScheme.primary,
                size: 20,
              ),
              contentPadding: MySpacing.all(12),
              filled: true,
              fillColor: theme.colorScheme.primaryContainer,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            cursorColor: theme.colorScheme.primary,
          ),
          MySpacing.height(20),
          Column(
            children: _buildChatList(),
          ),
        ],
      );
    }
  }
}
