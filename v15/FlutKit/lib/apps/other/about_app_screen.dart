import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AboutAppScreen extends StatefulWidget {
  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
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
            ),
          ),
          title: MyText.titleMedium("About App", fontWeight: 600),
        ),
        backgroundColor: theme.colorScheme.background,
        body: ListView(
          padding: EdgeInsets.only(top: 0, left: 24, right: 24),
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_3.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText.titleMedium("FlutKit",
                          fontWeight: 600,
                          color: theme.colorScheme.onBackground),
                      MyText.titleSmall("Flutter Biggest UI KIT",
                          fontWeight: 500,
                          color: theme.colorScheme.onBackground),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: MyContainer(
                      padding: MySpacing.xy(12, 8),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: theme.colorScheme.primary,
                      child: MyText.bodySmall("v 7.0.0",
                          fontSize: 12,
                          color: theme.colorScheme.onPrimary,
                          fontWeight: 600,
                          letterSpacing: 0.3),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: MyText.bodyMedium(
                  Generator.getDummyText(32, withTab: true),
                  fontWeight: 500,
                  color: theme.colorScheme.onBackground),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: MyText.bodyMedium(
                  Generator.getDummyText(48, withTab: true),
                  fontWeight: 500,
                  color: theme.colorScheme.onBackground),
            ),
          ],
        ));
  }
}
