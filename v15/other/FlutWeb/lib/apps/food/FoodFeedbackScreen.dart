
import 'package:flutkit/style/MyCol.dart';
import 'package:flutkit/style/MyRow.dart';
import 'package:flutkit/style/ScreenMedia.dart';
import 'package:flutkit/utils/SizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../AppNotifier.dart';
import '../../AppTheme.dart';

class FoodFeedbackScreen extends StatefulWidget {
  @override
  _FoodFeedbackScreenState createState() => _FoodFeedbackScreenState();
}

class _FoodFeedbackScreenState extends State<FoodFeedbackScreen> {
  ThemeData themeData;
  CustomAppTheme customAppTheme;

  bool checkDT = true, checkQTY = false, checkQ = true, checkOther = false;

  int selectedEmote = 2;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => RatingDialog());
  }




  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget child) {
        int themeType = value.themeMode();
        themeData = AppTheme.getThemeFromThemeMode(themeType);
        customAppTheme = AppTheme.getCustomAppTheme(themeType);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: customAppTheme.bgLayer1,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(MdiIcons.chevronLeft,
                  size: 24,
                  color: themeData.appBarTheme.iconTheme.color),
            ),
            title: Text(
              "Feedback",
              style: AppTheme.getTextStyle(themeData.textTheme.subtitle2,
                  color: themeData.colorScheme.onBackground,
                  fontWeight: 600),
            ),
          ),
          backgroundColor: customAppTheme.bgLayer1,
          body: ListView(
            padding: Spacing.zero,
            children: [
              MyRow(
                wrapAlignment: WrapAlignment.center,
                spacing: 0,
                children: [
                  MyCol(
                    flex: {
                      ScreenMediaType.MD: 12,
                      ScreenMediaType.XL: 8,
                    },
                    child: Container(
                      margin: Spacing.xy(24,8),
                      child: Column(
                        children: [

                          Text(
                            "How was last order?",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                color: themeData.colorScheme.onBackground,
                                fontWeight: 600),
                          ),
                          Spacing.height(16),
                          feedbackEmote(),
                          Spacing.height(16),
                          Divider(),
                          Container(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  checkQ = !checkQ;
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (value) {
                                      setState(() {
                                        checkQ = value;
                                      });
                                    },
                                    visualDensity: VisualDensity.compact,
                                    value: checkQ,
                                    activeColor:
                                    themeData.colorScheme.primary,
                                  ),
                                  Text(
                                    "Quality",
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  checkDT = !checkDT;
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (value) {
                                      setState(() {
                                        checkDT = value;
                                      });
                                    },
                                    visualDensity: VisualDensity.compact,
                                    value: checkDT,
                                    activeColor:
                                    themeData.colorScheme.primary,
                                  ),
                                  Text(
                                    "Delivery Time",
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  checkQTY = !checkQTY;
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (value) {
                                      setState(() {
                                        checkQTY = value;
                                      });
                                    },
                                    visualDensity: VisualDensity.compact,
                                    value: checkQTY,
                                    activeColor:
                                    themeData.colorScheme.primary,
                                  ),
                                  Text(
                                    "Quantity",
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Container(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  checkOther = !checkOther;
                                });
                              },
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    onChanged: (value) {
                                      setState(() {
                                        checkOther = value;
                                      });
                                    },
                                    visualDensity: VisualDensity.compact,
                                    value: checkOther,
                                    activeColor:
                                    themeData.colorScheme.primary,
                                  ),
                                  Text(
                                    "Other",
                                    style: AppTheme.getTextStyle(
                                      themeData.textTheme.subtitle2,
                                      color: themeData
                                          .colorScheme.onBackground,
                                      fontWeight: 500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Spacing.height(16),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: "Describe your experience",
                              isDense: true,
                              filled: true,
                              fillColor: themeData.colorScheme.background,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            textCapitalization: TextCapitalization.sentences,
                            minLines: 5,
                            maxLines: 10,
                          ),
                          Spacing.height(16),
                          Center(
                            child: ElevatedButton(

                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Review".toUpperCase(),
                                  style: AppTheme.getTextStyle(
                                      themeData.textTheme.bodyText2,
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: 600,
                                      letterSpacing: 0.8)),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(Spacing.xy(32, 0))
                              ),
                            ),
                          ),
                        ],
                      ),
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




  Widget feedbackEmote() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedEmote = 0;
              });
            },
            child: Icon(
              selectedEmote == 0
                  ? MdiIcons.emoticonSad
                  : MdiIcons.emoticonSadOutline,
              color: selectedEmote == 0
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground,
              size: 40,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedEmote = 1;
              });
            },
            child: Icon(
              selectedEmote == 1
                  ? MdiIcons.emoticonNeutral
                  : MdiIcons.emoticonNeutralOutline,
              color: selectedEmote == 1
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground,
              size: 40,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedEmote = 2;
              });
            },
            child: Icon(
              selectedEmote == 2
                  ? MdiIcons.emoticonHappy
                  : MdiIcons.emoticonHappyOutline,
              color: selectedEmote == 2
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground,
              size: 40,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                selectedEmote = 3;
              });
            },
            child: Icon(
              selectedEmote == 3 ? MdiIcons.emoticon : MdiIcons.emoticonOutline,
              color: selectedEmote == 3
                  ? themeData.colorScheme.primary
                  : themeData.colorScheme.onBackground,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

class RatingDialog extends StatefulWidget {
  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Container(
        width: 400,
        padding: Spacing.y(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Enjoying Food?",
              style: AppTheme.getTextStyle(
                  themeData.textTheme.headline6,
                  fontWeight: 700,
                  letterSpacing: 0)),
            Spacing.height(8),
            Text("How would you rate our service?",
                style: AppTheme.getTextStyle(
                    themeData.textTheme.bodyText2,
                    fontWeight: 500,
                    letterSpacing: 0.3)),
            Spacing.height(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                    onPressed: () {  },
                    child: Text(
                      "NOT NOW",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.caption,
                          letterSpacing: 0,
                          color: themeData.colorScheme.onBackground),
                    )),
                Spacing.width(16),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "RATE IT",
                      style: AppTheme.getTextStyle(
                          themeData.textTheme.caption,
                          color: themeData.colorScheme.primary,
                          fontWeight: 600),
                    )),
                Spacing.width(32)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
