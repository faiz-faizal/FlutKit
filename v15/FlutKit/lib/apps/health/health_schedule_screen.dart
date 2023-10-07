import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HealthScheduleScreen extends StatefulWidget {
  @override
  _HealthScheduleScreenState createState() => _HealthScheduleScreenState();
}

class _HealthScheduleScreenState extends State<HealthScheduleScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int selectedDate = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: theme.colorScheme.primary,
          child: Icon(
            LucideIcons.plus,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        body: ListView(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          children: [
            Container(
              margin: MySpacing.fromLTRB(24, 0, 24, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium("Today",
                          letterSpacing: 0,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500),
                      MyText.bodyLarge("13 Wed",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                    ],
                  ),
                  Icon(
                    LucideIcons.calendar,
                    size: 22,
                    color: theme.colorScheme.onBackground,
                  )
                ],
              ),
            ),
            Container(
              margin: MySpacing.top(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  singleDateWidget(date: "12\nTue", index: 0),
                  singleDateWidget(date: "13\nWed", index: 1),
                  singleDateWidget(date: "14\nThu", index: 2),
                  singleDateWidget(date: "15\nFri", index: 3),
                  singleDateWidget(date: "16\nSat", index: 4),
                ],
              ),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 24, 24, 0),
              child: MyText.titleMedium("Activity",
                  color: theme.colorScheme.onBackground,
                  muted: true,
                  fontWeight: 600),
            ),
            Container(
              margin: MySpacing.fromLTRB(24, 24, 24, 0),
              child: Column(
                children: [
                  singleActivityWidget(
                      color: Colors.blue,
                      iconData: LucideIcons.clock,
                      time: "6:00 AM",
                      title: "Wake up",
                      description: "Alarm automatic set"),
                  Container(
                    margin: MySpacing.top(24),
                    child: singleActivityWidget(
                        color: Colors.orange,
                        iconData: Icons.directions_walk,
                        time: "7:00 AM",
                        title: "Running",
                        description: "3 KM at morning"),
                  ),
                  Container(
                    margin: MySpacing.top(24),
                    child: singleActivityWidget(
                        color: Colors.green,
                        iconData: LucideIcons.pill,
                        time: "8:00 AM",
                        title: "Take Pill",
                        description: "After walking"),
                  ),
                  Container(
                    margin: MySpacing.top(24),
                    child: singleActivityWidget(
                        color: Colors.purple,
                        iconData: Icons.medical_information_outlined,
                        time: "10:00 AM",
                        title: "Appointment",
                        description: "Dr. vivek "),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget singleDateWidget({String? date, required int index}) {
    if (selectedDate == index) {
      return InkWell(
        onTap: () {
          setState(() {
            selectedDate = index;
          });
        },
        child: MyContainer(
          width: 50,
          color: theme.colorScheme.primary,
          borderRadiusAll: 4,
          padding: MySpacing.fromLTRB(0, 8, 0, 14),
          child: Column(
            children: [
              MyText.bodySmall(
                date.toString(),
                fontWeight: 600,
                color: theme.colorScheme.onPrimary,
                height: 1.9,
                textAlign: TextAlign.center,
              ),
              Container(
                margin: MySpacing.top(12),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary, shape: BoxShape.circle),
              )
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: () {
        setState(() {
          selectedDate = index;
        });
      },
      child: MyContainer(
        width: 50,
        borderRadiusAll: 4,
        padding: MySpacing.fromLTRB(0, 8, 0, 14),
        child: Column(
          children: [
            MyText.bodySmall(
              date.toString(),
              fontWeight: 600,
              color: theme.colorScheme.onBackground,
              height: 1.9,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  Widget singleActivityWidget(
      {required String time,
      required Color color,
      IconData? iconData,
      required String title,
      required String description}) {
    return Row(
      children: [
        SizedBox(
            width: 72,
            child: MyText.bodySmall(
              time,
              muted: true,
              letterSpacing: 0,
            )),
        Expanded(
          child: MyContainer(
            padding: MySpacing.all(12),
            borderRadiusAll: 4,
            color: color.withAlpha(24),
            child: Row(
              children: [
                Container(
                    padding: MySpacing.all(8),
                    decoration: BoxDecoration(
                        color: color.withAlpha(48),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Icon(
                      iconData,
                      color: color,
                      size: 30,
                    )),
                Container(
                  margin: MySpacing.left(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium(title,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                      MyText.bodySmall(description,
                          fontSize: 12,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                          muted: true),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
