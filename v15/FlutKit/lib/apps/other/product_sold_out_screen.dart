import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductSoldOutScreen extends StatefulWidget {
  @override
  _ProductSoldOutScreenState createState() => _ProductSoldOutScreenState();
}

class _ProductSoldOutScreenState extends State<ProductSoldOutScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool? checkValue = true;

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
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 64),
                child: MyText.titleLarge(
                  "This item is out of stock",
                  color: theme.colorScheme.onBackground,
                  letterSpacing: 0.3,
                  fontWeight: 600,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 64, bottom: 64),
                child: Icon(
                  LucideIcons.frown,
                  size: 64,
                  color: theme.colorScheme.primary,
                ),
              ),
              MyText.titleSmall(
                "We are sorry,\nThis product cannot be purchased at this time",
                color: theme.colorScheme.onBackground,
                letterSpacing: 0,
                fontWeight: 500,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      onChanged: (bool? value) {
                        setState(() {
                          checkValue = value;
                        });
                      },
                      value: checkValue,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: MyText.bodyMedium(
                        "Notify me when it available",
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600,
                        letterSpacing: 0.3,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
