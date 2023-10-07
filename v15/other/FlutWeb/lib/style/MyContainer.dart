import 'dart:ui';

import 'package:flutkit/AppTheme.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppNotifier.dart';

class MyContainer extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final double borderRadiusAll, paddingAll;
  final EdgeInsetsGeometry padding;
  final Color color;
  final bool bordered;
  final Border border;
  final Clip clipBehavior;
  final BoxShape shape;
  final double width, height;
  final AlignmentGeometry alignment;
  final GestureTapCallback onTap;

  const MyContainer(
      {Key key,
      @required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap})
      : super(key: key);

  const MyContainer.none(
      {Key key,
      @required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll = 0,
      this.paddingAll = 0,
      this.border,
      this.bordered = false,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap})
      : super(key: key);

  const MyContainer.bordered(
      {Key key,
      @required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = true,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.rectangle,
      this.width,
      this.height,
      this.alignment,
      this.onTap})
      : super(key: key);

  const MyContainer.roundBordered(
      {Key key,
      @required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll,
      this.border,
      this.bordered = true,
      this.clipBehavior,
      this.color,
      this.shape = BoxShape.circle,
      this.width,
      this.height,
      this.alignment,
      this.onTap})
      : super(key: key);

  const MyContainer.rounded(
      {Key key,
      @required this.child,
      this.borderRadius,
      this.padding,
      this.borderRadiusAll,
      this.paddingAll=0,
      this.border,
      this.bordered = false,
      this.clipBehavior = Clip.antiAliasWithSaveLayer,
      this.color,
      this.shape = BoxShape.circle,
      this.width,
      this.height,
      this.alignment,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget builderChild) {
        CustomAppTheme customAppTheme =
            AppTheme.getCustomAppTheme(value.themeMode());
        return InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            alignment: alignment,
            margin: Spacing.zero,
            decoration: BoxDecoration(
                  color: color ?? customAppTheme.bgLayer2,
                  shape: shape,
                  borderRadius: shape == BoxShape.rectangle
                      ? borderRadius ??
                          BorderRadius.all(Radius.circular(borderRadiusAll ?? 8))
                      : null,
                  border: bordered
                      ? border ??
                          Border.all(color: customAppTheme.border2, width: 1)
                      : null),
            padding: padding ?? Spacing.all(paddingAll ?? 16),
            clipBehavior: clipBehavior ?? Clip.none,
            child: child,
          ),
        );
      },
    );
  }
}
