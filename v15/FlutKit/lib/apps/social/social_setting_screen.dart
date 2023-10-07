import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SocialSettingScreen extends StatefulWidget {
  @override
  _SocialSettingScreenState createState() => _SocialSettingScreenState();
}

class _SocialSettingScreenState extends State<SocialSettingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    desc = Generator.getDummyText(8);
  }

  late String desc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: [
        Row(
          children: [
            Container(
              padding: MySpacing.fromLTRB(20, 8, 20, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_4.jpg'),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Container()
          ],
        ),
        Container(
          padding: MySpacing.fromLTRB(20, 16, 20, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.titleLarge("Martyn Rankin", fontWeight: 600),
                  Container(
                    margin: MySpacing.top(4),
                    child: MyText.bodySmall(
                      "Fashion Model",
                    ),
                  ),
                  MyText.bodySmall(
                    "I love to be kind",
                  ),
                  MyText.bodySmall(
                    "From heaven",
                  ),
                  MyText.bodySmall("See more",
                      decoration: TextDecoration.underline),
                ],
              ),
              MyButton(
                  onPressed: () {},
                  borderRadiusAll: 4,
                  elevation: 0,
                  child: MyText.bodyMedium("Edit",
                      fontWeight: 600,
                      letterSpacing: 0.3,
                      color: theme.colorScheme.onPrimary))
            ],
          ),
        ),
        MyContainer.bordered(
          padding: MySpacing.all(20),
          margin: MySpacing.all(20),
          borderRadiusAll: 4,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  MyText.titleMedium("15", fontWeight: 700),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: MyText.titleSmall("Posts",
                        fontWeight: 600, letterSpacing: 0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  MyText.titleMedium("486", fontWeight: 700),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: MyText.titleSmall("Followers",
                        fontWeight: 600, letterSpacing: 0),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  MyText.titleMedium("58", fontWeight: 700),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: MyText.titleSmall("Following",
                        fontWeight: 600, letterSpacing: 0),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: MySpacing.x(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.titleSmall("Complete your profile",
                  color: theme.colorScheme.onBackground,
                  fontWeight: 600,
                  letterSpacing: 0),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "2 OF 4 ",
                    style: MyTextStyle.bodySmall(
                        fontSize: 11,
                        fontWeight: 600,
                        color: customTheme.colorSuccess)),
                TextSpan(
                    text: " COMPLETE",
                    style: MyTextStyle.bodySmall(
                        color: theme.colorScheme.onBackground,
                        xMuted: true,
                        fontSize: 11,
                        fontWeight: 600)),
              ]))
            ],
          ),
        ),
        Container(
          margin: MySpacing.top(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: MySpacing.left(20),
                  child: singleCompleteWidget(
                      iconData: LucideIcons.user,
                      option: "Add Photo",
                      title: "Add Profile Photo",
                      desc: desc),
                ),
                Container(
                  margin: MySpacing.left(20),
                  child: singleCompleteWidget(
                      iconData: LucideIcons.messageCircle,
                      option: "Add Bio",
                      title: "Add Bio",
                      desc: desc),
                ),
                Container(
                  margin: MySpacing.horizontal(20),
                  child: singleCompleteWidget(
                      iconData: LucideIcons.users,
                      option: "Find More",
                      title: "Find people",
                      desc: desc),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget singleCompleteWidget(
      {IconData? iconData,
      required String title,
      required String desc,
      required String option}) {
    return Container(
      padding: MySpacing.fromLTRB(20, 20, 20, 16),
      width: 220,
      decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: customTheme.border, width: 1)),
      child: Column(
        children: [
          Container(
            padding: MySpacing.all(8),
            decoration: BoxDecoration(
                border: Border.all(
                    color: theme.colorScheme.onBackground.withAlpha(120),
                    width: 1.5),
                shape: BoxShape.circle),
            child: Icon(
              iconData,
              color: theme.colorScheme.onBackground.withAlpha(180),
              size: 26,
            ),
          ),
          Container(
            margin: MySpacing.top(12),
            child: MyText.bodyMedium(title,
                color: theme.colorScheme.onBackground,
                fontWeight: 600,
                letterSpacing: 0),
          ),
          Container(
            margin: MySpacing.top(4),
            child: MyText.bodySmall(
              desc,
              color: theme.colorScheme.onBackground,
              fontWeight: 400,
              letterSpacing: -0.2,
              textAlign: TextAlign.center,
            ),
          ),
          MySpacing.height(8),
          MyButton(
            borderRadiusAll: 4,
            elevation: 0,
            onPressed: () {},
            padding: MySpacing.fromLTRB(12, 8, 12, 8),
            child: MyText.bodySmall(option,
                color: theme.colorScheme.onPrimary, fontWeight: 600),
          ),
        ],
      ),
    );
  }
}
