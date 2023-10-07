import 'package:flutkit/full_apps/m3/homemade/controllers/profile_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late ProfileController profileController;

  @override
  void initState() {
    super.initState();
    profileController = ProfileController();
    theme = AppTheme.homemadeTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: profileController,
        tag: 'profile_controller',
        builder: (profileController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (profileController.uiLoading) {
      return Scaffold(
        body: Container(
            margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
            )),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: MySpacing.fromLTRB(24, 48, 24, 24),
          children: [
            MyContainer(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: AssetImage(profileController.user.url),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  MySpacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText.bodyLarge(profileController.user.name,
                            fontWeight: 700),
                        MySpacing.width(8),
                        MyText.bodyMedium(
                          profileController.user.email,
                        ),
                        MySpacing.height(8),
                        MyButton.outlined(
                            onPressed: () {},
                            splashColor:
                                theme.colorScheme.secondary.withAlpha(40),
                            borderColor: theme.colorScheme.secondary,
                            padding: MySpacing.xy(16, 4),
                            borderRadiusAll: 32,
                            child: MyText.bodySmall("Edit profile",
                                color: theme.colorScheme.secondary))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(16),
            MyContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    "Favorite Items",
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
                      theme.colorScheme.secondary.withAlpha(100),
                  activeTrackColor: theme.colorScheme.secondary.withAlpha(150),
                  activeColor: theme.colorScheme.secondary,
                  title: MyText.bodyMedium(
                    "Notifications",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      profileController.notification = value;
                    });
                  },
                  value: profileController.notification,
                ),
                MySpacing.height(24),
                Center(
                    child: MyButton.rounded(
                  onPressed: () {
                    profileController.logout();
                  },
                  splashColor: theme.colorScheme.primary.withAlpha(60),
                  elevation: 0,
                  padding: MySpacing.xy(20, 16),
                  backgroundColor: theme.colorScheme.primary.withAlpha(40),
                  child: MyText.labelMedium(
                    "LOGOUT",
                    color: theme.colorScheme.primary,
                    letterSpacing: 0.5,
                  ),
                ))
              ],
            )),
            MySpacing.height(16),
            Divider(
              thickness: 0.8,
            ),
            MySpacing.height(8),
            MyText.bodySmall(
              "© 2021 FlutKit. Design by Coderthemes",
              muted: true,
              textAlign: TextAlign.center,
              letterSpacing: 0,
            )
          ],
        ),
      );
    }
  }
}
