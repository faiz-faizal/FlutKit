import 'package:flutkit/full_apps/m3/learning/controllers/profile_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/images.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late ProfileController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = ProfileController();
  }

  Widget _buildSingleSetting(
      String setting, String subSetting, IconData icon, Color? color) {
    return Padding(
      padding: MySpacing.y(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color),
          MySpacing.width(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText.titleSmall(setting, fontWeight: 600, color: color),
              MySpacing.height(4),
              MyText.bodySmall(
                subSetting,
                fontWeight: 600,
                xMuted: true,
                fontSize: 10,
              ),
            ],
          ),
        ],
      ),
    );
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
        body: LoadingEffect.getSearchLoadingScreen(context),
      );
    } else {
      return Scaffold(
        body: Padding(
          padding: MySpacing.x(20),
          child: Column(
            children: [
              Center(
                child: MyContainer(
                  onTap: () {
                    controller.goToEditProfile();
                  },
                  color: Colors.transparent,
                  paddingAll: 0,
                  borderRadiusAll: 4,
                  height: 100,
                  width: 100,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        child: Image(
                          height: 100,
                          width: 100,
                          image: AssetImage(Images.learningProfile),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: MyCard(
                          paddingAll: 2,
                          borderRadiusAll: 4,
                          clipBehavior: Clip.none,
                          child: MyContainer(
                            paddingAll: 4,
                            borderRadiusAll: 4,
                            color: theme.colorScheme.primaryContainer,
                            child: Icon(
                              Icons.camera_alt,
                              size: 16,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MySpacing.height(20),
              MyText.bodyLarge(
                'Naira Grey',
                fontWeight: 700,
              ),
              MySpacing.height(20),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        MyText.bodyMedium(
                          '22',
                          fontWeight: 700,
                        ),
                        MySpacing.height(6),
                        MyText.bodySmall(
                          'Courses',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: [
                        MyText.bodyMedium(
                          '15',
                          fontWeight: 700,
                        ),
                        MySpacing.height(6),
                        MyText.bodySmall(
                          'Mentors',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: [
                        MyText.bodyMedium(
                          '38',
                          fontWeight: 700,
                        ),
                        MySpacing.height(6),
                        MyText.bodySmall(
                          'Friends',
                          fontWeight: 600,
                          xMuted: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(20),
              Divider(),
              _buildSingleSetting('Preferences', 'Themes, Settings',
                  LucideIcons.settings, theme.colorScheme.onBackground),
              Divider(),
              _buildSingleSetting(
                  'Notification',
                  'Ringtone, Message, Notification',
                  LucideIcons.bell,
                  theme.colorScheme.onBackground),
              Divider(),
              _buildSingleSetting('Help', 'Contact Us',
                  LucideIcons.messageCircle, theme.colorScheme.onBackground),
              Divider(),
              _buildSingleSetting('About', 'About the application',
                  LucideIcons.alertCircle, theme.colorScheme.onBackground),
              Divider(),
              InkWell(
                onTap: () {
                  controller.logout();
                },
                child: _buildSingleSetting('Log Out', 'Exit from your account',
                    LucideIcons.logOut, theme.colorScheme.primary),
              ),
            ],
          ),
        ),
      );
    }
  }
}
