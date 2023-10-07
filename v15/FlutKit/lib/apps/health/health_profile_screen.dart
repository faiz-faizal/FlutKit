import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:flutkit/helpers/theme/app_theme.dart';

class HealthProfileScreen extends StatefulWidget {
  @override
  _HealthProfileScreenState createState() => _HealthProfileScreenState();
}

class _HealthProfileScreenState extends State<HealthProfileScreen> {
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
        body: ListView(
      padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
      children: [
        MyContainer.bordered(
          padding: MySpacing.vertical(24),
          margin: MySpacing.fromLTRB(24, 16, 24, 0),
          borderRadiusAll: 4,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                child: Image(
                  image: AssetImage('./assets/images/profile/avatar_2.jpg'),
                  height: 64,
                  width: 64,
                ),
              ),
              Container(
                margin: MySpacing.top(16),
                child: MyText.bodyLarge("Pablo Hills",
                    fontWeight: 600, letterSpacing: 0),
              ),
              Container(
                margin: MySpacing.top(8),
                child: MyText.bodyMedium("22 years, India",
                    fontWeight: 500, muted: true, letterSpacing: 0),
              ),
              Container(
                margin: MySpacing.top(24),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          MyText.bodySmall("Weight",
                              color: theme.colorScheme.primary, muted: true),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "62",
                                  style: MyTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600)),
                              TextSpan(
                                  text: " kg",
                                  style: MyTextStyle.bodyMedium(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500)),
                            ]),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          MyText.bodySmall("Height",
                              color: theme.colorScheme.primary, muted: true),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "158",
                                  style: MyTextStyle.bodyLarge(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 600)),
                              TextSpan(
                                  text: " cm",
                                  style: MyTextStyle.bodyMedium(
                                      color: theme.colorScheme.onBackground,
                                      fontWeight: 500)),
                            ]),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          MyText.bodySmall("Goal",
                              color: theme.colorScheme.primary, muted: true),
                          RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "50",
                                  style: MyTextStyle.bodyLarge(
                                      color: customTheme.colorInfo,
                                      fontWeight: 600)),
                              TextSpan(
                                  text: " kg",
                                  style: MyTextStyle.bodyMedium(
                                      color: customTheme.colorInfo,
                                      fontWeight: 500)),
                            ]),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 20, 24, 0),
          child: MyText.bodySmall(
            "Appointment".toUpperCase(),
            fontSize: 11.8,
            fontWeight: 600,
            xMuted: true,
          ),
        ),
        Container(
          margin: MySpacing.fromLTRB(24, 20, 24, 0),
          child: Column(
            children: [
              appointmentWidget(
                  image: './assets/images/profile/avatar_3.jpg',
                  docName: "Dr. Kole Wilde",
                  type: "psychologist",
                  time: "3:00 PM",
                  clockColor: customTheme.colorSuccess),
              Container(
                margin: MySpacing.top(24),
                child: appointmentWidget(
                    image: './assets/images/profile/avatar_4.jpg',
                    docName: "Dr. Siana Bolton",
                    type: "psychologist",
                    time: "6:30 PM",
                    clockColor: customTheme.colorInfo),
              ),
              Container(
                margin: MySpacing.top(24),
                child: appointmentWidget(
                    image: './assets/images/profile/avatar_2.jpg',
                    docName: "Dr. Jeanne Healy",
                    type: "psychologist",
                    time: "10:00 AM",
                    clockColor: customTheme.colorWarning),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget appointmentWidget(
      {required String image,
      required String docName,
      required String type,
      required String time,
      Color? clockColor}) {
    return MyContainer(
      padding: MySpacing.fromLTRB(8, 8, 8, 8),
      borderRadiusAll: 4,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Image(
              image: AssetImage(image),
              width: 72,
              height: 72,
            ),
          ),
          Expanded(
            child: Container(
              height: 72,
              margin: MySpacing.left(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(docName,
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  MyText.bodySmall(type,
                      color: theme.colorScheme.onBackground,
                      fontWeight: 500,
                      xMuted: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        LucideIcons.clock,
                        size: 16,
                        color: clockColor,
                      ),
                      Container(
                        margin: MySpacing.left(4),
                        child: MyText.bodySmall(time,
                            muted: true,
                            fontWeight: 600,
                            color: theme.colorScheme.onBackground),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
