/*
* File : Basic Setting
* Version : 1.0.0
* */

import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BasicSettingScreen extends StatefulWidget {
  @override
  _BasicSettingScreenState createState() => _BasicSettingScreenState();
}

class _BasicSettingScreenState extends State<BasicSettingScreen> {
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
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          centerTitle: true,
          title: MyText.titleLarge("Setting", fontWeight: 600),
        ),
        backgroundColor: theme.colorScheme.background,
        body: ListView(
          padding: MySpacing.nTop(20),
          children: <Widget>[
            TextFormField(
              style: MyTextStyle.bodyLarge(
                  letterSpacing: 0.1, color: theme.colorScheme.onBackground),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: MyTextStyle.titleSmall(
                    letterSpacing: 0.1, color: theme.colorScheme.onBackground),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: customTheme.card,
                prefixIcon: Icon(LucideIcons.search,
                    size: 22,
                    color: Theme.of(context).colorScheme.onBackground),
                isDense: true,
                contentPadding: EdgeInsets.all(0),
              ),
              keyboardType: TextInputType.emailAddress,
              textCapitalization: TextCapitalization.sentences,
            ),
            MySpacing.height(12),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(LucideIcons.userCog,
                      size: 24, color: theme.colorScheme.onBackground),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.titleMedium("Account", fontWeight: 600),
                    ),
                  ),
                  Icon(LucideIcons.chevronRight,
                      size: 24, color: theme.colorScheme.onBackground),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
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
                          MyText.titleMedium("Notifications", fontWeight: 600),
                    ),
                  ),
                  Icon(LucideIcons.chevronRight,
                      size: 24, color: theme.colorScheme.onBackground),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
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
                      child: MyText.titleMedium("Appearance", fontWeight: 600),
                    ),
                  ),
                  Icon(LucideIcons.chevronRight,
                      size: 24, color: theme.colorScheme.onBackground),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(LucideIcons.lock,
                      size: 24, color: theme.colorScheme.onBackground),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.titleMedium("Privacy & Security",
                          fontWeight: 600),
                    ),
                  ),
                  Icon(LucideIcons.chevronRight,
                      size: 24, color: theme.colorScheme.onBackground),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(LucideIcons.smile,
                      size: 24, color: theme.colorScheme.onBackground),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child:
                          MyText.titleMedium("Help & Support", fontWeight: 600),
                    ),
                  ),
                  Icon(LucideIcons.chevronRight,
                      size: 24, color: theme.colorScheme.onBackground),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(LucideIcons.helpCircle,
                      size: 24, color: theme.colorScheme.onBackground),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.titleMedium("About", fontWeight: 600),
                    ),
                  ),
                  Icon(LucideIcons.chevronRight,
                      size: 24, color: theme.colorScheme.onBackground),
                ],
              ),
            ),
            Divider(
              thickness: 0.3,
            ),
          ],
        ));
  }
}
