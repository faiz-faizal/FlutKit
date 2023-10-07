import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MusicProfileScreen extends StatefulWidget {
  @override
  _MusicProfileScreenState createState() => _MusicProfileScreenState();
}

class _MusicProfileScreenState extends State<MusicProfileScreen> {
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
        body: ListView(
      padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("./assets/images/profile/avatar_4.jpg"),
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.titleMedium("Anisha Preece",
                      fontWeight: 700, letterSpacing: 0),
                  MyText.bodySmall("anisha@shopy.com",
                      fontWeight: 500, letterSpacing: 0.3),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 36),
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyContainer.bordered(
                  borderRadiusAll: 4,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(right: 12),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        LucideIcons.mapPin,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: MyText.bodyMedium("Address", fontWeight: 600))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MyContainer.bordered(
                  borderRadiusAll: 4,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        LucideIcons.creditCard,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 8),
                          child: MyText.bodyMedium("Payment", fontWeight: 600))
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MyContainer.bordered(
                  borderRadiusAll: 4,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        LucideIcons.clipboard,
                        color: theme.colorScheme.onBackground,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: MyText.bodyMedium("History", fontWeight: 600),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 36),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(LucideIcons.heart,
                      size: 22, color: theme.colorScheme.onBackground),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.bodyLarge("Favourite", fontWeight: 600),
                    ),
                  ),
                  Icon(LucideIcons.chevronRight,
                      size: 22, color: theme.colorScheme.onBackground),
                ],
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      LucideIcons.bellRing,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child:
                            MyText.bodyLarge("Notifications", fontWeight: 600),
                      ),
                    ),
                    Icon(LucideIcons.chevronRight,
                        size: 22, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(LucideIcons.eye,
                        size: 22, color: theme.colorScheme.onBackground),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: MyText.bodyLarge("Appearance", fontWeight: 600),
                      ),
                    ),
                    Icon(LucideIcons.chevronRight,
                        size: 22, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(LucideIcons.smile,
                        size: 22, color: theme.colorScheme.onBackground),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child:
                            MyText.bodyLarge("Help & Support", fontWeight: 600),
                      ),
                    ),
                    Icon(LucideIcons.chevronRight,
                        size: 22, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
