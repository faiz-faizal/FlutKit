import 'package:flutkit/helpers/localizations/language.dart';
import 'package:flutkit/helpers/theme/app_notifier.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectLanguageDialog extends StatefulWidget {
  const SelectLanguageDialog({Key? key}) : super(key: key);

  @override
  _SelectLanguageDialogState createState() => _SelectLanguageDialogState();
}

class _SelectLanguageDialogState extends State<SelectLanguageDialog> {
  late ThemeData themeData;

  Language currentLanguage = Language.currentLanguage;
  List<Language> languages = Language.languages;

  @override
  initState() {
    super.initState();
  }

  Future<void> handleRadioValueChange(Language language) async {
    setState(() {
      Provider.of<AppNotifier>(context, listen: false).changeLanguage(language);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        themeData = AppTheme.theme;

        return Dialog(
          child: Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
                mainAxisSize: MainAxisSize.min, children: _buildOptions()),
          ),
        );
      },
    );
  }

  _buildOptions() {
    List<Widget> list = [];

    for (Language language in Language.languages) {
      list.add(InkWell(
        onTap: () {
          handleRadioValueChange(language);
        },
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              Radio<Language>(
                onChanged: (dynamic value) {
                  handleRadioValueChange(language);
                },
                groupValue: currentLanguage,
                value: language,
                activeColor: themeData.colorScheme.primary,
              ),
              MyText.titleSmall(
                language.languageName,
                fontWeight: 600,
              ),
            ],
          ),
        ),
      ));
    }

    return list;
  }
}
