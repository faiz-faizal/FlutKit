/*
* File : Single Grid Item
* Version : 1.0.0
* */

import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:flutkit/helpers/theme/app_theme.dart';

class SingleGridItem extends StatelessWidget {
  final String title;
  final String? icon;
  final IconData? iconData;
  final List<SinglePageItem> items;
  final bool isComingSoon;
  final String comingSoonText;
  final Color? iconColor;

  const SingleGridItem({
    Key? key,
    required this.title,
    required this.items,
    this.icon,
    this.iconData,
    this.iconColor,
    this.isComingSoon = false,
    this.comingSoonText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomTheme customTheme = AppTheme.customTheme;
    ThemeData theme = AppTheme.theme;

    Widget iconWidget;
    if (icon == null) {
      if (iconData != null) {
        iconWidget = Icon(
          iconData,
          color: iconColor ?? theme.colorScheme.primary,
          size: 36,
        );
      } else {
        iconWidget = Image.asset(
          'assets/icons/rocket-outline.png',
          color: iconColor ?? theme.colorScheme.primary,
          width: 36,
          height: 36,
        );
      }
    } else {
      iconWidget = Image.asset(
        icon!,
        color: iconColor ?? theme.colorScheme.primary,
        width: 36,
        height: 36,
      );
    }
    // if (icon == null) {
    //   assetName = 'assets/icons/rocket-outline.png';
    // } else {
    //   assetName = icon;
    // }
    //
    // Widget iconWidget = Image.asset(
    //   assetName!,
    //   color: theme.colorScheme.primary,
    //   width: 36,
    //   height: 36,
    // );

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SinglePageHome(
                      title: title,
                      items: items,
                      comingSoonText: comingSoonText,
                      isComingSoon: isComingSoon,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(width: 1.2, color: customTheme.border),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              iconWidget,
              Container(
                margin: EdgeInsets.only(top: 16),
                child: MyText.bodyLarge(
                  title,
                  fontWeight: 600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SinglePageItem extends StatelessWidget {
  final String? title, icon;
  final Widget navigation;
  final IconData? iconData;
  final Color? iconColor, backgroundColor, textColor, borderColor;

  const SinglePageItem(
      {Key? key,
      required this.title,
      required this.navigation,
      this.icon,
      this.iconData,
      this.iconColor,
      this.backgroundColor,
      this.textColor,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    Widget iconWidget;
    if (icon == null) {
      if (iconData != null) {
        iconWidget = Icon(
          iconData,
          color: iconColor ?? themeData.colorScheme.primary,
          size: 36,
        );
      } else {
        iconWidget = Image.asset(
          'assets/icons/rocket-outline.png',
          color: iconColor ?? themeData.colorScheme.primary,
          width: 36,
          height: 36,
        );
      }
    } else {
      iconWidget = Image.asset(
        icon!,
        color: iconColor ?? themeData.colorScheme.primary,
        width: 36,
        height: 36,
      );
    }

    return InkWell(
      onTap: () async {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigation));
        AppTheme.initTextStyle();
        // FxControllerStore.resetStore();
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(
              width: 1.2, color: borderColor ?? AppTheme.customTheme.border),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              iconWidget,
              Container(
                margin: EdgeInsets.only(top: 16),
                child:
                    MyText.bodyLarge(title!, fontWeight: 600, color: textColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SinglePageHome extends StatefulWidget {
  final List<SinglePageItem> items;
  final String title;
  final bool isComingSoon;
  final String comingSoonText;

  const SinglePageHome(
      {Key? key,
      required this.items,
      required this.title,
      this.isComingSoon = true,
      this.comingSoonText = ""})
      : super(key: key);

  @override
  _SinglePageHomeState createState() => _SinglePageHomeState();
}

class _SinglePageHomeState extends State<SinglePageHome> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: MyText.titleMedium(widget.title, fontWeight: 600),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            LucideIcons.chevronLeft,
            size: 20,
            color: themeData.colorScheme.onBackground,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          GridView.count(
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: MySpacing.fromLTRB(20, 0, 20, 20),
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            children: widget.items,
          ),
          widget.isComingSoon
              ? Container(
                  margin: MySpacing.top(8),
                  child: Center(
                    child: MyText.titleSmall(widget.comingSoonText,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 500),
                  ))
              : Container()
        ],
      ),
    );
  }
}
