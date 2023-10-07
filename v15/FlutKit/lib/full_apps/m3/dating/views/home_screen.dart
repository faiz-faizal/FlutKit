import 'package:flutkit/full_apps/m3/dating/controllers/home_controller.dart';
import 'package:flutkit/full_apps/m3/dating/models/profile.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
    theme = AppTheme.datingTheme;
  }

  List<Widget> _buildProfileList() {
    List<Widget> list = [];

    for (Profile profile in controller.profiles!) {
      list.add(_buildSingleProfile(profile));
    }
    return list;
  }

  Widget _buildSingleProfile(Profile profile) {
    return MyContainer(
      onTap: () {
        controller.goToSingleProfileScreen(profile);
      },
      paddingAll: 0,
      borderRadiusAll: Constant.containerRadius.large,
      margin: MySpacing.x(20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            top: 0,
            right: 0,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(profile.image),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: MySpacing.zero,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(200),
                      Colors.black.withAlpha(160),
                      Colors.black.withAlpha(120),
                      Colors.black.withAlpha(80),
                      Colors.transparent
                    ],
                    stops: const [
                      0.1,
                      0.25,
                      0.5,
                      0.7,
                      1
                    ]),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 28,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      LucideIcons.instagram,
                      size: 16,
                    ),
                    MySpacing.width(8),
                    Icon(
                      LucideIcons.facebook,
                      size: 16,
                    ),
                  ],
                ),
                MySpacing.height(16),
                MyText.titleLarge(
                  '${profile.name}, ${profile.age}',
                  fontWeight: 600,
                  letterSpacing: 0,
                  color: Colors.white,
                ),
                MySpacing.height(4),
                MyText.bodyMedium(
                  '${profile.profession}, ${profile.companyName}',
                  color: Colors.white,
                  xMuted: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        tag: 'home_controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
          body: Container(
              margin: MySpacing.top(24),
              child: LoadingEffect.getDatingHomeScreen(
                context,
              )));
    } else {
      return Scaffold(
        body: Padding(
          padding:
              MySpacing.fromLTRB(0, MySpacing.safeAreaTop(context) + 20, 0, 24),
          child: Column(
            children: [
              Padding(
                padding: MySpacing.x(20),
                child: Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                        padding: MySpacing.xy(16, 12),
                        borderRadiusAll: Constant.containerRadius.medium,
                        onTap: () {
                          controller.goToProfileScreen();
                        },
                        color: theme.colorScheme.primaryContainer,
                        child: Row(
                          children: [
                            MyContainer.rounded(
                              paddingAll: 4,
                              color: theme.colorScheme.primary,
                              child: Icon(
                                Icons.bolt,
                                size: 16,
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                            MySpacing.width(16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.bodySmall(
                                    'Upgrade to Premium',
                                    fontWeight: 700,
                                  ),
                                  MySpacing.height(2),
                                  MyText.bodySmall(
                                    'Your date is waiting!',
                                    xMuted: true,
                                    fontSize: 10,
                                    fontWeight: 600,
                                  ),
                                ],
                              ),
                            ),
                            MySpacing.width(16),
                            MyContainer(
                              border:
                                  Border.all(color: theme.colorScheme.primary),
                              paddingAll: 8,
                              borderRadiusAll: 8,
                              color: theme.colorScheme.primaryContainer,
                              child: Icon(
                                LucideIcons.settings,
                                color: theme.colorScheme.primary,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              MySpacing.height(20),
              Expanded(
                child: PageView(
                  allowImplicitScrolling: true,
                  pageSnapping: true,
                  physics: ClampingScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: (int page) {
                    controller.onPageChanged(page);
                  },
                  children: _buildProfileList(),
                ),
              ),
              MySpacing.height(20),
              Container(
                height: 80,
                padding: MySpacing.x(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MyContainer.rounded(
                        onTap: () {
                          controller.nextPage();
                        },
                        paddingAll: 12,
                        color: theme.colorScheme.secondaryContainer,
                        child: Icon(
                          LucideIcons.x,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: MyContainer.rounded(
                        onTap: () {
                          controller.goToMatchedProfileScreen();
                        },
                        paddingAll: 16,
                        color: theme.colorScheme.primary,
                        child: Icon(
                          LucideIcons.heart,
                          color: theme.colorScheme.onPrimary,
                          size: 28,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: MyContainer.roundBordered(
                        onTap: () {
                          controller.goToSingleChatScreen();
                        },
                        paddingAll: 12,
                        border: Border.all(color: theme.colorScheme.primary),
                        color: theme.colorScheme.primaryContainer,
                        child: Icon(
                          LucideIcons.messageCircle,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
