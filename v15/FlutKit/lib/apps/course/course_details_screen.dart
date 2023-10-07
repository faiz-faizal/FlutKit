import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/utils/generator.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CourseDetailsScreen extends StatefulWidget {
  @override
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  bool isFav = false, isBookmark = false;

  late String _descText;

  @override
  void initState() {
    super.initState();
    _descText = Generator.getDummyText(24, withTab: true);
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          padding: MySpacing.fromLTRB(36, 48, 36, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  LucideIcons.chevronLeft,
                  color: theme.colorScheme.onPrimary,
                  size: 24,
                ),
              ),
              Container(
                margin: MySpacing.top(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: MySpacing.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                          color: customTheme.colorInfo,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: MyText.bodySmall("Trending",
                          color: customTheme.onInfo,
                          letterSpacing: 0,
                          fontWeight: 500),
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            setState(() {
                              isFav = isFav;
                            });
                          },
                          child: Icon(
                            isFav ? LucideIcons.heart : LucideIcons.heart,
                            color: theme.colorScheme.onPrimary,
                            size: 22,
                          ),
                        ),
                        Container(
                          margin: MySpacing.left(24),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isBookmark = isBookmark;
                              });
                            },
                            child: Icon(
                              isBookmark
                                  ? Icons.bookmark
                                  : Icons.bookmark_outline,
                              color: theme.colorScheme.onPrimary,
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: MySpacing.top(16),
                child: MyText.headlineSmall("UI Designing",
                    fontWeight: 700, color: theme.colorScheme.onPrimary),
              ),
              Container(
                margin: MySpacing.top(8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      LucideIcons.star,
                      size: 18,
                      color: theme.colorScheme.onPrimary,
                    ),
                    Container(
                      margin: MySpacing.left(4),
                      child: MyText.bodyMedium("4.7",
                          color: theme.colorScheme.onPrimary, fontWeight: 500),
                    ),
                    Container(
                      margin: MySpacing.left(16),
                      child: Icon(
                        LucideIcons.users,
                        size: 18,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    Container(
                      margin: MySpacing.left(4),
                      child: MyText.bodyMedium("7k",
                          color: theme.colorScheme.onPrimary, fontWeight: 500),
                    ),
                  ],
                ),
              ),
              Container(
                margin: MySpacing.top(40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    MyText.headlineSmall("\$50",
                        color: theme.colorScheme.onPrimary,
                        fontWeight: 600,
                        letterSpacing: 0.5,
                        height: 0),
                    Container(
                      margin: MySpacing.left(8),
                      child: MyText.bodyMedium("\$70",
                          color: theme.colorScheme.onPrimary,
                          fontWeight: 500,
                          height: 0,
                          muted: true,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: MySpacing.zero,
              children: <Widget>[
                Container(
                  padding: MySpacing.fromLTRB(36, 24, 36, 0),
                  child: MyText.titleMedium("Description",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
                Container(
                  padding: MySpacing.fromLTRB(36, 0, 36, 0),
                  margin: MySpacing.top(16),
                  child: MyText.bodyMedium(_descText,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500,
                      letterSpacing: 0.3,
                      height: 1.4),
                ),
                Container(
                  padding: MySpacing.fromLTRB(36, 24, 36, 0),
                  child: MyText.titleMedium("Content",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                ),
                Container(
                  margin: MySpacing.fromLTRB(36, 16, 36, 0),
                  child: Column(
                    children: <Widget>[
                      singleContent(
                          title: "Welcome to the Course",
                          time: "4:15 mins",
                          index: "01"),
                      singleContent(
                          title: "UI - Intro", time: "8:30 mins", index: "02"),
                      singleContent(
                          title: "UI - Process",
                          time: "14:15 mins",
                          enabled: false,
                          index: "03"),
                      singleContent(
                          title: "UI - Finishing",
                          time: "2:45 mins",
                          enabled: false,
                          index: "04"),
                      singleContent(
                          title: "Exam",
                          time: "30:00 mins",
                          enabled: false,
                          index: "05"),
                    ],
                  ),
                ),
              ]),
        ),
        Container(
          decoration: BoxDecoration(
              color: customTheme.card,
              border: Border.all(color: customTheme.border),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          padding: MySpacing.fromLTRB(36, 16, 36, 16),
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyButton(
                  onPressed: () {},
                  borderRadiusAll: 4,
                  elevation: 0,
                  child: MyText.bodyMedium("Buy Now",
                      fontWeight: 600, color: theme.colorScheme.onPrimary),
                ),
              ),
              Container(
                margin: MySpacing.left(16),
                padding: MySpacing.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withAlpha(40),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Icon(
                  LucideIcons.shoppingCart,
                  size: 24,
                  color: theme.colorScheme.primary,
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget singleContent(
      {required String index,
      required String time,
      required String title,
      bool enabled = true}) {
    return Container(
      margin: MySpacing.bottom(24),
      child: Row(
        children: <Widget>[
          MyText.headlineSmall(index,
              color: theme.colorScheme.onBackground.withAlpha(80),
              fontWeight: 600),
          Expanded(
            child: Container(
              margin: MySpacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.bodyMedium(time,
                      color: theme.colorScheme.onBackground, muted: true),
                  MyText.titleMedium(
                    title,
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
          Opacity(
            opacity: enabled ? 1 : 0.7,
            child: Container(
              margin: MySpacing.left(16),
              padding: MySpacing.all(8),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary, shape: BoxShape.circle),
              child: Icon(
                LucideIcons.play,
                color: theme.colorScheme.onPrimary,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
