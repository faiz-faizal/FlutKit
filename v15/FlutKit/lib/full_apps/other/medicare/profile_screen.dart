import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class MediCareProfileScreen extends StatefulWidget {
  const MediCareProfileScreen({Key? key}) : super(key: key);

  @override
  _MediCareProfileScreenState createState() => _MediCareProfileScreenState();
}

class _MediCareProfileScreenState extends State<MediCareProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
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
            color: customTheme.medicarePrimary,
            size: 20,
          ),
        ),
        MySpacing.width(16),
        Expanded(
          child: MyText.bodySmall(
            title!,
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
    return Scaffold(
      body: ListView(
        padding: MySpacing.fromLTRB(24, 52, 24, 24),
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
                color: customTheme.medicarePrimary,
                height: 6,
                width: 6,
                child: Container(),
              ),
              MySpacing.width(6),
              MyText.bodySmall(
                'Premium (9 days)',
                color: customTheme.medicarePrimary,
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
      ),
    );
  }
}
