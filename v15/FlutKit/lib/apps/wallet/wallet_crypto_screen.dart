import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WalletCryptoScreen extends StatefulWidget {
  @override
  _WalletCryptoScreenState createState() => _WalletCryptoScreenState();
}

class _WalletCryptoScreenState extends State<WalletCryptoScreen> {
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
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium("Crypto", fontWeight: 600),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 20),
                child: Icon(
                  LucideIcons.qrCode,
                  color: theme.colorScheme.onBackground,
                  size: 24,
                ))
          ],
        ),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: MyContainer(
                padding:
                    EdgeInsets.only(top: 36, bottom: 36, right: 40, left: 40),
                color: theme.cardTheme.color,
                borderRadiusAll: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "\$ ",
                              style: MyTextStyle.titleLarge(letterSpacing: 0)),
                          TextSpan(
                              text: "3824",
                              style:
                                  MyTextStyle.headlineSmall(letterSpacing: 0)),
                          TextSpan(
                              text: ".75",
                              style: MyTextStyle.titleLarge(letterSpacing: 0)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        MyText.bodySmall(
                          "+ \$ 146.25 (10.25%) ",
                        ),
                        Icon(
                          LucideIcons.arrowUp,
                          color: theme.colorScheme.primary,
                          size: 18,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 32, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText.bodySmall("TODAY RATE", fontWeight: 600),
                  Icon(
                    LucideIcons.refreshCcw,
                    color: theme.colorScheme.onBackground,
                    size: 22,
                  )
                ],
              ),
            ),
            MyContainer.bordered(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(8),
              color: Colors.transparent,
              borderRadiusAll: 4,
              child: Column(
                children: const <Widget>[
                  _SingleRate(
                    name: 'BTC',
                    rate: 451.14,
                    changes: 12.85,
                  ),
                  _SingleRate(
                    name: 'Ethereum',
                    rate: 148.40,
                    changes: -20.54,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: MyText.bodySmall("ACTIVITY", fontWeight: 600),
            ),
            MyContainer.bordered(
              color: Colors.transparent,
              margin: EdgeInsets.all(20),
              padding: MySpacing.y(8),
              borderRadiusAll: 4,
              child: Column(
                children: <Widget>[
                  _SingleActivity(
                    title: 'Received Ethereum',
                    subtitle: 'Pending transaction',
                    activity: '+0.3785 BTC',
                    activityColor: theme.colorScheme.primary,
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  _SingleActivity(
                    title: 'Received Bitcoin',
                    subtitle: 'Pending transaction',
                    activity: '+0.3785 BTC',
                    activityColor: theme.colorScheme.primary,
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  _SingleActivity(
                    title: 'Sent Bitcoin',
                    subtitle: 'To Eliott Myers',
                    activity: '-0.7548 BTC',
                    activityColor: theme.colorScheme.error,
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: MyText.bodySmall("VIEW ALL",
                            color: theme.colorScheme.primary,
                            letterSpacing: 0.5,
                            fontWeight: 600)),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class _SingleActivity extends StatelessWidget {
  final String title, subtitle, activity;
  final Color activityColor;

  const _SingleActivity(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.activity,
      required this.activityColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyText.bodyLarge(title, fontWeight: 700),
              MyText.bodySmall(subtitle, fontWeight: 400),
            ],
          ),
          MyText.titleSmall(activity,
              fontWeight: 600, color: activityColor, letterSpacing: 0),
        ],
      ),
    );
  }
}

class _SingleRate extends StatelessWidget {
  final String name;
  final double rate, changes;

  const _SingleRate(
      {Key? key, required this.name, required this.rate, required this.changes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(child: MyText.titleMedium(name, fontWeight: 600)),
          MyText.bodyLarge("\$ ${rate.toStringAsFixed(2)}", fontWeight: 600),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                changes > 0
                    ? Icon(LucideIcons.arrowUp,
                        size: 18, color: theme.colorScheme.primary)
                    : Icon(LucideIcons.arrowDown,
                        size: 18, color: theme.colorScheme.error),
                MyText.bodySmall(changes.abs().toStringAsFixed(2),
                    color: changes > 0
                        ? theme.colorScheme.primary
                        : theme.colorScheme.error,
                    fontWeight: 500)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
