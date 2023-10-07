import 'package:flutkit/full_apps/m3/learning/controllers/chat_controller.dart';
import 'package:flutkit/full_apps/m3/learning/models/chat.dart';
import 'package:flutkit/helpers/localizations/language.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
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
    theme = AppTheme.learningTheme;
    controller = ChatController();
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

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
      margin: MySpacing.nTop(20),
      paddingAll: 20,
      borderRadiusAll: Constant.containerRadius.medium,
      // color: theme.colorScheme.primaryContainer,
      child: Row(
        children: [
          Stack(
            children: [
              MyContainer.rounded(
                paddingAll: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                  image: AssetImage(chat.mentor.image),
                ),
              ),
              Positioned(
                right: Language.autoDirection(4),
                left: Language.autoDirection(null, 4),
                bottom: 2,
                child: MyContainer.rounded(
                  paddingAll: 5,
                  color: Colors.green,
                  child: Container(),
                ),
              )
            ],
          ),
          MySpacing.width(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  chat.mentor.name,
                  fontWeight: 600,
                ),
                MySpacing.height(4),
                MyText.bodySmall(
                  chat.messages.last.text,
                  xMuted: controller.notSeenMessages(chat.messages) == 0,
                  fontWeight: controller.notSeenMessages(chat.messages) == 0
                      ? 400
                      : 600,
                ),
              ],
            ),
          ),
          MySpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MyText.bodySmall(
                chat.messages.last.time,
                color: theme.colorScheme.onBackground,
                xMuted: true,
                fontSize: 10,
              ),
              controller.notSeenMessages(chat.messages) == 0
                  ? MySpacing.height(20)
                  : MyContainer.rounded(
                      margin: MySpacing.top(4),
                      paddingAll: 6,
                      color: theme.colorScheme.primary,
                      child: MyText.bodySmall(
                        controller.notSeenMessages(chat.messages).toString(),
                        color: theme.colorScheme.onPrimary,
                        fontSize: 10,
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
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: LoadingEffect.getSearchLoadingScreen(
          context,
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: MySpacing.x(20),
              child: TextFormField(
                style: MyTextStyle.bodyMedium(),
                cursorColor: theme.colorScheme.onBackground,
                decoration: InputDecoration(
                  hintText: "Search ...",
                  hintStyle: MyTextStyle.bodySmall(
                      color: theme.colorScheme.onBackground),
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
                  filled: true,
                  fillColor: theme.colorScheme.primaryContainer,
                  prefixIcon: Icon(
                    LucideIcons.search,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                  isDense: true,
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
            MySpacing.height(20),
            Expanded(
              child: ListView(
                padding: MySpacing.zero,
                children: _buildChatList(),
              ),
            ),
            Container(
              padding: MySpacing.all(20),
              child: MyButton.block(
                backgroundColor: theme.colorScheme.primary,
                borderRadiusAll: Constant.buttonRadius.large,
                elevation: 0,
                padding: MySpacing.y(20),
                splashColor: theme.colorScheme.onPrimary.withAlpha(28),
                onPressed: () {},
                child: MyText.labelMedium(
                  'New Message',
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
