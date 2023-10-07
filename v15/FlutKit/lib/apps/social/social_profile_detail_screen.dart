import 'package:flutkit/apps/social/social_relationship_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SocialProfileDetailScreen extends StatefulWidget {
  @override
  _SocialProfileDetailScreenState createState() =>
      _SocialProfileDetailScreenState();
}

class _SocialProfileDetailScreenState extends State<SocialProfileDetailScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  final List<String> _imageList = [
    './assets/images/all/all-1.jpg',
    './assets/images/all/all-2.jpg',
    './assets/images/all/all-3.jpg',
    './assets/images/all/all-4.jpg',
    './assets/images/all/all-5.jpg',
    './assets/images/all/all-6.jpg',
    './assets/images/all/all-7.jpg',
    './assets/images/all/all-8.jpg',
    './assets/images/all/all-9.jpg',
    './assets/images/all/all-10.jpg',
    './assets/images/all/all-11.jpg',
    './assets/images/all/all-12.jpg',
    './assets/images/all/all-13.jpg',
    './assets/images/all/all-14.jpg',
  ];

  _generateGridItems() {
    List<Widget> list = [];
    int size = 11;
    for (int i = 0; i < size; i++) {
      list.add(Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Image(image: AssetImage(_imageList[i % 14]), fit: BoxFit.fill),
      ));
    }
    list.add(InkWell(
      splashColor: theme.colorScheme.primary.withAlpha(100),
      highlightColor: theme.colorScheme.primary.withAlpha(28),
      onTap: () {},
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            color: theme.colorScheme.primary.withAlpha(28),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Center(
          child: MyText.titleSmall("View All",
              color: theme.colorScheme.primary, fontWeight: 600),
        ),
      ),
    ));
    return list;
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
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
        ),
        body: ListView(
          padding: MySpacing.zero,
          children: [
            Container(
              margin: MySpacing.fromLTRB(24, 0, 24, 0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image(
                      image: AssetImage('./assets/images/profile/avatar_3.jpg'),
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Container(
                    margin: MySpacing.left(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyLarge("Jedd Kouma",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            fontWeight: 600),
                        MyText.bodyMedium("April 12th",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            muted: true)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 16, 24, 0),
              child: Row(
                children: [
                  MyButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SocialRelationshipScreen()));
                    },
                    elevation: 0,
                    borderRadiusAll: 4,
                    child: MyText.bodyMedium("Connect",
                        fontWeight: 500, color: theme.colorScheme.onPrimary),
                  ),
                  Container(
                    margin: MySpacing.left(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("105k",
                            color: theme.colorScheme.onBackground,
                            fontWeight: 600),
                        MyText.bodySmall("Followers",
                            color: theme.colorScheme.onBackground, muted: true),
                      ],
                    ),
                  ),
                  Container(
                    margin: MySpacing.left(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.titleSmall("45",
                            color: theme.colorScheme.onBackground,
                            letterSpacing: 0,
                            fontWeight: 600),
                        MyText.bodySmall("Following",
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            letterSpacing: 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 24, 0, 0),
              child: MyText.titleMedium("Posts",
                  color: theme.colorScheme.onBackground, fontWeight: 700),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: GridView.count(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: MySpacing.fromLTRB(24, 12, 24, 24),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: _generateGridItems()),
            )
          ],
        ));
  }
}
