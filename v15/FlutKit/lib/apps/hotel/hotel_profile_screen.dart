/*
* File : Hotel Profile
* Version : 1.0.0
* */

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HotelProfileScreen extends StatefulWidget {
  @override
  _HotelProfileScreenState createState() => _HotelProfileScreenState();
}

class _HotelProfileScreenState extends State<HotelProfileScreen> {
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
      padding: EdgeInsets.only(
          top: MySpacing.safeAreaTop(context) + 20, left: 16, right: 16),
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: MyContainer(
            padding: EdgeInsets.all(12),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    "./assets/images/profile/avatar_2.jpg",
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.titleLarge(
                        "Milton Garcia",
                        fontWeight: 600,
                        letterSpacing: 0,
                        fontSize: 20,
                      ),
                      MyText.bodyLarge(
                        "mile@gmail.com",
                        fontSize: 12,
                        fontWeight: 600,
                        letterSpacing: 0.2,
                        xMuted: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        MySpacing.height(20),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            children: <Widget>[
              MyContainer.bordered(
                color: Colors.transparent,
                padding:
                    EdgeInsets.only(top: 12, bottom: 16, left: 16, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child:
                          MyText.titleMedium("My Information", fontWeight: 500),
                    ),
                    Icon(LucideIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
              MySpacing.height(20),
              MyContainer.bordered(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: MyText.titleMedium("My Booking", fontWeight: 500),
                    ),
                    Icon(LucideIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
              MySpacing.height(20),
              MyContainer.bordered(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child:
                          MyText.titleMedium("Payment Method", fontWeight: 500),
                    ),
                    Icon(LucideIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
              MySpacing.height(20),
              MyContainer.bordered(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: MyText.titleMedium("Setting", fontWeight: 500),
                    ),
                    Icon(LucideIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
              MySpacing.height(20),
              MyContainer.bordered(
                color: Colors.transparent,
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: MyText.titleMedium("Logout", fontWeight: 600),
                    ),
                    Icon(LucideIcons.chevronRight,
                        size: 24, color: theme.colorScheme.onBackground),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
