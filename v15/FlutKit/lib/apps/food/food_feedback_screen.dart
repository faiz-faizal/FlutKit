import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FoodFeedbackScreen extends StatefulWidget {
  @override
  _FoodFeedbackScreenState createState() => _FoodFeedbackScreenState();
}

class _FoodFeedbackScreenState extends State<FoodFeedbackScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance.addPostFrameCallback((_) => _showDialog());
  }

  bool? checkDT = true, checkQTY = false, checkQ = true, checkOther = false;

  int selectedEmote = 2;

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => RatingDialog());
  }

  double findAspectRatio(double width) {
    //Logic for aspect ratio of grid view
    return (width / 2 - 24) / ((width / 2 - 24) + 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 24,
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: MyText.titleMedium("Feedback", fontWeight: 600),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 24, bottom: 24),
          children: <Widget>[
            Center(
              child: MyText.titleMedium("How was last order?",
                  color: theme.colorScheme.onBackground, fontWeight: 600),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: feedbackEmote(),
            ),
            Container(
              margin: EdgeInsets.only(left: 48, right: 48, top: 32),
              child: Column(
                children: <Widget>[
                  Divider(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        checkQ = checkQ;
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
                          activeColor: theme.colorScheme.primary,
                        ),
                        MyText.titleSmall(
                          "Quality",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        checkDT = checkDT;
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
                          activeColor: theme.colorScheme.primary,
                        ),
                        MyText.titleSmall(
                          "Delivery Time",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        checkQTY = checkQTY;
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
                          activeColor: theme.colorScheme.primary,
                        ),
                        MyText.titleSmall(
                          "Quantity",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        checkOther = checkOther;
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
                          activeColor: theme.colorScheme.primary,
                        ),
                        MyText.titleSmall(
                          "Other",
                          color: theme.colorScheme.onBackground,
                          fontWeight: 500,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 24, left: 32, right: 32),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Describe your experience",
                  isDense: true,
                  filled: true,
                  fillColor: customTheme.card,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                textCapitalization: TextCapitalization.sentences,
                minLines: 5,
                maxLines: 10,
              ),
            ),
            MySpacing.height(20),
            Center(
              child: MyButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 0,
                borderRadiusAll: 4,
                padding: MySpacing.xy(16, 16),
                child: MyText.bodyMedium("Review".toUpperCase(),
                    color: theme.colorScheme.onPrimary,
                    fontWeight: 600,
                    letterSpacing: 0.8),
              ),
            ),
          ],
        ));
  }

  Widget feedbackEmote() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              selectedEmote = 0;
            });
          },
          child: Icon(
            selectedEmote == 0 ? LucideIcons.frown : LucideIcons.frown,
            color: selectedEmote == 0
                ? theme.colorScheme.primary
                : theme.colorScheme.onBackground,
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
            selectedEmote == 1 ? LucideIcons.annoyed : LucideIcons.annoyed,
            color: selectedEmote == 1
                ? theme.colorScheme.primary
                : theme.colorScheme.onBackground,
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
            selectedEmote == 2 ? LucideIcons.smile : LucideIcons.smile,
            color: selectedEmote == 2
                ? theme.colorScheme.primary
                : theme.colorScheme.onBackground,
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
            selectedEmote == 3 ? LucideIcons.laugh : LucideIcons.laugh,
            color: selectedEmote == 3
                ? theme.colorScheme.primary
                : theme.colorScheme.onBackground,
            size: 40,
          ),
        ),
      ],
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
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: theme.colorScheme.background,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 24, bottom: 24, left: 24, right: 24),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MyText.titleLarge("Enjoying Food?",
                        fontWeight: 700, letterSpacing: 0),
                    Container(
                      margin: EdgeInsets.only(top: 24),
                      child: MyText.bodyMedium(
                          "How would you rate our service?",
                          fontWeight: 500,
                          letterSpacing: 0.3),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {},
                              child: MyText.bodySmall("NOT NOW",
                                  letterSpacing: 0,
                                  color: theme.colorScheme.onBackground)),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: MyText.bodySmall("RATE IT",
                                  color: theme.colorScheme.primary,
                                  fontWeight: 600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
