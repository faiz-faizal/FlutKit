import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ChatProfileScreen extends StatefulWidget {
  @override
  _ChatProfileScreenState createState() => _ChatProfileScreenState();
}

class _ChatProfileScreenState extends State<ChatProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: MyText.bodyLarge("Account",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: MySpacing.fromLTRB(20, 0, 20, 0),
              child: MyText.bodySmall("REQUESTS",
                  fontWeight: 600,
                  letterSpacing: 0.4,
                  color: theme.colorScheme.onBackground),
            ),
            Container(
              margin: MySpacing.fromLTRB(0, 20, 0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: MySpacing.left(20),
                      child: singleRequest(
                          option: "Block",
                          image: './assets/images/profile/avatar_1.jpg',
                          name: "Sohaib Sumner",
                          status: "Unknown"),
                    ),
                    Container(
                      margin: MySpacing.left(20),
                      child: singleRequest(
                          option: "Accept",
                          image: './assets/images/profile/avatar_3.jpg',
                          name: "Donald Diaz",
                          status: "3 Friend Mutual"),
                    ),
                    Container(
                      margin: MySpacing.left(20),
                      child: singleRequest(
                          option: "Accept",
                          image: './assets/images/profile/avatar_4.jpg',
                          name: "Emilis Fuller",
                          status: "8 Friend Mutual"),
                    ),
                    Container(
                      margin: MySpacing.fromLTRB(20, 0, 20, 0),
                      child: singleRequest(
                          option: "Accept",
                          image: './assets/images/profile/avatar_5.jpg',
                          name: "Farrah Smyth",
                          status: "1 Friend Mutual"),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(20, 20, 20, 0),
              child: MyText.bodySmall("SETTING",
                  fontWeight: 600,
                  letterSpacing: 0.4,
                  color: theme.colorScheme.onBackground),
            ),
            Container(
              margin: MySpacing.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(26)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                      width: 52,
                      height: 52,
                    ),
                  ),
                  Container(
                    margin: MySpacing.left(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyLarge("Rami Wheatley",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        MyText.bodyMedium("I'm using FlutKit",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      LucideIcons.user,
                      color: theme.colorScheme.onBackground,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("Account",
                            fontWeight: 600,
                            letterSpacing: 0,
                            color: theme.colorScheme.onBackground),
                        MyText.bodySmall("Privacy, security, change number",
                            fontWeight: 500,
                            letterSpacing: 0,
                            muted: true,
                            color: theme.colorScheme.onBackground),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.messageSquare,
                      color: theme.colorScheme.onBackground,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("Chats",
                            fontWeight: 600,
                            letterSpacing: 0,
                            color: theme.colorScheme.onBackground),
                        MyText.bodySmall("Theme, wallpapers, chat history",
                            fontWeight: 500,
                            letterSpacing: 0,
                            muted: true,
                            color: theme.colorScheme.onBackground),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.bell,
                      color: theme.colorScheme.onBackground,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("Notifications",
                            fontWeight: 600,
                            letterSpacing: 0,
                            color: theme.colorScheme.onBackground),
                        MyText.bodySmall("Message, group, call tones",
                            fontWeight: 500,
                            letterSpacing: 0,
                            muted: true,
                            color: theme.colorScheme.onBackground),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.helpCircle,
                      color: theme.colorScheme.onBackground,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("Help",
                            fontWeight: 600,
                            letterSpacing: 0,
                            color: theme.colorScheme.onBackground),
                        MyText.bodySmall("FAQ, contact us",
                            fontWeight: 500,
                            letterSpacing: 0,
                            muted: true,
                            color: theme.colorScheme.onBackground),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      LucideIcons.logOut,
                      color: theme.colorScheme.onBackground,
                    ),
                    title: MyText.titleSmall("Logout",
                        fontWeight: 600,
                        letterSpacing: 0,
                        color: theme.colorScheme.onBackground),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Widget singleRequest(
      {required String image,
      required String name,
      required String status,
      required String option}) {
    return MyContainer(
      border: Border.all(color: customTheme.border, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(4)),
      // padding: MySpacing.all(20),
      paddingAll: 16,
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(26)),
              child: Image(
                image: AssetImage(image),
                height: 52,
                width: 52,
              )),
          MySpacing.height(8),
          MyText.bodyMedium(
            name,
            fontSize: 14,
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
          ),
          MyText.bodySmall(
            status,
            fontSize: 12,
            color: theme.colorScheme.onBackground,
            fontWeight: 500,
            muted: true,
          ),
          MySpacing.height(8),
          Padding(
            padding: MySpacing.fromLTRB(10, 6, 10, 6),
            child: MyText.bodyMedium(
              option,
              color: theme.colorScheme.onBackground,
              fontWeight: 500,
            ),
          )
        ],
      ),
    );
  }
}
