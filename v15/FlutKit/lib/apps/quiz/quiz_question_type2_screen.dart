import 'dart:async';

import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class QuizQuestionType2Screen extends StatefulWidget {
  @override
  _QuizQuestionType2ScreenState createState() =>
      _QuizQuestionType2ScreenState();
}

class _QuizQuestionType2ScreenState extends State<QuizQuestionType2Screen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    _selected = [];
    startTimer();
  }

  int quizTimeSecond = 30;
  double remainingSecond = 30;
  late List<int?> _selected;
  bool isFlag = false, isFavourite = false;

  final List<String> _simpleChoice = ["Report", "Quit"];

  Timer? _timer;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  void startTimer() {
    _timer = Timer.periodic(
        Duration(milliseconds: 200),
        (Timer timer) => setState(() {
              if (remainingSecond > 0.200) {
                remainingSecond = remainingSecond - 0.200;
              } else {
                remainingSecond = 0;
                timer.cancel();
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: Column(
              children: <Widget>[
                Container(
                  padding: MySpacing.fromLTRB(16, 40, 16, 0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          LucideIcons.chevronLeft,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            MyText.titleMedium("Chemistry",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 700),
                            MyText.bodySmall("Question 7/20",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500)
                          ],
                        ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return _simpleChoice.map((String choice) {
                            return PopupMenuItem(
                              value: choice,
                              child: MyText.bodyMedium(choice,
                                  color: theme.colorScheme.onBackground,
                                  letterSpacing: 0.2),
                            );
                          }).toList();
                        },
                        color: theme.colorScheme.background,
                        icon: Icon(LucideIcons.moreVertical,
                            color: theme.colorScheme.onBackground),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: MySpacing.fromLTRB(48, 0, 48, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MyText.titleLarge(
                          "The metallurgical process in which a metal is obtained in a fused state is called?",
                          letterSpacing: 0.2,
                          wordSpacing: 0.5,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600,
                          textAlign: TextAlign.center,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            questionOption(option: "Smelting", index: 0),
                            questionOption(option: "Roasting", index: 1),
                            questionOption(option: "Calcinations", index: 2),
                            questionOption(
                                option: "Froth floatation", index: 3),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      LucideIcons.chevronLeft,
                                      color: theme.colorScheme.primary,
                                      size: 20,
                                    ),
                                    Container(
                                      margin: MySpacing.left(8),
                                      child: MyText.bodySmall("PREV",
                                          letterSpacing: 0.5,
                                          color: theme.colorScheme.primary,
                                          fontWeight: 600),
                                    ),
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: <Widget>[
                                    MyText.bodySmall(
                                        _selected.isEmpty ? "SKIP" : "NEXT",
                                        letterSpacing: 0.5,
                                        color: theme.colorScheme.primary,
                                        fontWeight: 600),
                                    Container(
                                      margin: MySpacing.left(4),
                                      child: Icon(
                                        LucideIcons.chevronRight,
                                        color: theme.colorScheme.primary,
                                        size: 20,
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: customTheme.card,
                  padding: MySpacing.fromLTRB(32, 16, 32, 16),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFlag = !isFlag;
                          });
                        },
                        child: Icon(
                          isFlag ? Icons.flag : Icons.flag_outlined,
                          color: isFlag
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onBackground,
                          size: 26,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: buildTimer(),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isFavourite = !isFavourite;
                          });
                        },
                        child: Icon(
                          isFavourite
                              ? Icons.favorite_outline
                              : Icons.favorite_outlined,
                          color: isFavourite
                              ? theme.colorScheme.onBackground
                              : theme.colorScheme.primary,
                          size: 26,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
      },
    );
  }

  Widget questionOption({required String option, int? index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selected.contains(index)) {
            _selected.remove(index);
          } else {
            _selected.add(index);
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: _selected.contains(index)
                ? theme.colorScheme.primary
                : Colors.transparent,
            border: Border.all(
                color: _selected.contains(index)
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        padding: MySpacing.fromLTRB(0, 12, 0, 12),
        margin: MySpacing.fromLTRB(48, 0, 48, 16),
        child: Center(
          child: MyText.bodyLarge(option,
              color: _selected.contains(index)
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onBackground,
              fontWeight: 600),
        ),
      ),
    );
  }

  Widget buildTimer() {
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            valueColor: remainingSecond > 5
                ? AlwaysStoppedAnimation<Color>(
                    theme.colorScheme.primary,
                  )
                : AlwaysStoppedAnimation<Color>(
                    customTheme.colorError,
                  ),
            value: (quizTimeSecond - remainingSecond) / quizTimeSecond,
          ),
          MyText.bodyLarge(remainingSecond.ceil().toString(),
              color: theme.colorScheme.onBackground, fontWeight: 600)
        ],
      ),
    );
  }
}
