import 'package:flutkit/full_apps/other/cookify/models/user.dart';
import 'package:flutkit/full_apps/other/cookify/views/splash_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CookifyProfileScreen extends StatefulWidget {
  @override
  _CookifyProfileScreenState createState() => _CookifyProfileScreenState();
}

class _CookifyProfileScreenState extends State<CookifyProfileScreen> {
  late User user;
  late CustomTheme customTheme;
  late ThemeData theme;

  bool notification = true, offlineReading = false;

  @override
  void initState() {
    super.initState();
    user = User.getOne();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.cookifyPrimary.withAlpha(40))),
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: MySpacing.fromLTRB(24, 36, 24, 24),
            children: [
              MyContainer(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: AssetImage(user.image),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    MySpacing.width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyLarge(user.name, fontWeight: 700),
                          MySpacing.width(8),
                          MyText.bodyMedium(
                            user.email,
                          ),
                          MySpacing.height(8),
                          MyButton.outlined(
                              onPressed: () {},
                              splashColor:
                                  customTheme.cookifyPrimary.withAlpha(40),
                              borderColor: customTheme.cookifyPrimary,
                              padding: MySpacing.xy(16, 4),
                              borderRadiusAll: 32,
                              child: MyText.bodySmall("Edit profile",
                                  color: customTheme.cookifyPrimary))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MySpacing.height(24),
              MyContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.titleMedium(
                    "Option",
                    fontWeight: 700,
                  ),
                  MySpacing.height(8),
                  SwitchListTile(
                    dense: true,
                    contentPadding: MySpacing.zero,
                    inactiveTrackColor:
                        customTheme.cookifyPrimary.withAlpha(100),
                    activeTrackColor: customTheme.cookifyPrimary.withAlpha(150),
                    activeColor: customTheme.cookifyPrimary,
                    title: MyText.bodyMedium(
                      "Notifications",
                      letterSpacing: 0,
                    ),
                    onChanged: (value) {
                      setState(() {
                        notification = value;
                      });
                    },
                    value: notification,
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: MySpacing.zero,
                    visualDensity: VisualDensity.compact,
                    title: MyText.bodyMedium(
                      "Language",
                      letterSpacing: 0,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  SwitchListTile(
                    dense: true,
                    contentPadding: MySpacing.zero,
                    inactiveTrackColor:
                        customTheme.cookifyPrimary.withAlpha(100),
                    activeTrackColor: customTheme.cookifyPrimary.withAlpha(150),
                    activeColor: customTheme.cookifyPrimary,
                    title: MyText.bodyMedium(
                      "Offline Reading",
                      letterSpacing: 0,
                    ),
                    onChanged: (value) {
                      setState(() {
                        offlineReading = value;
                      });
                    },
                    value: offlineReading,
                  ),
                  Divider(
                    thickness: 0.8,
                  ),
                  MySpacing.height(8),
                  MyText.titleMedium(
                    "Account",
                    fontWeight: 700,
                  ),
                  MySpacing.height(8),
                  ListTile(
                    dense: true,
                    contentPadding: MySpacing.zero,
                    visualDensity: VisualDensity.compact,
                    title: MyText.bodyMedium(
                      "Personal Information",
                      letterSpacing: 0,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: MySpacing.zero,
                    visualDensity: VisualDensity.compact,
                    title: MyText.bodyMedium(
                      "Country",
                      letterSpacing: 0,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: MySpacing.zero,
                    visualDensity: VisualDensity.compact,
                    title: MyText.bodyMedium(
                      "Favorite Recipes",
                      letterSpacing: 0,
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                  MySpacing.height(16),
                  Center(
                      child: MyButton.rounded(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(
                        MaterialPageRoute(
                            builder: (context) => CookifySplashScreen()),
                      );
                    },
                    padding: MySpacing.xy(16, 16),
                    elevation: 2,
                    backgroundColor: customTheme.cookifyPrimary,
                    child: MyText.labelLarge(
                      "LOGOUT",
                      color: customTheme.cookifyOnPrimary,
                    ),
                  ))
                ],
              )),
              MySpacing.height(24),
              MyContainer(
                  color: customTheme.cookifyPrimary.withAlpha(40),
                  padding: MySpacing.xy(16, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        LucideIcons.mic,
                        size: 28,
                        color: customTheme.cookifyPrimary,
                      ),
                      MySpacing.width(12),
                      MyText.bodySmall(
                        "Feel Free to Ask, We Ready to Help",
                        color: customTheme.cookifyPrimary,
                        letterSpacing: 0,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
