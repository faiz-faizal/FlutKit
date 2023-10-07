import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FoodProfileScreen extends StatefulWidget {
  final BuildContext rootContext;

  const FoodProfileScreen({Key? key, required this.rootContext})
      : super(key: key);

  @override
  _FoodProfileScreenState createState() => _FoodProfileScreenState();
}

class _FoodProfileScreenState extends State<FoodProfileScreen> {
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
        body: ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: <Widget>[
        MyContainer(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 24, right: 24),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_5.jpg'),
                      width: 64,
                      height: 64,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText.bodyLarge("Malia Jackson",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        MyText.bodyMedium("Mal@son.com",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                      ],
                    ),
                  )
                ],
              ),
              MyContainer(
                color: theme.colorScheme.primary,
                margin: EdgeInsets.only(top: 16),
                padding:
                    EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
                borderRadiusAll: 4,
                child: Row(
                  children: <Widget>[
                    Icon(LucideIcons.info,
                        color: theme.colorScheme.onPrimary, size: 18),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.bodyMedium("Gold member",
                          color: Generator.goldColor,
                          fontWeight: 600,
                          letterSpacing: 0.2),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: MyText.bodySmall("Upgrade",
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 600,
                            letterSpacing: 0.2),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        MyContainer(
          paddingAll: 16,
          borderRadiusAll: 4,
          margin: MySpacing.nBottom(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText.bodyMedium("Account balance",
                      color: theme.colorScheme.onBackground.withAlpha(220),
                      letterSpacing: 0,
                      fontWeight: 600),
                  MyText.titleSmall("\$ 50.00",
                      color: theme.colorScheme.primary,
                      letterSpacing: 0,
                      fontWeight: 600)
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText.bodyMedium("Refer Friends",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        MyText.bodySmall("Earn \$100",
                            color: theme.colorScheme.primary, fontWeight: 600)
                      ],
                    ),
                    Icon(
                      LucideIcons.chevronRight,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        MyContainer(
          paddingAll: 20,
          margin: MySpacing.nBottom(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    LucideIcons.wallet,
                    size: 22,
                    color: theme.colorScheme.onBackground,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: MyText.titleSmall("Add money to wallet",
                        color: theme.colorScheme.onBackground.withAlpha(240),
                        letterSpacing: 0,
                        fontWeight: 600),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        LucideIcons.chevronRight,
                        size: 22,
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      LucideIcons.mapPin,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.titleSmall("Address setting",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          LucideIcons.chevronRight,
                          size: 22,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      LucideIcons.creditCard,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.titleSmall("Payment setting",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          LucideIcons.chevronRight,
                          size: 22,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      LucideIcons.smile,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.titleSmall("Customer support",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          LucideIcons.chevronRight,
                          size: 22,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Icon(
                      LucideIcons.shield,
                      size: 22,
                      color: theme.colorScheme.onBackground,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: MyText.titleSmall("Terms",
                          color: theme.colorScheme.onBackground.withAlpha(240),
                          letterSpacing: 0,
                          fontWeight: 600),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          LucideIcons.chevronRight,
                          size: 22,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        MySpacing.height(20),
        Center(
          child: MyButton(
              elevation: 0,
              borderRadiusAll: 4,
              padding: MySpacing.xy(20, 20),
              onPressed: () {
                Navigator.pop(widget.rootContext);
              },
              child: MyText.bodySmall("Logout".toUpperCase(),
                  letterSpacing: 0.5,
                  color: theme.colorScheme.onPrimary,
                  fontWeight: 600)),
        )
      ],
    ));
  }
}
