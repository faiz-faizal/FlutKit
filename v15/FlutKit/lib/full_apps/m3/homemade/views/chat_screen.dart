import 'package:flutkit/full_apps/m3/homemade/controllers/chat_controller.dart';
import 'package:flutkit/full_apps/m3/homemade/models/chat.dart';
import 'package:flutkit/full_apps/m3/homemade/views/single_chat_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
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

  late ChatController chatController;

  @override
  void initState() {
    super.initState();
    chatController = ChatController();
    theme = AppTheme.homemadeTheme;
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(MySpacing.width(16));

    for (Chat chat in chatController.chats!) {
      list.add(_buildSingleChat(chat));
    }
    return list;
  }

  Widget _buildSingleChat(Chat chat) {
    return MyContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (context) => SingleChatScreen(chat)));
      },
      margin: MySpacing.bottom(16),
      paddingAll: 16,
      borderRadiusAll: 8,
      child: Row(
        children: [
          Stack(
            children: [
              MyContainer.rounded(
                paddingAll: 0,
                child: Image(
                  height: 54,
                  width: 54,
                  image: AssetImage(chat.url),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 2,
                child: chat.active
                    ? MyContainer.rounded(
                        paddingAll: 5,
                        color: Colors.green,
                        child: Container(),
                      )
                    : Container(),
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
        init: chatController,
        tag: 'chat_controller',
        builder: (chatController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (chatController.uiLoading) {
      return Scaffold(
        backgroundColor: theme.cardTheme.color,
        body: Container(
            margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: MySpacing.fromLTRB(24, 24, 24, 0),
          children: [
            MySpacing.height(16),
            Center(
              child: MyText.displaySmall(
                'Chats',
                fontWeight: 700,
              ),
            ),
            MySpacing.height(16),
            TextFormField(
              controller: chatController.searchController,
              style: MyTextStyle.bodyMedium(
                  color: theme.colorScheme.onPrimaryContainer),
              cursorColor: theme.colorScheme.onPrimaryContainer,
              decoration: InputDecoration(
                hintText: "Search your product",
                hintStyle: MyTextStyle.bodyMedium(
                    color: theme.colorScheme.onPrimaryContainer.withAlpha(150)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: theme.colorScheme.primaryContainer,
                prefixIcon: Icon(
                  LucideIcons.search,
                  size: 20,
                  color: theme.colorScheme.onBackground.withAlpha(150),
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(right: 16),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            MySpacing.height(20),
            Column(
              children: _buildChatList(),
            ),
          ],
        ),
      );
    }
  }
}
