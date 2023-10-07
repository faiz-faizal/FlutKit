import 'package:flutkit/full_apps/m3/estate/controllers/profile_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
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
    controller = ProfileController();
    theme = AppTheme.estateTheme;
  }

  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        MyContainer(
          paddingAll: 8,
          borderRadiusAll: Constant.containerRadius.small,
          color: theme.colorScheme.primaryContainer,
          child: Icon(
            icon,
            color: theme.colorScheme.primary,
            size: 20,
          ),
        ),
        MySpacing.width(16),
        Expanded(
          child: MyText.bodySmall(
            title!,
            letterSpacing: 0.5,
          ),
        ),
        MySpacing.width(16),
        Icon(
          Icons.keyboard_arrow_right,
          color: theme.colorScheme.onBackground.withAlpha(160),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: controller,
        tag: 'profile_controller',
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Container(
                padding: MySpacing.top(MySpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                      child: controller.showLoading
                          ? LinearProgressIndicator(
                              color: theme.colorScheme.primary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Container(
          child: LoadingEffect.getSearchLoadingScreen(
        context,
      ));
    } else {
      return ListView(
        padding: MySpacing.fromLTRB(20, MySpacing.safeAreaTop(context), 20, 20),
        children: [
          Center(
            child: MyContainer(
              paddingAll: 0,
              borderRadiusAll: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(Constant.containerRadius.large),
                ),
                child: Image(
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/images/profile/avatar_4.jpg'),
                ),
              ),
            ),
          ),
          MySpacing.height(24),
          MyText.titleMedium(
            'Bessie Cooper',
            textAlign: TextAlign.center,
            fontWeight: 600,
            letterSpacing: 0.8,
          ),
          MySpacing.height(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyContainer.rounded(
                color: theme.colorScheme.primary,
                height: 6,
                width: 6,
                child: Container(),
              ),
              MySpacing.width(6),
              MyText.bodySmall(
                'Premium (9 days)',
                color: theme.colorScheme.primary,
                muted: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          MySpacing.height(24),
          MyText.bodyLarge(
            'General',
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
            xMuted: true,
          ),
          MySpacing.height(24),
          _buildSingleRow(
              title: 'Subscription & payment', icon: LucideIcons.creditCard),
          MySpacing.height(8),
          Divider(),
          MySpacing.height(8),
          _buildSingleRow(title: 'Profile settings', icon: LucideIcons.user),
          MySpacing.height(8),
          Divider(),
          MySpacing.height(8),
          _buildSingleRow(title: 'Password', icon: LucideIcons.lock),
          MySpacing.height(8),
          Divider(),
          MySpacing.height(8),
          _buildSingleRow(title: 'Notifications', icon: LucideIcons.bell),
          MySpacing.height(8),
          Divider(),
          MySpacing.height(8),
          _buildSingleRow(title: 'Logout', icon: LucideIcons.logOut),
        ],
      );
    }
  }
}
