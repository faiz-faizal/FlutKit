import 'package:flutkit/apps/chat/chat_contact_screen.dart';
import 'package:flutkit/apps/chat/chat_create_group_screen.dart';
import 'package:flutkit/apps/chat/chat_profile_screen.dart';
import 'package:flutkit/apps/chat/chat_screen.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/widgets/custom/full_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class ChatHomeScreen extends StatefulWidget {
  @override
  _ChatHomeScreenState createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
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
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Scaffold(
                body: ListView(
              padding: MySpacing.zero,
              children: <Widget>[
                Container(
                  color: theme.colorScheme.primary,
                  padding: MySpacing.fromLTRB(0, 42, 0, 32),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Container(
                        margin: MySpacing.left(32),
                        child: MyText.headlineSmall("Chats",
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 700),
                      ),
                      Container(
                        margin: MySpacing.top(16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: MySpacing.left(20),
                                child: singleOption(
                                    title: "New Chat",
                                    navigation: ChatContactScreen(),
                                    icon: LucideIcons.plus),
                              ),
                              Container(
                                margin: MySpacing.left(20),
                                child: singleOption(
                                    title: "Groups",
                                    navigation: ChatCreateGroupScreen(),
                                    icon: LucideIcons.users),
                              ),
                              Container(
                                margin: MySpacing.horizontal(20),
                                child: singleOption(
                                    title: "Account",
                                    navigation: ChatProfileScreen(),
                                    icon: LucideIcons.user),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: theme.colorScheme.primary,
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.scaffoldBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16))),
                    padding: MySpacing.all(20),
                    child: Column(
                      children: <Widget>[
                        MyContainer(
                          borderRadiusAll: 4,
                          padding: MySpacing.all(8),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 16),
                                  child: TextFormField(
                                    style: MyTextStyle.bodyMedium(
                                        letterSpacing: 0,
                                        color: theme.colorScheme.onBackground,
                                        fontWeight: 500),
                                    decoration: InputDecoration(
                                      hintText: "Search messages",
                                      hintStyle: MyTextStyle.bodyMedium(
                                          letterSpacing: 0,
                                          color: theme.colorScheme.onBackground,
                                          fontWeight: 500),
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
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                    textInputAction: TextInputAction.search,
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                                child: Icon(
                                  LucideIcons.search,
                                  color: theme.colorScheme.onPrimary,
                                  size: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: MySpacing.top(20),
                          child: singleChat(
                              image: './assets/images/profile/avatar_1.jpg',
                              time: "12:34 AM",
                              badgeNumber: "2",
                              message: Generator.getDummyText(5),
                              isNew: true,
                              name: "Alice Henry",
                              isActive: true),
                        ),
                        Container(
                            margin: MySpacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                            image: './assets/images/profile/avatar_4.jpg',
                            time: "8:12 PM",
                            message: Generator.getDummyText(5),
                            isNew: true,
                            badgeNumber: "4",
                            name: "Jevon Shah"),
                        Container(
                            margin: MySpacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                            image: './assets/images/profile/avatar_3.jpg',
                            isNew: false,
                            time: "5:30 AM",
                            message: Generator.getDummyText(5),
                            name: "Susie Salter"),
                        Container(
                            margin: MySpacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                            image: './assets/images/profile/avatar_2.jpg',
                            isNew: false,
                            time: "1:20 PM",
                            message: Generator.getDummyText(5),
                            name: "Kaylen Lamb",
                            isActive: true),
                        Container(
                            margin: MySpacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                            image: './assets/images/profile/avatar_5.jpg',
                            isNew: false,
                            time: "7:10 AM",
                            message: Generator.getDummyText(5),
                            name: "Joey Callaghan",
                            isActive: true),
                        Container(
                            margin: MySpacing.vertical(16),
                            child: Divider(
                              height: 0,
                            )),
                        singleChat(
                            image: './assets/images/profile/avatar.jpg',
                            isNew: false,
                            time: "7:10 AM",
                            message: Generator.getDummyText(5),
                            name: "Joel Holman"),
                      ],
                    ),
                  ),
                )
              ],
            )));
      },
    );
  }

  void _showFullImage(String imagePath, String imageTag) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => FullImageScreen(
              imagePath: imagePath,
              imageTag: imageTag,
              backgroundOpacity: 200,
            )));
  }

  Widget singleChat(
      {required String image,
      required String name,
      required String message,
      required String time,
      String? badgeNumber,
      bool isNew = false,
      bool isActive = false}) {
    String tag = image + name;

    Widget badgeWidget = badgeNumber == null
        ? Container()
        : Container(
            padding: MySpacing.all(6),
            decoration: BoxDecoration(
                color: theme.colorScheme.primary, shape: BoxShape.circle),
            child: MyText.bodySmall(badgeNumber,
                fontSize: 12, color: theme.colorScheme.onPrimary),
          );

    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Row(
        children: <Widget>[
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(26)),
                child: InkWell(
                  onTap: () {
                    _showFullImage(image, tag);
                  },
                  child: Hero(
                    tag: tag,
                    transitionOnUserGestures: true,
                    child: Image(
                      image: AssetImage(image),
                      height: 52,
                      width: 52,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              isActive
                  ? Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: customTheme.card, width: 2),
                            shape: BoxShape.circle),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                              color: customTheme.colorSuccess,
                              shape: BoxShape.circle),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
          Expanded(
            child: Container(
              margin: MySpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyLarge(name,
                      color: theme.colorScheme.onBackground,
                      fontWeight: isNew ? 600 : 500),
                  MyText.bodyMedium(message,
                      color: theme.colorScheme.onBackground,
                      fontWeight: isNew ? 600 : 500,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ),
          Container(
            margin: MySpacing.left(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                MyText.bodySmall(time,
                    color: theme.colorScheme.onBackground,
                    letterSpacing: -0.2,
                    fontWeight: isNew ? 600 : 500),
                badgeWidget
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget singleOption(
      {IconData? icon, required String title, Widget? navigation}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigation!));
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            color: theme.colorScheme.onPrimary.withAlpha(90),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        padding: MySpacing.fromLTRB(16, 16, 0, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: theme.colorScheme.onPrimary),
              padding: MySpacing.all(2),
              child: Icon(
                icon,
                size: 18,
                color: theme.colorScheme.primary,
              ),
            ),
            Container(
              margin: MySpacing.top(8),
              child:
                  MyText.titleSmall(title, color: theme.colorScheme.onPrimary),
            )
          ],
        ),
      ),
    );
  }
}
