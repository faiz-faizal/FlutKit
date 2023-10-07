import 'package:flutkit/full_apps/other/dating/controllers/single_profile_controller.dart';
import 'package:flutkit/full_apps/other/dating/models/profile.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DatingSingleProfileScreen extends StatefulWidget {
  final Profile profile;

  const DatingSingleProfileScreen(this.profile, {Key? key}) : super(key: key);

  @override
  _DatingSingleProfileScreenState createState() =>
      _DatingSingleProfileScreenState();
}

class _DatingSingleProfileScreenState extends State<DatingSingleProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late DatingSingleProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = DatingSingleProfileController(widget.profile);
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  List<Widget> _buildInterestList() {
    List<Widget> list = [];

    for (String interest in controller.profile.interests) {
      list.add(MyContainer.bordered(
        padding: MySpacing.xy(8, 8),
        borderRadiusAll: 4,
        border: Border.all(color: customTheme.datingPrimary),
        color: customTheme.datingPrimary.withAlpha(30),
        child: MyText.bodySmall(
          interest,
          color: customTheme.datingPrimary,
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatingSingleProfileController>(
        init: controller,
        tag: 'dating_single_profile_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: MySpacing.top(24),
              child: LoadingEffect.getProductLoadingScreen(
                context,
              )));
    } else {
      return Scaffold(
        body: ListView(
          padding: MySpacing.fromLTRB(
              20, MySpacing.safeAreaTop(context) + 20, 20, 20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyContainer.bordered(
                  onTap: () {
                    controller.goBack();
                  },
                  paddingAll: 8,
                  borderRadiusAll: 4,
                  border: Border.all(color: customTheme.datingPrimary),
                  color: customTheme.datingPrimary.withAlpha(30),
                  child: Icon(
                    LucideIcons.chevronLeft,
                    size: 20,
                    color: customTheme.datingPrimary,
                  ),
                ),
                MyContainer.bordered(
                  onTap: () {
                    controller.goToSingleChatScreen();
                  },
                  paddingAll: 8,
                  borderRadiusAll: 4,
                  border: Border.all(color: customTheme.datingPrimary),
                  color: customTheme.datingPrimary.withAlpha(30),
                  child: Icon(
                    LucideIcons.messageCircle,
                    size: 20,
                    color: customTheme.datingPrimary,
                  ),
                ),
              ],
            ),
            MySpacing.height(20),
            MyContainer(
              height: 400,
              paddingAll: 0,
              borderRadiusAll: 4,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(controller.profile.image),
              ),
            ),
            MySpacing.height(16),
            Row(
              children: [
                Expanded(
                  child: MyText.titleLarge(
                    controller.profile.name,
                    fontWeight: 700,
                  ),
                ),
                MySpacing.width(16),
                Icon(
                  LucideIcons.instagram,
                  size: 20,
                  color: customTheme.datingPrimary,
                ),
                MySpacing.width(12),
                Icon(
                  LucideIcons.facebook,
                  size: 20,
                  color: customTheme.datingPrimary,
                ),
                MySpacing.width(2),
              ],
            ),
            MySpacing.height(4),
            MyText.labelMedium(
              '${controller.profile.profession}, ${controller.profile.companyName}',
              xMuted: true,
            ),
            MySpacing.height(16),
            MyText.titleMedium(
              'About',
              fontWeight: 700,
              letterSpacing: 0.3,
            ),
            MySpacing.height(8),
            MyText.bodySmall(
              controller.profile.description,
              xMuted: true,
            ),
            MySpacing.height(16),
            MyText.titleMedium(
              'Interest',
              fontWeight: 700,
              letterSpacing: 0.3,
            ),
            MySpacing.height(16),
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: _buildInterestList(),
            ),
          ],
        ),
      );
    }
  }
}
