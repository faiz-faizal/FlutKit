/*
* File : Cupertino Widget Home Page
* Version : 1.0.0
* */


import 'package:flutter/material.dart';
import 'AppTheme.dart';

class CupertinoWidgetsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      color: themeData.colorScheme.background,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
      GridView.count(
      shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.25,
        crossAxisSpacing: 16.0,
        children: <Widget>[]),
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 16),
            child: Center(
              child: Text("More widgets are coming soon...",
                  style: AppTheme.getTextStyle(
                    themeData.textTheme.bodyText2,
                    letterSpacing: 0.5,
                    fontWeight: 500,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
