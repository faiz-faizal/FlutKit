import 'package:flutkit/apps/handyman/book_service_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class WorkerInformationScreen extends StatefulWidget {
  @override
  _WorkerInformationScreenState createState() =>
      _WorkerInformationScreenState();
}

class _WorkerInformationScreenState extends State<WorkerInformationScreen> {
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
          title: MyText.titleLarge("Sid Moore",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        body: ListView(
          padding: EdgeInsets.all(24),
          children: <Widget>[
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image(
                    image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                    width: 140,
                    height: 140,
                  ),
                ),
                Container(
                  margin: MySpacing.left(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodySmall("How far",
                          color: theme.colorScheme.onBackground, xMuted: true),
                      MyText.bodyLarge("3.2 km",
                          color: theme.colorScheme.onBackground),
                      Container(
                        margin: MySpacing.top(8),
                        child: MyText.bodySmall("Charges per hour",
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                      ),
                      MyText.bodyLarge("\$ 19",
                          color: theme.colorScheme.onBackground),
                      Container(
                        margin: MySpacing.top(8),
                        child: MyText.bodySmall("Rating",
                            color: theme.colorScheme.onBackground,
                            xMuted: true),
                      ),
                      Row(
                        children: [
                          Icon(
                            LucideIcons.star,
                            color: Generator.starColor,
                            size: 18,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          MyText.bodyMedium("4.5",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: MySpacing.top(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyLarge("Sid Moore",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                      MyText.bodyMedium("Plumber",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                          xMuted: true),
                    ],
                  ),
                  Row(
                    children: [
                      MyContainer.roundBordered(
                          color: Colors.transparent,
                          border: Border.all(color: theme.colorScheme.primary),
                          paddingAll: 10,
                          child: Center(
                            child: Icon(
                              LucideIcons.phone,
                              color: theme.colorScheme.primary,
                              size: 14,
                            ),
                          )),
                      Container(
                        margin: MySpacing.left(12),
                        child: MyContainer.roundBordered(
                            color: Colors.transparent,
                            border:
                                Border.all(color: theme.colorScheme.primary),
                            paddingAll: 10,
                            child: Center(
                              child: Icon(
                                LucideIcons.mail,
                                color: theme.colorScheme.primary,
                                size: 14,
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: MySpacing.top(16),
              child: MyText.bodyMedium(
                "About",
                color: theme.colorScheme.primary,
                fontWeight: 600,
              ),
            ),
            Container(
              margin: MySpacing.top(8),
              child: MyText.bodyMedium(
                  Generator.getParagraphsText(
                      paragraph: 3, words: 20, noOfNewLine: 1),
                  color: theme.colorScheme.onBackground,
                  muted: true),
            ),
            Container(
              margin: MySpacing.top(24),
              child: MyButton(
                elevation: 0,
                padding: MySpacing.y(16),
                borderRadiusAll: 4,
                splashColor: theme.colorScheme.onPrimary.withAlpha(20),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookServiceScreen()));
                },
                child: MyText.bodySmall("BOOK NOW",
                    letterSpacing: 0.4,
                    fontWeight: 600,
                    color: theme.colorScheme.onPrimary),
              ),
            )
          ],
        ));
  }
}
