import 'package:flutkit/full_apps/animations/nft/controllers/profile_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
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
    theme = AppTheme.nftTheme;
    controller = ProfileController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: controller,
        tag: 'profile_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: MySpacing.fromLTRB(
                    20, MySpacing.safeAreaTop(context) + 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    image(),
                    MySpacing.height(4),
                    Align(
                        alignment: Alignment.center,
                        child: MyText.titleMedium(
                          "John Micheal",
                          fontWeight: 700,
                        )),
                    MySpacing.height(4),
                    verified(),
                    MySpacing.height(20),
                    settings(),
                    MySpacing.height(16),
                    logout(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget image() {
    return Center(
      child: MyContainer.rounded(
        height: 100,
        paddingAll: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/full_apps/nft/images/profile.jpg'),
        ),
      ),
    );
  }

  Widget verified() {
    return Align(
      alignment: Alignment.center,
      child: MyContainer(
        padding: MySpacing.fromLTRB(6, 4, 12, 4),
        borderRadiusAll: Constant.containerRadius.large,
        color: theme.colorScheme.primaryContainer,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: theme.colorScheme.onPrimaryContainer,
              size: 16,
            ),
            MySpacing.width(8),
            MyText.bodySmall(
              "Verified",
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: 600,
            ),
          ],
        ),
      ),
    );
  }

  Widget settings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyMedium(
          "Account Settings",
          fontWeight: 700,
          xMuted: true,
        ),
        MySpacing.height(20),
        singleRow(Icons.dashboard, "Dashboard", "Your portfolio assets"),
        Divider(),
        MySpacing.height(8),
        singleRow(Icons.admin_panel_settings, "Privacy Setting",
            "PIN & Biometric security"),
        MySpacing.height(20),
        MyText.bodyMedium(
          "General Settings",
          fontWeight: 700,
          xMuted: true,
        ),
        MySpacing.height(20),
        singleRow(
            Icons.account_balance, "Bank Account", "Manage your account bank"),
        Divider(),
        MySpacing.height(8),
        singleRow(
            Icons.notifications, "Notification", "Manage your notification"),
        Divider(),
        MySpacing.height(8),
        singleRow(Icons.redeem, "Refferal Code", "Manage your notification"),
      ],
    );
  }

  Widget singleRow(IconData icon, String title, String subTitle) {
    return Padding(
      padding: MySpacing.bottom(8),
      child: Row(
        children: [
          MyContainer.rounded(
            paddingAll: 12,
            child: Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 20,
            ),
          ),
          MySpacing.width(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  title,
                  fontWeight: 600,
                ),
                MySpacing.height(2),
                MyText.bodySmall(subTitle),
              ],
            ),
          ),
          MySpacing.width(20),
          Icon(
            LucideIcons.chevronRight,
            size: 18,
          ),
        ],
      ),
    );
  }

  Widget logout() {
    return Align(
      alignment: Alignment.center,
      child: MyButton.small(
        elevation: 0,
        onPressed: () {
          controller.goBack();
        },
        borderRadiusAll: Constant.buttonRadius.xs,
        padding: MySpacing.xy(16, 16),
        child: MyText.labelLarge(
          "Logout",
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
