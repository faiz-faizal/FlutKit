import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyContainer.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/Generator.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';
import 'EventTicketDialog.dart';

class EventTicketScreen extends StatefulWidget {
  @override
  _EventTicketScreenState createState() => _EventTicketScreenState();
}

class _EventTicketScreenState extends State<EventTicketScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  int selectedCategory = 0;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());

        return Scaffold(
          backgroundColor: customAppTheme.bgLayer1,
          body: ListView(
            padding: Spacing.bottom(16),
            children: [
              MyRow(
                spacing: 0,
                wrapAlignment: WrapAlignment.center,
                children: [
                  MyCol(
                    flex: {
                      ScreenMediaType.MD: 12,
                      ScreenMediaType.XL: 8,
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Image(
                                image:
                                    AssetImage('./assets/design/pattern-1.png'),
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                child: Container(
                                  margin: Spacing.fromLTRB(24, 48, 24, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyContainer.bordered(
                                        paddingAll: 8,
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(MdiIcons.chevronLeft,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(220),
                                            size: 20),
                                      ),
                                      MyContainer.bordered(
                                        paddingAll: 8,
                                        child: Icon(MdiIcons.shareOutline,
                                            color: themeData
                                                .colorScheme.onBackground
                                                .withAlpha(220),
                                            size: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: Spacing.fromLTRB(16, 16, 16, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Widgets of the Week - Flutter',
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.headline5,
                                          fontSize: 22,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                  ),
                                  Container(
                                    margin: Spacing.left(16),
                                    padding: Spacing.all(8),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(24)
                                            .withAlpha(20),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Icon(MdiIcons.heartOutline,
                                        size: 18,
                                        color: themeData.colorScheme.primary),
                                  )
                                ],
                              ),
                              Spacing.height(16),
                              Row(
                                children: [
                                  Container(
                                    padding: Spacing.all(8),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(24),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Icon(
                                      MdiIcons.calendar,
                                      size: 18,
                                      color: themeData.colorScheme.primary,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: Spacing.left(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Friday",
                                            style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 600,
                                                color: themeData
                                                    .colorScheme.onBackground),
                                          ),
                                          Container(
                                            margin: Spacing.top(2),
                                            child: Text(
                                              "8:30 - 11:30 AM",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.caption,
                                                  fontSize: 12,
                                                  fontWeight: 500,
                                                  color: themeData
                                                      .colorScheme.onBackground,
                                                  xMuted: true),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: Spacing.fromLTRB(16, 4, 4, 4),
                                    decoration: BoxDecoration(
                                        color: themeData.colorScheme.primary
                                            .withAlpha(28),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32))),
                                    child: Row(
                                      children: [
                                        Text(
                                          "Add to Reminder",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              letterSpacing: 0,
                                              fontSize: 12,
                                              color:
                                                  themeData.colorScheme.primary,
                                              fontWeight: 400),
                                        ),
                                        Container(
                                          padding: Spacing.all(8),
                                          margin: Spacing.left(8),
                                          decoration: BoxDecoration(
                                              color:
                                                  themeData.colorScheme.primary,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                            MdiIcons.plus,
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            size: 18,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Spacing.height(16),
                              Row(
                                children: [
                                  Generator.buildOverlaysProfile(
                                      images: [
                                        './assets/images/avatar-2.jpg',
                                        './assets/images/avatar-1.jpg',
                                        './assets/images/avatar-3.jpg',
                                        './assets/images/avatar-4.jpg',
                                      ],
                                      size: 36,
                                      leftFraction: 0.7,
                                      overlayBorderThickness: 2.5,
                                      enabledOverlayBorder: true,
                                      overlayBorderColor:
                                          customAppTheme.bgLayer1),
                                  Container(
                                    child: Text(
                                      "+42 Participant",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: themeData.colorScheme.primary,
                                          fontWeight: 500),
                                    ),
                                  )
                                ],
                              ),
                              Spacing.height(16),
                              Text(
                                "About This Event",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 700,
                                    color: themeData.colorScheme.onBackground),
                              ),
                              Spacing.height(16),
                              RichText(
                                text: TextSpan(children: <TextSpan>[
                                  TextSpan(
                                      text: Generator.getDummyText(20),
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.subtitle2,
                                          color: themeData
                                              .colorScheme.onBackground,
                                          muted: true,
                                          letterSpacing: 0.3,
                                          fontWeight: 500)),
                                  TextSpan(
                                      text: "Read More",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          letterSpacing: 0.3,
                                          color: themeData.colorScheme.primary,
                                          fontWeight: 600))
                                ]),
                              ),
                              Spacing.height(16),
                              Text(
                                "Location",
                                style: AppTheme.getTextStyle(
                                    themeData.textTheme.subtitle1,
                                    fontWeight: 700,
                                    color: themeData.colorScheme.onBackground),
                              ),
                              Spacing.height(16),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                child: Image(
                                  image: AssetImage(
                                      './assets/other/map-md-snap.png'),
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Spacing.height(16),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            EventTicketDialog());
                                  },
                                  child: Text(
                                    "Show my Ticket",
                                    style: AppTheme.getTextStyle(
                                        themeData.textTheme.bodyText2,
                                        fontWeight: 600,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          Spacing.xy(32, 0))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
