import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HandymanSubscriptionScreen extends StatefulWidget {
  @override
  _HandymanSubscriptionScreenState createState() =>
      _HandymanSubscriptionScreenState();
}

class _HandymanSubscriptionScreenState
    extends State<HandymanSubscriptionScreen> {
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
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: MyText.titleLarge("Subscriptions",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          children: [
            Container(
              margin: MySpacing.top(24),
              child: MyText.headlineMedium(
                "21",
                color: theme.colorScheme.onBackground,
                fontWeight: 700,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: MySpacing.top(0),
              child: MyText.bodyMedium(
                "Days remaining",
                color: theme.colorScheme.onBackground,
                fontWeight: 500,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 32, 24, 0),
              child: MyText.bodySmall("RENEW SUBSCRIPTION",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 600,
                  muted: true),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 24, 24, 0),
              child: Column(
                children: [
                  subscriptionWidget(
                      title: "Premium Plan",
                      description: "Get unlimited A for month",
                      value: 19),
                  subscriptionWidget(
                      title: "Economy Plan",
                      description: "Get unlimited B for month",
                      value: 29),
                  subscriptionWidget(
                      title: "Business Plan",
                      description: "Get unlimited C for month",
                      value: 59),
                  Container(
                    margin: MySpacing.top(8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: MaterialStatePropertyAll(0),
                          padding:
                              MaterialStateProperty.all(MySpacing.xy(16, 0))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: MyText.bodySmall("CONTACT US",
                          letterSpacing: 0.4,
                          fontWeight: 600,
                          color: theme.colorScheme.onPrimary),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget subscriptionWidget(
      {required String title, required String description, double? value}) {
    return Container(
      margin: MySpacing.bottom(16),
      padding: MySpacing.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: customTheme.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.titleSmall(title,
                  color: theme.colorScheme.primary, fontWeight: 600),
              MyText.titleSmall("\$$value",
                  color: theme.colorScheme.primary, fontWeight: 600),
            ],
          ),
          MyText.bodyMedium(description, color: theme.colorScheme.onBackground),
        ],
      ),
    );
  }
}
