import 'package:flutkit/helpers/extensions/widgets_extension.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ShoppingProfileScreen extends StatefulWidget {
  @override
  _ShoppingProfileScreenState createState() => _ShoppingProfileScreenState();
}

class _ShoppingProfileScreenState extends State<ShoppingProfileScreen> {
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
      padding:
          MySpacing.fromLTRB(20, MySpacing.safeAreaTop(context) + 20, 20, 0),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
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
              MySpacing.width(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.titleMedium("Anisha Preece",
                        fontWeight: 700, letterSpacing: 0),
                    MyText.bodySmall("anisha@shopy.com",
                        fontWeight: 600, letterSpacing: 0.3),
                  ],
                ),
              ),
              Container(
                child: Icon(
                  LucideIcons.chevronRight,
                  color: theme.colorScheme.onBackground,
                ).autoDirection(),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Row(
            children: <Widget>[
              buildModuleCard(LucideIcons.mapPin, 'Address'),
              MySpacing.width(20),
              buildModuleCard(LucideIcons.creditCard, 'Payment'),
              MySpacing.width(20),
              buildModuleCard(LucideIcons.clipboardList, 'History'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(LucideIcons.heart,
                      size: 22, color: theme.colorScheme.onBackground),
                  MySpacing.width(20),
                  Expanded(
                    child: MyText.bodyLarge("Favourite", fontWeight: 600),
                  ),
                  Container(
                    child: Icon(LucideIcons.chevronRight,
                            size: 22, color: theme.colorScheme.onBackground)
                        .autoDirection(),
                  ),
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
                    MySpacing.width(20),
                    Expanded(
                      child: MyText.bodyLarge("Notifications", fontWeight: 600),
                    ),
                    Container(
                      child: Icon(LucideIcons.chevronRight,
                              size: 22, color: theme.colorScheme.onBackground)
                          .autoDirection(),
                    ),
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
                    MySpacing.width(20),
                    Expanded(
                      child: MyText.bodyLarge("Appearance", fontWeight: 600),
                    ),
                    Container(
                      child: Icon(LucideIcons.chevronRight,
                              size: 22, color: theme.colorScheme.onBackground)
                          .autoDirection(),
                    ),
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
                    MySpacing.width(20),
                    Expanded(
                      child:
                          MyText.bodyLarge("Help & Support", fontWeight: 600),
                    ),
                    Container(
                      child: Icon(LucideIcons.chevronRight,
                              size: 22, color: theme.colorScheme.onBackground)
                          .autoDirection(),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 24, bottom: 8),
                child: Center(
                  child: MyText.bodyMedium("More screens are coming soon...",
                      fontWeight: 500),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget buildModuleCard(IconData icons, String cardName) {
    return Expanded(
      child: MyContainer.bordered(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Icon(
              icons,
              color: theme.colorScheme.onBackground,
            ),
            Container(
                margin: EdgeInsets.only(top: 8),
                child: MyText.labelMedium(cardName, fontWeight: 600))
          ],
        ),
      ),
    );
  }
}
