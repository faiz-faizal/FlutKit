import 'dart:async';
import 'dart:math';

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SocialStatusScreen extends StatefulWidget {
  @override
  _SocialStatusScreenState createState() => _SocialStatusScreenState();
}

class _SocialStatusScreenState extends State<SocialStatusScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    startTimer();
  }

  Timer? _timer;
  int count = 0;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(
        Duration(milliseconds: 50),
        (Timer timer) => setState(() {
              if (count < 200) {
                count++;
              } else {
                count = 200;
                timer.cancel();
              }
            }));
  }

  final List<String> _simpleChoice = [
    "Add new",
    "Find me",
    "Contact",
    "Setting"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: MySpacing.fromLTRB(
                16, MySpacing.safeAreaTop(context) + 20, 16, 0),
            child: LinearProgressIndicator(
              backgroundColor: customTheme.card,
              value: count / 200,
              valueColor: AlwaysStoppedAnimation<Color>(
                  theme.colorScheme.onBackground.withAlpha(120)),
              minHeight: 2.2,
            ),
          ),
          Container(
            margin: MySpacing.fromLTRB(16, 12, 16, 0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image(
                    image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                    width: 38,
                    height: 38,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: MySpacing.left(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MyText.bodyMedium("marcia_hayde",
                                fontWeight: 600,
                                letterSpacing: 0,
                                color: theme.colorScheme.onBackground),
                            Container(
                              margin: MySpacing.left(8),
                              child: MyText.bodySmall("10 min",
                                  fontWeight: 600,
                                  color: theme.colorScheme.onBackground,
                                  xMuted: true),
                            ),
                          ],
                        ),
                        Container(
                          margin: MySpacing.top(2),
                          child: MyText.bodySmall("106 views",
                              xMuted: true, fontSize: 12, fontWeight: 600),
                        )
                      ],
                    ),
                  ),
                ),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return _simpleChoice.map((String choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: MyText.bodyMedium(choice,
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0.2),
                      );
                    }).toList();
                  },
                  color: theme.colorScheme.background,
                  icon: Icon(
                    LucideIcons.moreVertical,
                    color: theme.colorScheme.onBackground,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: MySpacing.vertical(16),
              child: Image(
                image: AssetImage('./assets/images/apps/social/profile-p1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: MySpacing.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: MyTextStyle.bodyMedium(
                        color: theme.colorScheme.onBackground, fontWeight: 500),
                    decoration: InputDecoration(
                        hintText: "Send message",
                        hintStyle: MyTextStyle.bodyMedium(
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide:
                                BorderSide(color: customTheme.card, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide:
                                BorderSide(color: customTheme.card, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide:
                                BorderSide(color: customTheme.card, width: 1)),
                        fillColor: customTheme.card,
                        filled: true,
                        isDense: true,
                        contentPadding: MySpacing.fromLTRB(16, 12, 16, 12)),
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                ),
                Container(
                  margin: MySpacing.left(16),
                  child: Transform.rotate(
                      angle: -pi / 8,
                      child: Icon(
                        LucideIcons.send,
                        color: theme.colorScheme.onBackground,
                        size: 22,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
