import 'package:flutkit/apps/news/news_editor_profile_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleNewsScreen extends StatefulWidget {
  @override
  _SingleNewsScreenState createState() => _SingleNewsScreenState();
}

class _SingleNewsScreenState extends State<SingleNewsScreen> {
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
        body: Padding(
      padding: MySpacing.all(24),
      child: Column(
        children: <Widget>[
          Container(
            margin: MySpacing.top(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: customTheme.card,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: customTheme.shadowColor,
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 4))
                        ]),
                    padding: MySpacing.all(12),
                    child: Icon(
                      LucideIcons.chevronLeft,
                      color: theme.colorScheme.onBackground,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: customTheme.card,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: customTheme.shadowColor,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 4))
                      ]),
                  padding: MySpacing.all(12),
                  child: Icon(
                    LucideIcons.bookmark,
                    color: theme.colorScheme.onBackground,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
              child: ListView(
            padding: MySpacing.fromLTRB(0, 16, 0, 16),
            children: [
              Container(
                decoration: BoxDecoration(
                    color: customTheme.card,
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    boxShadow: [
                      BoxShadow(
                          color: customTheme.shadowColor.withAlpha(120),
                          blurRadius: 24,
                          spreadRadius: 4)
                    ]),
                child: Column(
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: Image(
                        image: AssetImage('./assets/images/all/all-l2.jpg'),
                      ),
                    ),
                    Container(
                      padding: MySpacing.all(16),
                      child: Column(
                        children: [
                          MyText.titleLarge(
                              "14 Passengers Banned By Nona Airlines After bad Behaviour",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsEditorProfileScreen()));
                            },
                            child: Container(
                              margin: MySpacing.top(16),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14)),
                                    child: Image(
                                      image: AssetImage(
                                          './assets/images/profile/avatar_2.jpg'),
                                      height: 28,
                                      width: 28,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  MyText.bodySmall("John smith",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600,
                                      xMuted: true),
                                  Expanded(child: Container()),
                                  MyText.bodySmall("10 Jan, 2020",
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500,
                                      xMuted: true),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: MySpacing.top(24),
                child: MyText(Generator.getParagraphsText(
                    paragraph: 4,
                    words: 30,
                    noOfNewLine: 2,
                    withHyphen: false)),
              ),
            ],
          )),
          Container(
            decoration: BoxDecoration(
                color: customTheme.card,
                boxShadow: [
                  BoxShadow(
                      color: customTheme.shadowColor,
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2))
                ],
                borderRadius: BorderRadius.all(Radius.circular(16))),
            padding: MySpacing.fromLTRB(16, 4, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Write a comment"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.primary.withAlpha(60)),
                  padding: MySpacing.all(8),
                  child: Icon(
                    LucideIcons.send,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
