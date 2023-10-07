import 'package:flutkit/full_apps/other/dating/controllers/matched_profile_controller.dart';
import 'package:flutkit/full_apps/other/dating/models/profile.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatingMatchedProfileScreen extends StatefulWidget {
  final Profile profile;
  const DatingMatchedProfileScreen(
    this.profile, {
    Key? key,
  }) : super(key: key);

  @override
  _DatingMatchedProfileScreenState createState() =>
      _DatingMatchedProfileScreenState();
}

class _DatingMatchedProfileScreenState
    extends State<DatingMatchedProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late DatingMatchedProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = DatingMatchedProfileController(widget.profile);
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatingMatchedProfileController>(
        init: controller,
        tag: 'dating_matched_profile_controller',
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
        body: Stack(
          children: [
            Opacity(
              opacity: 0.9,
              child: Image(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/apps/dating/wallpaper.jpg',
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText.headlineMedium(
                    'It\'s Awesome !!',
                    fontWeight: 700,
                    color: Colors.white,
                    textAlign: TextAlign.center,
                  ),
                  MySpacing.height(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyContainer.rounded(
                        paddingAll: 0,
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(controller.profile.image),
                        ),
                      ),
                      MySpacing.width(16),
                      MyContainer.rounded(
                        paddingAll: 0,
                        height: 100,
                        width: 100,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              'assets/images/apps/dating/profile.jpg'),
                        ),
                      ),
                    ],
                  ),
                  MySpacing.height(56),
                  Padding(
                    padding: MySpacing.x(40),
                    child: MyText.bodyMedium(
                      'You both like each other, ask her about something interesting',
                      textAlign: TextAlign.center,
                      color: Colors.white,
                      muted: true,
                    ),
                  ),
                  MySpacing.height(56),
                  Padding(
                    padding: MySpacing.x(32),
                    child: MyButton.block(
                      onPressed: () {
                        controller.goToChatScreen();
                      },
                      borderRadiusAll: 4,
                      elevation: 0,
                      padding: MySpacing.y(20),
                      backgroundColor: customTheme.datingPrimary,
                      child: MyText.bodyMedium(
                        'Say Hello',
                        fontWeight: 600,
                        letterSpacing: 0.5,
                        color: customTheme.datingOnPrimary,
                      ),
                    ),
                  ),
                  MySpacing.height(24),
                  Padding(
                    padding: MySpacing.x(32),
                    child: MyButton.block(
                      onPressed: () {
                        controller.goToHomeScreen();
                      },
                      borderRadiusAll: 4,
                      elevation: 0,
                      padding: MySpacing.y(20),
                      backgroundColor:
                          customTheme.datingOnPrimary.withAlpha(200),
                      child: MyText.bodyMedium(
                        'Keep Swiping',
                        fontWeight: 600,
                        letterSpacing: 0.5,
                        color: customTheme.datingPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
