import 'package:flutkit/full_apps/other/estate/controllers/profile_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class EstateProfileScreen extends StatefulWidget {
  const EstateProfileScreen({Key? key}) : super(key: key);

  @override
  _EstateProfileScreenState createState() => _EstateProfileScreenState();
}

class _EstateProfileScreenState extends State<EstateProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late EstateProfileController estateProfileController;

  @override
  void initState() {
    super.initState();
    estateProfileController = EstateProfileController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  Widget _buildSingleRow({String? title, IconData? icon}) {
    return Row(
      children: [
        MyContainer(
          paddingAll: 8,
          borderRadiusAll: 4,
          color: theme.colorScheme.onBackground.withAlpha(20),
          child: Icon(
            icon,
            color: customTheme.estatePrimary,
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
    return GetBuilder<EstateProfileController>(
        init: estateProfileController,
        tag: 'estate_profile_controller',
        builder: (estateProfileController) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: 2,
                    child: estateProfileController.showLoading
                        ? LinearProgressIndicator(
                            color: customTheme.estatePrimary,
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
          );
        });
  }

  Widget _buildBody() {
    if (estateProfileController.uiLoading) {
      return Container(
          margin: MySpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return ListView(
        padding: MySpacing.all(24),
        children: [
          Center(
            child: MyContainer(
              paddingAll: 0,
              borderRadiusAll: 24,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
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
          MyText.titleLarge(
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
                color: customTheme.estatePrimary,
                height: 6,
                width: 6,
                child: Container(),
              ),
              MySpacing.width(6),
              MyText.labelMedium(
                'Premium (9 days)',
                color: customTheme.estatePrimary,
                muted: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          MySpacing.height(24),
          MyText.bodySmall(
            'General',
            color: theme.colorScheme.onBackground,
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
