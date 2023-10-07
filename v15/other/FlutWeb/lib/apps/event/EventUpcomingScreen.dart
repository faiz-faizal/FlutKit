import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'EventTicketDialog.dart';
import 'EventTicketScreen.dart';

class EventUpcomingScreen extends StatefulWidget {
  @override
  _EventUpcomingScreenState createState() => _EventUpcomingScreenState();
}

class _EventUpcomingScreenState extends State<EventUpcomingScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  int selectedCategory = 0;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: customAppTheme.bgLayer1,
              title: Text(
                "Upcoming",
                style: AppTheme.getTextStyle(themeData.textTheme.subtitle1,
                    color: themeData.colorScheme.onBackground, fontWeight: 600),
              ),
            ),
            backgroundColor: customAppTheme.bgLayer1,
            body: ListView(
              padding: Spacing.x(8),
              children: [
                MyRow(
                  defaultFlex: {
                    ScreenMediaType.MD:12,
                    ScreenMediaType.XL:8,
                    ScreenMediaType.XXL:6,
                  },
                  children: [
                    MyCol(
                      child: singleEvent(
                          image: './assets/design/pattern-1.png',
                          time: "08:15 PM",
                          date: "Fri, Apr 12, 2020",
                          name: "Flutter Meet 1"),
                    ),
                    MyCol(
                        child: singleEvent(
                            image: './assets/design/pattern-1.png',
                            time: "08:15 PM",
                            date: "Fri, Apr 12, 2020",
                            name: "Flutter Meet 2")),
                    MyCol(
                        child: singleEvent(
                            image: './assets/design/pattern-1.png',
                            time: "08:15 PM",
                            date: "Fri, Apr 12, 2020",
                            name: "Flutter Meet 3")),
                    MyCol(
                        child: singleEvent(
                            image: './assets/design/pattern-1.png',
                            time: "08:15 PM",
                            date: "Fri, Apr 12, 2020",
                            name: "Flutter Meet 4")),
                    MyCol(
                      child: singleEvent(
                          image: './assets/design/pattern-1.png',
                          time: "08:15 PM",
                          date: "Fri, Apr 12, 2020",
                          name: "Flutter Meet 1"),
                    ),
                    MyCol(
                        child: singleEvent(
                            image: './assets/design/pattern-1.png',
                            time: "08:15 PM",
                            date: "Fri, Apr 12, 2020",
                            name: "Flutter Meet 2")),
                  ],
                ),
              ],
            ));
      },
    );
  }

  Widget singleEvent({String image, String name, String date, String time}) {
    return MyContainer.bordered(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => EventTicketScreen()));
      },
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(image),
                width: (100),
                height: 72,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.subtitle2,
                            color: themeData.colorScheme.onBackground,
                            fontWeight: 600),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  EventTicketDialog());
                        },
                        child: Container(
                          padding: Spacing.all(6),
                          child: Icon(
                            MdiIcons.qrcode,
                            color: themeData.colorScheme.onBackground
                                .withAlpha(200),
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: Spacing.top(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  fontSize: 12,
                                  color: themeData.colorScheme.onBackground,
                                  xMuted: true),
                            ),
                            Container(
                              margin: Spacing.top(2),
                              child: Text(
                                date,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color:
                                        themeData.colorScheme.onBackground),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Time",
                              style: AppTheme.getTextStyle(
                                  themeData.textTheme.caption,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  color: themeData.colorScheme.onBackground,
                                  fontSize: 12,
                                  xMuted: true),
                            ),
                            Container(
                              margin: Spacing.top(2),
                              child: Text(
                                time,
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.bodyText2,
                                    color:
                                        themeData.colorScheme.onBackground),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
