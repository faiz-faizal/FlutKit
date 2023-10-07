import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/full_apps/m3/cookify/controllers/profile_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:flutkit/helpers/theme/constant.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late ProfileController controller;

  bool notification = true, offlineReading = false;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.cookifyTheme;
    controller = ProfileController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: controller,
        tag: 'profile_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: MySpacing.fromLTRB(
              20, MySpacing.safeAreaTop(context) + 20, 20, 20),
          children: [
            MyContainer(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: AssetImage(controller.user.image),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  MySpacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyLarge(controller.user.name, fontWeight: 700),
                        MySpacing.width(8),
                        MyText.bodyMedium(
                          controller.user.email,
                        ),
                        MySpacing.height(8),
                        MyButton.outlined(
                            onPressed: () {},
                            splashColor: theme.colorScheme.primaryContainer,
                            borderColor: theme.colorScheme.primary,
                            padding: MySpacing.xy(16, 4),
                            borderRadiusAll: 32,
                            child: MyText.bodySmall("Edit profile",
                                color: theme.colorScheme.primary)),
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
                  inactiveTrackColor: theme.colorScheme.primary.withAlpha(100),
                  activeTrackColor: theme.colorScheme.primary.withAlpha(150),
                  activeColor: theme.colorScheme.primary,
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
                  inactiveTrackColor: theme.colorScheme.primary.withAlpha(100),
                  activeTrackColor: theme.colorScheme.primary.withAlpha(150),
                  activeColor: theme.colorScheme.primary,
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
                    controller.logout();
                  },
                  elevation: 0,
                  borderRadiusAll: Constant.buttonRadius.large,
                  splashColor: theme.colorScheme.onPrimary.withAlpha(30),
                  backgroundColor: theme.colorScheme.primary,
                  child: MyText.labelLarge(
                    "LOGOUT",
                    color: theme.colorScheme.onPrimary,
                  ),
                ))
              ],
            )),
            MySpacing.height(24),
            MyContainer(
                color: theme.colorScheme.primaryContainer,
                padding: MySpacing.xy(16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      LucideIcons.mic,
                      size: 24,
                      color: theme.colorScheme.primary,
                    ),
                    MySpacing.width(12),
                    MyText.bodySmall(
                      "Feel Free to Ask, We Ready to Help",
                      color: theme.colorScheme.primary,
                      letterSpacing: 0,
                    )
                  ],
                ))
          ],
        ),
      );
    }
  }
}
