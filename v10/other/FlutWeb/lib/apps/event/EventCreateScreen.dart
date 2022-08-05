import 'package:flutkit/style/MyCard.dart';
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

class EventCreateScreen extends StatefulWidget {
  @override
  _EventCreateScreenState createState() => _EventCreateScreenState();
}

class _EventCreateScreenState extends State<EventCreateScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  List<String> _simpleChoice = ["Change place", "Add another", "Remove"];
  bool _switch = true;

  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        customAppTheme = AppTheme.getCustomAppTheme(value.themeMode());
        return SafeArea(
          child: Scaffold(
              backgroundColor: customAppTheme.bgLayer1,
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: Spacing.all(16),
                      children: [
                        Container(
                          margin: Spacing.x(8),
                          child: Row(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  child: Image(
                                    image: AssetImage(
                                        './assets/images/avatar-4.jpg'),
                                    width: 44,
                                    height: 44,
                                  ),
                                ),
                              ),
                              Container(
                                margin: Spacing.left(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Becky Parra",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.bodyText2,
                                          color:
                                              themeData.colorScheme.onBackground,
                                          fontWeight: 600),
                                    ),
                                    Text(
                                      "Create new event",
                                      style: AppTheme.getTextStyle(
                                          themeData.textTheme.caption,
                                          color: customAppTheme.colorSuccess,
                                          fontWeight: 500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Spacing.height(16),
                        Container(
                          margin: Spacing.x(8),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.headline5,
                                color: themeData.colorScheme.onBackground,
                                letterSpacing: -0.4,
                                fontWeight: 800),
                            decoration: InputDecoration(
                              fillColor: themeData.colorScheme.background,
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.headline5,
                                  color: themeData.colorScheme.onBackground,
                                  letterSpacing: -0.4,
                                  fontWeight: 800),
                              filled: false,
                              hintText: "Event Title",
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            autocorrect: false,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Container(
                          margin: Spacing.x(8),
                          child: TextFormField(
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.bodyText2,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 500,
                                letterSpacing: 0,
                                muted: true),
                            decoration: InputDecoration(
                              hintText: "Event Description",
                              hintStyle: AppTheme.getTextStyle(
                                  themeData.textTheme.bodyText2,
                                  color: themeData.colorScheme.onBackground,
                                  fontWeight: 600,
                                  letterSpacing: 0,
                                  xMuted: true),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(50)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.4,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(50)),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.5,
                                    color: themeData.colorScheme.onBackground
                                        .withAlpha(50)),
                              ),
                            ),
                            maxLines: 3,
                            minLines: 1,
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                        Spacing.height(24),
                        MyRow(
                          defaultFlex: {
                            ScreenMediaType.MD: 12,
                          },
                          children: [
                            MyCol(child: inviteWidget()),
                            MyCol(
                                child: Column(
                              children: [
                                locationWidget(),
                                Spacing.height(16),
                                eventTypeWidget(),
                                Spacing.height(16),
                                MyCard(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: "\$99",
                                              style: AppTheme.getTextStyle(
                                                  themeData.textTheme.bodyText1,
                                                  fontWeight: 700,
                                                  letterSpacing: 0,
                                                  color:
                                                  themeData.colorScheme.primary)),
                                          TextSpan(
                                              text: " /per person",
                                              style: AppTheme.getTextStyle(
                                                themeData.textTheme.caption,
                                                fontWeight: 600,
                                                letterSpacing: 0,
                                                color: themeData
                                                    .colorScheme.onBackground,
                                              )),
                                        ]),
                                      ),
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(
                                          MdiIcons.chevronRight,
                                          size: 20,
                                          color: themeData.colorScheme.onPrimary,
                                        ),
                                        label: Text(
                                          "Create".toUpperCase(),
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.caption,
                                              fontSize: 12,
                                              letterSpacing: 0.7,
                                              color: themeData.colorScheme.onPrimary,
                                              fontWeight: 600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }

  Widget locationWidget() {
    return MyContainer.bordered(
      padding: Spacing.right(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            child: Image(
              image: AssetImage('./assets/design/pattern-1.png'),
              height: 72,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Academy",
                    style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                        fontWeight: 600,
                        color: themeData.colorScheme.onBackground),
                  ),
                  Container(
                    margin: Spacing.top(2),
                    child: Text(
                      "8:00 - 11:00 AM",
                      style: AppTheme.getTextStyle(themeData.textTheme.caption,
                          fontSize: 12,
                          fontWeight: 600,
                          color: themeData.colorScheme.onBackground,
                          xMuted: true),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) {
                return _simpleChoice.map((String choice) {
                  return PopupMenuItem(
                    height: 36,
                    value: choice,
                    child: Text(choice,
                        style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          color: themeData.colorScheme.onBackground,
                        )),
                  );
                }).toList();
              },
              color: customAppTheme.bgLayer1,
              icon: Icon(
                MdiIcons.chevronDown,
                color: themeData.colorScheme.onBackground,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget eventTypeWidget() {
    return MyContainer.bordered(
      child: Row(
        children: [
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Public event",
                  style: AppTheme.getTextStyle(themeData.textTheme.bodyText1,
                      color: themeData.colorScheme.onBackground,
                      fontWeight: 600),
                ),
                Container(
                  margin: Spacing.top(2),
                  child: Text(
                    "Add event to the public feed",
                    style: AppTheme.getTextStyle(themeData.textTheme.caption,
                        color: themeData.colorScheme.onBackground,
                        fontWeight: 600,
                        xMuted: true),
                  ),
                ),
              ],
            ),
          )),
          Container(
            child: Switch(
              onChanged: (bool value) {
                setState(() {
                  _switch = value;
                });
              },
              value: _switch,
              activeColor: themeData.colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }

  Widget inviteWidget() {
    return MyContainer.bordered(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Invite Friends",
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    color: themeData.colorScheme.onBackground, fontWeight: 600),
              )
            ],
          ),
          Container(
            margin: Spacing.top(16),
            child: singleFriend(
                isSelected: true,
                name: "Trinity Knights",
                image: './assets/images/avatar-5.jpg'),
          ),
          Container(
            margin: Spacing.top(12),
            child: singleFriend(
                isSelected: false,
                name: "Cara Beck",
                image: './assets/images/avatar-2.jpg'),
          ),
          Container(
            margin: Spacing.top(12),
            child: singleFriend(
                isSelected: true,
                name: "Ayat Huber",
                image: './assets/images/avatar-3.jpg'),
          ),
          Container(
            margin: Spacing.top(12),
            child: Row(
              children: [
                Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.primary.withAlpha(32),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Center(
                      child: Text(
                        "48",
                        style: AppTheme.getTextStyle(
                            themeData.textTheme.bodyText2,
                            color: themeData.colorScheme.primary,
                            fontWeight: 800),
                      ),
                    )),
                Expanded(
                  child: Container(
                    margin: Spacing.left(16),
                    child: Text(
                      "Invite more",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.bodyText2,
                          fontWeight: 600,
                          color: themeData.colorScheme.onBackground
                              .withAlpha(220)),
                    ),
                  ),
                ),
                Container(
                  child: Icon(
                    MdiIcons.chevronRight,
                    size: 20,
                    color: themeData.colorScheme.onBackground.withAlpha(200),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget singleFriend({String image, String name, bool isSelected}) {
    return Container(
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image(
                image: AssetImage(image),
                width: 38,
                height: 38,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: Spacing.left(16),
              child: Text(
                name,
                style: AppTheme.getTextStyle(themeData.textTheme.bodyText2,
                    fontWeight: 600,
                    color: isSelected
                        ? customAppTheme.colorSuccess.withAlpha(220)
                        : themeData.colorScheme.onBackground.withAlpha(180)),
              ),
            ),
          ),
          Container(
            child: Icon(
              MdiIcons.check,
              size: 20,
              color: isSelected
                  ? customAppTheme.colorSuccess.withAlpha(240)
                  : themeData.colorScheme.onBackground.withAlpha(100),
            ),
          )
        ],
      ),
    );
  }
}
