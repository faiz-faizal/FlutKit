import 'package:flutkit/full_apps/m3/dating/controllers/profile_controller.dart';
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
    theme = AppTheme.datingTheme;
  }

  Widget _buildSingleRow(String info, IconData icon) {
    return MyContainer(
      borderRadiusAll: Constant.containerRadius.medium,
      margin: MySpacing.bottom(16),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: theme.colorScheme.secondary,
          ),
          MySpacing.width(16),
          Expanded(
            child: MyText.bodySmall(
              info,
              fontWeight: 600,
            ),
          ),
          MySpacing.width(16),
          Icon(
            LucideIcons.chevronDown,
            color: theme.colorScheme.onBackground,
            size: 16,
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
              margin: MySpacing.top(24),
              child: LoadingEffect.getSearchLoadingScreen(
                context,
              )));
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
              color: theme.colorScheme.onBackground,
            ),
          ),
          title: MyText.titleMedium(
            'Profile',
            color: theme.colorScheme.onBackground,
            fontWeight: 600,
          ),
        ),
        body: Column(
          children: [
            MyContainer(
              borderRadiusAll: Constant.containerRadius.large,
              margin: MySpacing.fromLTRB(24, 4, 24, 0),
              paddingAll: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyContainer.rounded(
                        paddingAll: 0,
                        margin: MySpacing.right(8),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          height: 64,
                          width: 64,
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/apps/dating/profile.jpg'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyMedium(
                            'Taylor Swift, 22',
                            fontWeight: 600,
                          ),
                          MySpacing.height(4),
                          MyText.bodySmall(
                            'Project Manager, Cloud Infotech',
                            xMuted: true,
                            fontWeight: 600,
                          ),
                          MySpacing.height(4),
                          MyText.bodySmall(
                            'Bangkok, Malaysia',
                            fontWeight: 600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  MySpacing.height(12),
                  Row(
                    children: [
                      MyContainer(
                        margin: MySpacing.right(8),
                        padding: MySpacing.xy(8, 4),
                        borderRadiusAll: Constant.containerRadius.small,
                        color: theme.colorScheme.primaryContainer,
                        child: MyText.bodySmall(
                          'Travelling',
                          fontSize: 10,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      MyContainer(
                        margin: MySpacing.right(8),
                        padding: MySpacing.xy(8, 4),
                        borderRadiusAll: Constant.containerRadius.small,
                        color: theme.colorScheme.primaryContainer,
                        child: MyText.bodySmall(
                          'Diving',
                          fontSize: 10,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      MyContainer(
                        margin: MySpacing.right(8),
                        padding: MySpacing.xy(8, 4),
                        borderRadiusAll: Constant.containerRadius.small,
                        color: theme.colorScheme.primaryContainer,
                        child: MyText.bodySmall(
                          'Reading',
                          fontSize: 10,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      MyContainer(
                        margin: MySpacing.right(8),
                        padding: MySpacing.xy(8, 4),
                        borderRadiusAll: Constant.containerRadius.small,
                        color: theme.colorScheme.primaryContainer,
                        child: MyText.bodySmall(
                          'Trekking',
                          fontSize: 10,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  MySpacing.height(16),
                  MyText.bodySmall(
                    'I\'m taylor from Texas. I am looking for special person also I want to meet different people and learn new things from different cultures and visit new places.',
                    xMuted: true,
                    fontSize: 10,
                  ),
                ],
              ),
            ),
            Container(
              padding: MySpacing.all(24),
              child: Column(
                children: [
                  _buildSingleRow('Detailed Info', LucideIcons.alertCircle),
                  _buildSingleRow('Matches', LucideIcons.heart),
                  _buildSingleRow('Profile Stats', LucideIcons.activity),
                  _buildSingleRow('Notes', Icons.notes),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
