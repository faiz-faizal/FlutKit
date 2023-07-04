import 'package:flutkit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

extension IconExtension on Icon {
  Icon autoDirection() {
    if (AppTheme.textDirection == TextDirection.ltr) return this;
    if (icon == FeatherIcons.chevronRight) {
      return Icon(
        FeatherIcons.chevronLeft,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == FeatherIcons.chevronLeft) {
      return Icon(
        FeatherIcons.chevronRight,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == MdiIcons.chevronLeft) {
      return Icon(
        MdiIcons.chevronRight,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    } else if (icon == MdiIcons.chevronRight) {
      return Icon(
        MdiIcons.chevronLeft,
        color: color,
        textDirection: textDirection,
        size: size,
        key: key,
        semanticLabel: semanticLabel,
      );
    }
    return this;
  }
}
