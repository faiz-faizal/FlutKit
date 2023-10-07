import 'package:flutkit/full_apps/other/medicare/models/chat.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MediCareSingleChatScreen extends StatefulWidget {
  final Chat chat;

  const MediCareSingleChatScreen(this.chat);

  @override
  _MediCareSingleChatScreenState createState() =>
      _MediCareSingleChatScreenState();
}

class _MediCareSingleChatScreenState extends State<MediCareSingleChatScreen> {
  late Chat chat;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    chat = widget.chat;
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
              color: customTheme.medicarePrimary,
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
                    color: customTheme.medicareOnPrimary,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MyText.bodySmall(
                      time!,
                      fontSize: 10,
                      color: customTheme.medicareOnPrimary,
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
    return Scaffold(
      body: Padding(
        padding: MySpacing.top(28),
        child: Column(
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
                      image: AssetImage(chat.image),
                    ),
                  ),
                  MySpacing.width(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyMedium(
                          chat.name,
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
                      color: customTheme.medicarePrimary,
                      paddingAll: 8,
                      child: Icon(
                        Icons.videocam_rounded,
                        color: customTheme.medicareOnPrimary,
                        size: 16,
                      )),
                  MySpacing.width(8),
                  MyContainer.rounded(
                    color: customTheme.medicarePrimary,
                    paddingAll: 8,
                    child: Icon(
                      Icons.call,
                      color: customTheme.medicareOnPrimary,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(16),
            MyContainer(
              margin: MySpacing.horizontal(40),
              borderRadiusAll: 8,
              color: customTheme.medicarePrimary.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.watch_later,
                    color: customTheme.medicarePrimary,
                    size: 20,
                  ),
                  MySpacing.width(8),
                  MyText.bodySmall(
                    'Sun, Jan 19, 08:00am - 10:00am',
                    color: customTheme.medicarePrimary,
                  ),
                ],
              ),
            ),
            MySpacing.height(16),
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
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  labelText: "Type Something...",
                  hintText: "Type Something...",
                  labelStyle: MyTextStyle.getStyle(
                    color: customTheme.medicarePrimary,
                    fontSize: 14,
                    fontWeight: 600,
                  ),
                  hintStyle: MyTextStyle.getStyle(
                    color: customTheme.medicarePrimary,
                    fontSize: 14,
                    fontWeight: 600,
                  ),
                  fillColor: customTheme.card,
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
                    LucideIcons.send,
                    size: 20,
                  ),
                  prefixIconColor: customTheme.medicarePrimary,
                  focusColor: customTheme.medicarePrimary,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
                cursorColor: customTheme.medicarePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
