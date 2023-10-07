import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HandymanRatingScreen extends StatefulWidget {
  @override
  _HandymanRatingScreenState createState() => _HandymanRatingScreenState();
}

class _HandymanRatingScreenState extends State<HandymanRatingScreen> {
  int? _radioValue = 1;

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
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(LucideIcons.chevronLeft),
            ),
            title: MyText.titleLarge("Send us Feedback", fontWeight: 600)),
        body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: MySpacing.symmetric(vertical: 24, horizontal: 16),
              color: theme.colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyText.titleMedium("Send us your feedback!", fontWeight: 700),
                  Container(
                      margin: MySpacing.top(4),
                      child: MyText.bodyMedium(
                          "Do you have a suggestion or found a mistakes?",
                          fontWeight: 500)),
                  MyText.bodyMedium("Let us know by fill this form",
                      fontWeight: 500),
                ],
              ),
            ),
            Container(
              padding: MySpacing.only(top: 16, left: 16),
              child: MyText.titleMedium("How was your experience?",
                  fontWeight: 700),
            ),
            Container(
              padding: MySpacing.only(top: 8, left: 16),
              child: Row(
                children: <Widget>[
                  Icon(LucideIcons.smile,
                      color: theme.colorScheme.primary, size: 32),
                  Container(
                      margin: MySpacing.left(4),
                      child: Icon(LucideIcons.annoyed,
                          color: theme.colorScheme.onBackground.withAlpha(160),
                          size: 32)),
                  Container(
                      margin: MySpacing.left(4),
                      child: Icon(LucideIcons.frown,
                          color: theme.colorScheme.onBackground.withAlpha(160),
                          size: 32)),
                ],
              ),
            ),
            Container(
              padding: MySpacing.only(top: 24, left: 16, right: 16),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Describe your experience",
                  isDense: true,
                  filled: true,
                  fillColor: theme.colorScheme.background,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                textCapitalization: TextCapitalization.sentences,
                minLines: 5,
                maxLines: 10,
              ),
            ),
            Container(
              padding: MySpacing.only(top: 24, left: 16, right: 16),
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 1,
                    visualDensity: VisualDensity.compact,
                    activeColor: theme.colorScheme.primary,
                    groupValue: _radioValue,
                    onChanged: (int? value) {
                      setState(() {
                        _radioValue = value;
                      });
                    },
                  ),
                  MyText.bodyMedium("Suggestion", fontWeight: 600),
                  Container(
                    margin: MySpacing.left(8),
                    child: Radio(
                      value: 2,
                      visualDensity: VisualDensity.compact,
                      activeColor: theme.colorScheme.primary,
                      groupValue: _radioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _radioValue = value;
                        });
                      },
                    ),
                  ),
                  MyText.bodyMedium("Mistakes", fontWeight: 600),
                  Container(
                    margin: MySpacing.left(8),
                    child: Radio(
                      value: 3,
                      visualDensity: VisualDensity.compact,
                      activeColor: theme.colorScheme.primary,
                      groupValue: _radioValue,
                      onChanged: (int? value) {
                        setState(() {
                          _radioValue = value;
                        });
                      },
                    ),
                  ),
                  MyText.bodyMedium("Others", fontWeight: 600),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: MySpacing.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withAlpha(28),
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    padding: MaterialStateProperty.all(MySpacing.xy(16, 0))),
                child: MyText.bodyLarge("Send Feedback",
                    color: theme.colorScheme.onSecondary),
              ),
            ),
          ],
        ));
  }
}
