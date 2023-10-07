import 'package:flutkit/full_apps/animations/rental_service/controllers/profile_controller.dart';
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
    theme = AppTheme.rentalServiceTheme;
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
            body: Padding(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 20, 20, 20),
              child: Column(
                children: [
                  profile(),
                  MySpacing.height(20),
                  statistics(),
                  MySpacing.height(32),
                  singleRow(LucideIcons.clock, "Rides history"),
                  singleRow(LucideIcons.creditCard, "Payment Methods"),
                  singleRow(LucideIcons.helpCircle, "FAQ"),
                  singleRow(LucideIcons.bookOpen, "Terms and Conditions"),
                  singleRow(LucideIcons.settings, "App Settings"),
                  singleRow(LucideIcons.smile, "Support Center"),
                  logout(),
                ],
              ),
            ),
          );
        });
  }

  Widget profile() {
    return Row(
      children: [
        MyContainer.rounded(
          height: 80,
          paddingAll: 0,
          child: Image(
            image: AssetImage(
                "assets/images/full_apps/rental_service/images/profile.jpg"),
          ),
        ),
        MySpacing.width(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleMedium(
              "Smith Williams",
              fontWeight: 700,
            ),
            MySpacing.height(4),
            MyText.bodySmall(
              "smithwilliams@gmail.com",
              xMuted: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget statistics() {
    return Row(
      children: [
        Expanded(
          child: MyContainer(
            padding: MySpacing.xy(24, 16),
            color: theme.colorScheme.primaryContainer,
            borderRadiusAll: Constant.containerRadius.small,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.drive_eta_outlined,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                MySpacing.height(8),
                MyText.headlineSmall(
                  "2451",
                  fontWeight: 700,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                MyText.bodySmall(
                  "Total km",
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ],
            ),
          ),
        ),
        MySpacing.width(20),
        Expanded(
          child: MyContainer(
            padding: MySpacing.xy(24, 16),
            color: theme.colorScheme.primaryContainer,
            borderRadiusAll: Constant.containerRadius.small,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.directions_bike_outlined,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                MySpacing.height(8),
                MyText.headlineSmall(
                  "15",
                  fontWeight: 700,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                MyText.bodySmall(
                  "Total rides",
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget singleRow(IconData icon, String title) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            MySpacing.width(16),
            MyText.bodyMedium(
              title,
              fontWeight: 600,
            ),
          ],
        ),
        MySpacing.height(6),
        Divider(),
        MySpacing.height(4),
      ],
    );
  }

  Widget logout() {
    return MyButton.small(
        padding: MySpacing.xy(16, 16),
        elevation: 0,
        onPressed: () {
          controller.goBack();
        },
        child: MyText.labelLarge(
          "Logout",
          fontWeight: 700,
          color: theme.colorScheme.onPrimary,
        ));
  }
}
