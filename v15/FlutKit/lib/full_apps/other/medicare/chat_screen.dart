import 'package:flutkit/full_apps/other/medicare/models/chat.dart';
import 'package:flutkit/full_apps/other/medicare/single_chat_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MediCareChatScreen extends StatefulWidget {
  const MediCareChatScreen({Key? key}) : super(key: key);

  @override
  _MediCareChatScreenState createState() => _MediCareChatScreenState();
}

class _MediCareChatScreenState extends State<MediCareChatScreen> {
  List<Chat> chatList = [];
  late ThemeData theme;
  late CustomTheme customTheme;

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(MySpacing.width(16));

    for (int i = 0; i < chatList.length; i++) {
      list.add(_buildSingleChat(chatList[i]));
    }
    return list;
  }

  @override
  void initState() {
    super.initState();
    chatList = Chat.chatList();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleChat(Chat chat) {
    return MyContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => MediCareSingleChatScreen(chat)));
      },
      margin: MySpacing.bottom(16),
      paddingAll: 16,
      borderRadiusAll: 16,
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
                  color: customTheme.groceryPrimary,
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
                      color: customTheme.medicarePrimary,
                      child: MyText.bodySmall(
                        chat.messages,
                        fontSize: 10,
                        color: customTheme.medicareOnPrimary,
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
    return Scaffold(
      appBar: AppBar(
        title: MyText.bodyLarge(
          'Chats',
          fontWeight: 700,
          letterSpacing: 0.5,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: MySpacing.horizontal(
          24,
        ),
        children: [
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              labelText: "Search, e.g. Dr",
              hintText: "Search, e.g. Dr",
              labelStyle: MyTextStyle.getStyle(
                  color: customTheme.medicarePrimary,
                  fontSize: 12,
                  fontWeight: 600,
                  muted: true),
              hintStyle: MyTextStyle.getStyle(
                  color: customTheme.medicarePrimary,
                  fontSize: 12,
                  fontWeight: 600,
                  muted: true),
              fillColor: customTheme.medicarePrimary.withAlpha(40),
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
              contentPadding: MySpacing.all(16),
              suffixIcon: Icon(
                LucideIcons.search,
                size: 20,
                color: customTheme.medicarePrimary,
              ),
              prefixIconColor: customTheme.medicarePrimary,
              focusColor: customTheme.medicarePrimary,
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            cursorColor: customTheme.medicarePrimary,
            autofocus: false,
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
