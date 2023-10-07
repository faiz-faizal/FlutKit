import 'package:flutkit/apps/news/news_full_app.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class NewsCategoryScreen extends StatefulWidget {
  @override
  _NewsCategoryScreenState createState() => _NewsCategoryScreenState();
}

class _NewsCategoryScreenState extends State<NewsCategoryScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  List<String> selectedChoices = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  elevation: 0,
                  title: MyText.titleMedium(
                    "Select Category",
                    color: theme.colorScheme.onBackground,
                    fontWeight: 600,
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsFullApp()));
                  },
                  elevation: 2,
                  label: MyText.titleSmall("DONE",
                      fontWeight: 600,
                      color: theme.colorScheme.onPrimary,
                      letterSpacing: 0.3),
                  icon: Icon(
                    LucideIcons.arrowRight,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                body: Container(
                  padding: MySpacing.all(24),
                  child: Wrap(
                    children: _buildChoiceList(),
                  ),
                )));
      },
    );
  }

  _buildChoiceList() {
    List<String> categoryList = [
      "ECom",
      "Automobile",
      "Crimes",
      "Business",
      "Fitness",
      "Astro",
      "Politics",
      "Relationship",
      "Food",
      "Electronics",
      "Health",
      "Tech",
      "Entertainment",
      "World",
      "Sports",
      "Other",
    ];

    List<Widget> choices = [];
    for (var item in categoryList) {
      choices.add(Container(
        padding: MySpacing.all(8),
        child: ChoiceChip(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          selectedColor: theme.colorScheme.primary,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              selectedChoices.contains(item)
                  ? Icon(
                      LucideIcons.check,
                      size: 16,
                      color: theme.colorScheme.onPrimary,
                    )
                  : Container(),
              selectedChoices.contains(item)
                  ? SizedBox(
                      width: 8,
                    )
                  : Container(),
              MyText.bodyMedium(item,
                  color: selectedChoices.contains(item)
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onBackground),
            ],
          ),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
        ),
      ));
    }
    return choices;
  }
}
