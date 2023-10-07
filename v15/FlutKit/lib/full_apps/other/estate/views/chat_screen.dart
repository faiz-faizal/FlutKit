// ignore_for_file: sort_child_properties_last

import 'package:flutkit/full_apps/other/estate/controllers/chat_controller.dart';
import 'package:flutkit/full_apps/other/estate/models/chat.dart';
import 'package:flutkit/full_apps/other/estate/views/single_chat_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EstateChatScreen extends StatefulWidget {
  const EstateChatScreen({Key? key}) : super(key: key);

  @override
  _EstateChatScreenState createState() => _EstateChatScreenState();
}

class _EstateChatScreenState extends State<EstateChatScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late EstateChatController estateChatController;

  @override
  void initState() {
    super.initState();
    estateChatController = EstateChatController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(MySpacing.width(16));

    for (Chat chat in estateChatController.chats!) {
      list.add(_buildSingleChat(chat));
    }
    return list;
  }

  Widget _buildSingleChat(Chat chat) {
    return MyContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            builder: (context) => EstateSingleChatScreen(chat)));
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
                  child: Container(),
                  color: customTheme.groceryPrimary,
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
                      color: customTheme.estatePrimary,
                      child: MyText.bodySmall(
                        chat.messages,
                        fontSize: 10,
                        color: customTheme.estateOnPrimary,
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
    return GetBuilder<EstateChatController>(
        init: estateChatController,
        tag: 'estate_chat_controller',
        builder: (estateHomeController) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 2,
                    child: estateHomeController.showLoading
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
    if (estateChatController.uiLoading) {
      return Container(
          margin: MySpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return ListView(
        padding: MySpacing.horizontal(
          24,
        ),
        children: [
          MySpacing.height(16),
          Center(
            child: MyText.bodyLarge(
              'Chats',
              fontWeight: 700,
            ),
          ),
          MySpacing.height(16),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Search your agent',
                hintStyle: MyTextStyle.bodySmall(
                    color: theme.colorScheme.onBackground, xMuted: true),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                filled: true,
                fillColor: customTheme.estatePrimary.withAlpha(40),
                suffixIcon: Icon(
                  LucideIcons.search,
                  color: customTheme.estatePrimary,
                  size: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide.none),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide.none),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide.none),
                contentPadding: MySpacing.all(12)),
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
