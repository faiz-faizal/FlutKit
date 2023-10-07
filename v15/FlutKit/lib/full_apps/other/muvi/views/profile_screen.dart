import 'package:flutkit/full_apps/other/muvi/controllers/profile_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
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
  late CustomTheme customTheme;

  late ProfileController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = ProfileController();
  }

  Widget _buildSingleRow(String name, IconData icon) {
    return Padding(
      padding: MySpacing.y(6),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: theme.colorScheme.onBackground,
          ),
          MySpacing.width(20),
          Expanded(
              child: MyText.bodyMedium(
            name,
          )),
          MySpacing.width(20),
          Icon(
            LucideIcons.chevronRight,
            size: 20,
            color: theme.colorScheme.onBackground,
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
        body: Container(
          margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: MyText.titleMedium(
            'Profile',
            fontWeight: 600,
          ),
          centerTitle: true,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: ListView(
          padding: MySpacing.fromLTRB(20, 0, 20, 20),
          children: [
            _buildSingleRow('Edit Profile', LucideIcons.user),
            Divider(),
            _buildSingleRow('My Notifications', LucideIcons.bell),
            Divider(),
            _buildSingleRow('Watchlist', LucideIcons.eye),
            Divider(),
            _buildSingleRow('Language', LucideIcons.globe),
            Divider(),
            _buildSingleRow('Category', LucideIcons.grid),
            Divider(),
            _buildSingleRow('App Settings', LucideIcons.settings),
            Divider(),
            _buildSingleRow('Referrals', LucideIcons.users),
            Divider(),
            _buildSingleRow('Feedback & Help', LucideIcons.headphones),
            Divider(),
            _buildSingleRow('Management Subscriptions', LucideIcons.youtube),
            Divider(),
            MySpacing.height(20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Terms of Use',
                  style: MyTextStyle.bodySmall(
                      decoration: TextDecoration.underline,
                      letterSpacing: 0.2,
                      color: customTheme.muviPrimary),
                  children: <TextSpan>[
                    TextSpan(
                      text: '  and  ',
                      style: MyTextStyle.bodySmall(
                          color: theme.colorScheme.onBackground),
                    ),
                    TextSpan(
                      text: 'Privacy policy',
                      style: MyTextStyle.bodySmall(
                          decoration: TextDecoration.underline,
                          color: customTheme.muviPrimary),
                    ),
                  ],
                ),
              ),
            ),
            MySpacing.height(20),
            MyButton.block(
              onPressed: () {
                controller.logout();
              },
              elevation: 0,
              borderRadiusAll: 4,
              padding: MySpacing.y(20),
              backgroundColor: customTheme.muviPrimary,
              splashColor: customTheme.muviOnPrimary.withAlpha(30),
              child: MyText.labelMedium(
                'Sign Out',
                fontWeight: 600,
                color: customTheme.muviOnPrimary,
              ),
            ),
            MySpacing.height(20),
            Divider(),
            MySpacing.height(20),
            MyText.labelMedium(
              "© 2021 FlutKit, Design by Coderthemes",
              textAlign: TextAlign.center,
              letterSpacing: 0.2,
              color: customTheme.muviPrimary,
            ),
          ],
        ),
      );
    }
  }
}
