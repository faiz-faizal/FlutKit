

import 'package:flutkit/AppNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppTheme.dart';
import 'utils/SizeConfig.dart';

class CustomAppsHome extends StatefulWidget {
  @override
  _CustomAppsHomeState createState() => _CustomAppsHomeState();
}

class _CustomAppsHomeState extends State<CustomAppsHome> {

  CustomAppTheme customAppTheme;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
                color: themeData.colorScheme.background,
                padding: Spacing.fromLTRB(8,0,8,12),
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      margin:
                      Spacing.only(top: 16, bottom: 16),
                      child: Center(
                        child: Text("More Apps are coming soon...",
                            style: AppTheme.getTextStyle(
                              themeData.textTheme.bodyText2,
                              letterSpacing: 0.5,
                              fontWeight: 500,
                            )),
                      ),
                    )
                  ],
                ));
          },
        );
      },
    );
  }
}
