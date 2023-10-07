/*
* File : Material Widget Home Page
* Version : 1.0.0
* */

import 'package:flutter/material.dart';

import 'AppTheme.dart';

class MaterialWidgetsHome extends StatefulWidget {
  @override
  _MaterialWidgetsHomeState createState() => _MaterialWidgetsHomeState();
}

class _MaterialWidgetsHomeState extends State<MaterialWidgetsHome> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      color: themeData.colorScheme.background,
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 8, bottom: 16),
            child: Center(
              child: Text("More widgets are coming soon...",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                     letterSpacing: 0.5,fontWeight: 500,)),
            ),
          )
        ],
      ),
    );
  }
}
