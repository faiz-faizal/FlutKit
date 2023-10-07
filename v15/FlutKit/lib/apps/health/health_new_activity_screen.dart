import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HealthNewActivityScreen extends StatefulWidget {
  @override
  _HealthNewActivityScreenState createState() =>
      _HealthNewActivityScreenState();
}

class _HealthNewActivityScreenState extends State<HealthNewActivityScreen> {
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
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              color: theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
        ),
        body: ListView(
          padding: MySpacing.top(0),
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "What's your",
                    style: MyTextStyle.headlineSmall(
                        color: theme.colorScheme.onBackground,
                        fontWeight: 600)),
                TextSpan(
                    text: " goal?",
                    style: MyTextStyle.headlineSmall(
                        color: customTheme.colorSuccess, fontWeight: 600)),
              ]),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 8, 24, 0),
              child: MyText.bodyMedium(
                "We need to know your fitness goal",
                color: theme.colorScheme.onBackground,
                muted: true,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(40, 40, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  singleChoice(title: "To lose weight"),
                  Container(
                      margin: MySpacing.top(16),
                      child: singleChoice(title: "To lose fat")),
                  Container(
                      margin: MySpacing.top(16),
                      child: singleChoice(title: "To gain weight")),
                  Container(
                      margin: MySpacing.top(16),
                      child: singleChoice(title: "To gain height")),
                  Container(
                      margin: MySpacing.top(16),
                      child: singleChoice(title: "To build muscle")),
                ],
              ),
            )
          ],
        ));
  }

  Widget singleChoice({required String title}) {
    return MyContainer(
      padding: MySpacing.fromLTRB(24, 16, 0, 16),
      borderRadiusAll: 4,
      child: MyText.bodyLarge(title,
          color: theme.colorScheme.onBackground, fontWeight: 500),
    );
  }
}
