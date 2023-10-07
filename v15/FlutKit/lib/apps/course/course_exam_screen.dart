import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CourseExamScreen extends StatefulWidget {
  @override
  _CourseExamScreenState createState() => _CourseExamScreenState();
}

class _CourseExamScreenState extends State<CourseExamScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  bool isPlaying = false;

  int repeatType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          margin: MySpacing.fromLTRB(
              24, MySpacing.safeAreaTop(context) + 20, 24, 0),
          padding: MySpacing.all(16),
          decoration: BoxDecoration(
              color: customTheme.card,
              borderRadius: BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: customTheme.border, width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  MyText.bodyMedium("Scores",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Container(
                    margin: MySpacing.top(8),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(40),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    child: Center(
                      child: MyText.bodyLarge("10",
                          color: theme.colorScheme.primary, fontWeight: 700),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  MyText.bodyMedium("Time",
                      color: theme.colorScheme.onBackground, fontWeight: 600),
                  Container(
                    margin: MySpacing.top(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withAlpha(40),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                              child: MyText.bodyLarge("6",
                                  color: theme.colorScheme.primary,
                                  fontWeight: 700)),
                        ),
                        Container(
                            margin: MySpacing.horizontal(8),
                            child: MyText.bodyLarge(":",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 600)),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withAlpha(40),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                            child: MyText.bodyLarge("16",
                                color: theme.colorScheme.primary,
                                fontWeight: 700),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: MySpacing.zero,
            children: <Widget>[
              Container(
                margin: MySpacing.fromLTRB(24, 16, 24, 0),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image(
                          image: AssetImage(
                              './assets/images/apps/course/subject-6.jpg'),
                          width: MediaQuery.of(context).size.width * 0.28,
                          height: MediaQuery.of(context).size.width * 0.28,
                        )),
                    Container(
                      margin: MySpacing.left(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MyText.bodyLarge("Lesson 1\nOnline Exam",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 600),
                          Container(
                            margin: MySpacing.top(2),
                            child: MyText.bodySmall("5 Question from lesson 1",
                                color: theme.colorScheme.onBackground,
                                fontWeight: 500,
                                muted: true),
                          ),
                          MyText.bodySmall("MCQs",
                              color: theme.colorScheme.onBackground,
                              fontWeight: 500,
                              muted: true),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: MySpacing.fromLTRB(24, 24, 24, 0),
                child: Column(
                  children: <Widget>[
                    SingleQuestion(
                      qNumber: 1,
                      question: "Young's modulus is the property of?",
                      options: const [
                        "Gas only",
                        "Both Solid and Liquid",
                        "Solid only",
                        "Liquid only"
                      ],
                    ),
                    Container(
                      margin: MySpacing.top(16),
                      child: SingleQuestion(
                        qNumber: 2,
                        question:
                            "Movement of cell against concentration gradient is called",
                        options: const [
                          "osmosis",
                          "active transport",
                          "diffusion",
                          "passive transport"
                        ],
                      ),
                    ),
                    Container(
                      margin: MySpacing.vertical(16),
                      child: SingleQuestion(
                        qNumber: 3,
                        question: "Plants receive their nutrients mainly from",
                        options: const [
                          "chlorophyll",
                          "atmosphere",
                          "light",
                          "soil"
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class SingleQuestion extends StatefulWidget {
  final int? qNumber;
  final String? question;
  final List<String>? options;

  const SingleQuestion({Key? key, this.qNumber, this.question, this.options})
      : super(key: key);

  @override
  _SingleQuestionState createState() => _SingleQuestionState();
}

class _SingleQuestionState extends State<SingleQuestion> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);

    Widget buildOptions() {
      List<Widget> list = [];
      for (int i = 0; i < widget.options!.length; i++) {
        list.add(Container(
          margin: MySpacing.bottom(12),
          child: InkWell(
            onTap: () {
              setState(() {
                selectedOption = i;
              });
            },
            child: Row(
              children: <Widget>[
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      color: selectedOption == i
                          ? customTheme.colorSuccess
                          : customTheme.card,
                      borderRadius: BorderRadius.all(Radius.circular(
                        4,
                      ))),
                  child: Center(
                    child: selectedOption == i
                        ? Icon(
                            LucideIcons.check,
                            size: 16,
                            color: customTheme.onSuccess,
                          )
                        : Container(),
                  ),
                ),
                Container(
                  margin: MySpacing.left(16),
                  child: MyText.titleSmall(widget.options![i],
                      color: theme.colorScheme.onBackground, fontWeight: 500),
                )
              ],
            ),
          ),
        ));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: MySpacing.all(8),
          decoration: BoxDecoration(
              color: customTheme.card,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: MyText.bodyMedium("Q.${widget.qNumber}",
              color: theme.colorScheme.onBackground, fontWeight: 600),
        ),
        Expanded(
          child: Container(
            margin: MySpacing.left(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText.bodyLarge(widget.question.toString(),
                    color: theme.colorScheme.onBackground, fontWeight: 600),
                Container(
                  margin: MySpacing.top(16),
                  child: Column(
                    children: <Widget>[buildOptions()],
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
