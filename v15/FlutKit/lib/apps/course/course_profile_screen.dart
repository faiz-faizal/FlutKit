import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_progress_bar.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CourseProfileScreen extends StatefulWidget {
  @override
  _CourseProfileScreenState createState() => _CourseProfileScreenState();
}

class _CourseProfileScreenState extends State<CourseProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _upgradeText = Generator.getDummyText(12);
  }

  late String _upgradeText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: <Widget>[
        Container(
          margin: MySpacing.horizontal(24),
          child: Row(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: Image(
                    image: AssetImage('./assets/images/profile/avatar_3.jpg'),
                    width: 48,
                    height: 48,
                  )),
              Container(
                margin: MySpacing.left(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText.bodyLarge("Denise Andrew",
                        color: theme.colorScheme.onBackground, fontWeight: 600),
                    MyText.bodySmall("Regular profile",
                        color: theme.colorScheme.onBackground,
                        muted: true,
                        fontWeight: 600),
                  ],
                ),
              ),
            ],
          ),
        ),
        upgradeWidget(),
        Container(
          margin: MySpacing.fromLTRB(24, 20, 24, 0),
          child: MyText.bodyMedium("Progress",
              color: theme.colorScheme.onBackground,
              fontWeight: 600,
              muted: true,
              letterSpacing: 0.25),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 20, 24, 0),
          child: Column(
            children: <Widget>[
              progressWidget(
                  title: "Download - Flutter Lesson 1",
                  progress: 48,
                  iconData: LucideIcons.play),
              Container(
                margin: MySpacing.top(16),
                child: progressWidget(
                    title: "Download - Flutter Lesson 2"
                        "",
                    progress: 64,
                    iconData: LucideIcons.pause),
              ),
              Container(
                margin: MySpacing.top(16),
                child: progressWidget(
                    title: "Download - Flutter Lesson 3"
                        "",
                    progress: 0,
                    iconData: LucideIcons.download),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget upgradeWidget() {
    return MyContainer(
      margin: MySpacing.fromLTRB(24, 24, 24, 0),
      color: theme.colorScheme.primary,
      borderRadiusAll: 4,
      padding: MySpacing.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyText.titleMedium("Upgrade\nYour Account",
              fontWeight: 700, color: theme.colorScheme.onPrimary),
          Container(
            margin: MySpacing.top(8),
            child: MyText.bodyMedium(_upgradeText,
                color: theme.colorScheme.onPrimary.withAlpha(160), height: 1.2),
          ),
          Container(
            margin: MySpacing.top(16),
            padding: MySpacing.fromLTRB(12, 6, 12, 6),
            decoration: BoxDecoration(
              color: customTheme.colorInfo,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: MyText.bodyMedium("Upgrade", color: customTheme.onInfo),
          ),
        ],
      ),
    );
  }

  Widget progressWidget(
      {required String title, required int progress, IconData? iconData}) {
    return MyContainer.bordered(
      padding: MySpacing.all(16),
      borderRadiusAll: 4,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.bodyLarge(title,
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                Container(
                  margin: MySpacing.top(8),
                  child: Row(
                    children: <Widget>[
                      MyProgressBar(
                          progress: progress.toDouble(),
                          activeColor: customTheme.colorInfo,
                          inactiveColor: customTheme.card,
                          width: MediaQuery.of(context).size.width * 0.5),
                      Container(
                        margin: MySpacing.left(16),
                        child: MyText.bodySmall("$progress%",
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            fontWeight: 600,
                            letterSpacing: 0.5),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: MySpacing.all(8),
            decoration: BoxDecoration(
                color: theme.colorScheme.primary, shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: theme.colorScheme.onPrimary,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
