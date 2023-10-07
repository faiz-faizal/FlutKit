// ignore: unused_import
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MaintenanceScreen extends StatefulWidget {
  @override
  _MaintenanceScreenState createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
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
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
        ),
        backgroundColor: theme.colorScheme.background,
        body: Column(
          children: <Widget>[
            Image(
              image:
                  AssetImage('./assets/illustration/shopping/maintenance.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: MyText.bodyLarge("We will be back soon",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 600,
                  letterSpacing: 0.2),
            ),
            Container(
              margin: EdgeInsets.only(left: 56, right: 56, top: 24),
              child: MyText.bodyMedium(
                "FlutKit is getting some tune up and some love. We'll be back soon, Thanks for your patience!",
                letterSpacing: 0,
                fontWeight: 500,
                height: 1.2,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ));
  }
}
