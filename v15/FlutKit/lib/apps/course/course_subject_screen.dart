import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CourseSubjectScreen extends StatefulWidget {
  @override
  _CourseSubjectScreenState createState() => _CourseSubjectScreenState();
}

class _CourseSubjectScreenState extends State<CourseSubjectScreen> {
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
        body: Container(
            color: customTheme.card,
            child: Column(
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                MyText.headlineSmall("Biology",
                                    fontWeight: 700,
                                    color: theme.colorScheme.onPrimary),
                                MyText.bodyLarge("DS100",
                                    fontWeight: 500,
                                    color: theme.colorScheme.onPrimary),
                              ],
                            ),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                              child: Image(
                                  image: AssetImage(
                                      './assets/images/profile/avatar_2.jpg'),
                                  width: 48,
                                  height: 48),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: MySpacing.top(24),
                        child: MyText.bodyLarge("60 / 62 students",
                            color: theme.colorScheme.onPrimary,
                            fontWeight: 500),
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
                          padding: MySpacing.fromLTRB(20, 20, 20, 0),
                          margin: MySpacing.top(16),
                          child: MyText.titleMedium("Resources",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600),
                        ),
                        GridView.count(
                          physics: ClampingScrollPhysics(),
                          crossAxisCount: 2,
                          padding: MySpacing.fromLTRB(20, 20, 20, 16),
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 24,
                          shrinkWrap: true,
                          childAspectRatio: 1,
                          children: <Widget>[
                            singleResource(
                                title: "All",
                                isSelected: true,
                                resource: "14 Files"),
                            singleResource(
                                title: "Lectures",
                                iconData: LucideIcons.fileVideo,
                                resource: "3 Videos"),
                            singleResource(
                                title: "Reading Material",
                                isSelected: false,
                                iconData: LucideIcons.fileText,
                                resource: "3 PDFs"),
                            singleResource(
                                title: "Assignment",
                                isSelected: false,
                                iconData: LucideIcons.fileEdit,
                                resource: "3 Lessons"),
                            singleResource(
                                title: "Tasks",
                                isSelected: false,
                                resource: "3 Task"),
                          ],
                        )
                      ]),
                ),
              ],
            )));
  }

  Widget singleResource(
      {required String title,
      required String resource,
      bool isSelected = false,
      IconData iconData = LucideIcons.file}) {
    return MyContainer(
      padding: MySpacing.all(16),
      color: isSelected ? theme.colorScheme.primary : customTheme.card,
      bordered: !isSelected,
      borderRadiusAll: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MyText.titleMedium(title,
              color: isSelected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground,
              fontWeight: 600),
          Row(
            children: <Widget>[
              Icon(
                iconData,
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onBackground,
                size: 18,
              ),
              Container(
                margin: MySpacing.left(4),
                child: MyText.bodySmall(
                  resource,
                  color: isSelected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onBackground,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
