import 'package:flutkit/apps/health/health_new_activity_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HealthHomeScreen extends StatefulWidget {
  @override
  _HealthHomeScreenState createState() => _HealthHomeScreenState();
}

class _HealthHomeScreenState extends State<HealthHomeScreen> {
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
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: theme.colorScheme.primary,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HealthNewActivityScreen()));
            },
            label: Row(
              children: [
                Icon(
                  LucideIcons.plus,
                  color: theme.colorScheme.onPrimary,
                  size: 18,
                ),
                Container(
                  margin: MySpacing.left(4),
                  child: MyText.bodyMedium("Activity",
                      color: theme.colorScheme.onPrimary, fontWeight: 500),
                ),
              ],
            )),
        body: ListView(
          padding: MySpacing.top(48),
          children: [
            Container(
              margin: MySpacing.fromLTRB(24, 0, 24, 0),
              alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_1.jpg'),
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 0, 0),
              child: MyText.titleMedium("Hello",
                  xMuted: true, color: theme.colorScheme.onBackground),
            ),
            Container(
              margin: MySpacing.left(24),
              child: MyText.headlineMedium("Den!",
                  letterSpacing: -0.5,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 700),
            ),
            MyContainer(
              margin: MySpacing.fromLTRB(24, 24, 24, 0),
              padding: MySpacing.horizontal(12),
              borderRadiusAll: 4,
              child: Row(
                children: [
                  Icon(
                    LucideIcons.search,
                    color: theme.colorScheme.primary.withAlpha(200),
                    size: 16,
                  ),
                  Expanded(
                    child: Container(
                      margin: MySpacing.left(12),
                      child: TextFormField(
                        style: MyTextStyle.bodySmall(
                            color: theme.colorScheme.onBackground,
                            fontWeight: 500),
                        decoration: InputDecoration(
                          fillColor: customTheme.card,
                          hintStyle: MyTextStyle.bodyMedium(
                              color: theme.colorScheme.onBackground,
                              muted: true,
                              fontWeight: 500),
                          hintText: "Find Events...",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 36, 24, 0),
              padding: MySpacing.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText.bodyLarge("Stay Home!",
                          color: theme.colorScheme.onPrimary, fontWeight: 600),
                      Icon(
                        LucideIcons.x,
                        color: theme.colorScheme.onPrimary.withAlpha(200),
                        size: 16,
                      )
                    ],
                  ),
                  Container(
                    margin: MySpacing.top(8),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: MyText.bodyMedium(Generator.getDummyText(12),
                        color: theme.colorScheme.onPrimary,
                        fontWeight: 400,
                        muted: true),
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 24, 24, 0),
              child: MyText.titleMedium("How we can help you?",
                  letterSpacing: -0.15,
                  color: theme.colorScheme.onBackground,
                  fontWeight: 600,
                  muted: true),
            ),
            Container(
              margin: MySpacing.top(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  singleHelpWidget(
                      iconData: LucideIcons.stethoscope, title: "Doctor"),
                  singleHelpWidget(
                      iconData: LucideIcons.activitySquare, title: "Hospital"),
                  singleHelpWidget(
                      iconData: LucideIcons.pill, title: "Medicine")
                ],
              ),
            ),
            Container(
              margin: MySpacing.top(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  singleHelpWidget(
                      iconData: LucideIcons.siren, title: "Ambulance"),
                  singleHelpWidget(
                      iconData: LucideIcons.phone, title: "Consultation"),
                  singleHelpWidget(
                      iconData: LucideIcons.syringe, title: "Shots")
                ],
              ),
            ),
          ],
        ));
  }

  Widget singleHelpWidget(
      {IconData? iconData, required String title, Color? color}) {
    return MyContainer(
      width: (MediaQuery.of(context).size.width - 96) / 3,
      padding: MySpacing.fromLTRB(0, 20, 0, 20),
      borderRadiusAll: 4,
      child: Column(
        children: [
          Icon(
            iconData,
            color: color ?? theme.colorScheme.primary,
            size: 30,
          ),
          Container(
            margin: MySpacing.top(8),
            child: MyText.bodySmall(title,
                letterSpacing: 0,
                color: theme.colorScheme.onBackground,
                fontWeight: 600),
          )
        ],
      ),
    );
  }
}
