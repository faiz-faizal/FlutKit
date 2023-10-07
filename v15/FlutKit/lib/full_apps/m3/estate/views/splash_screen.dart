import 'package:flutkit/full_apps/m3/estate/controllers/splash_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ThemeData theme;

  late SplashController controller;

  @override
  initState() {
    super.initState();

    // FxControllerStore.resetStore();
    theme = AppTheme.estateTheme;

    controller = SplashController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: theme.colorScheme.primaryContainer)),
      debugShowCheckedModeBanner: false,
      home: GetBuilder<SplashController>(
          init: controller,
          tag: 'splash_controller',
          builder: (controller) {
            return Scaffold(
              body: Stack(
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/apps/estate/estate16.jpg"),
                  ),
                  Positioned(
                    top: 132,
                    left: 0,
                    right: 0,
                    child: MyText.displaySmall(
                      'Let\'s Find Your',
                      color: theme.colorScheme.onPrimary,
                      textAlign: TextAlign.center,
                      letterSpacing: 0.4,
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 0,
                    right: 0,
                    child: MyText.displaySmall(
                      'Dream Home',
                      color: theme.colorScheme.onPrimary,
                      textAlign: TextAlign.center,
                      fontWeight: 800,
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: MyContainer(
                      onTap: () {
                        controller.goToSearchScreen();
                      },
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(Constant.containerRadius.large),
                          topRight:
                              Radius.circular(Constant.containerRadius.large)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      paddingAll: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText.bodyMedium(
                            'Search by location...',
                            fontWeight: 700,
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 380,
                    child: MyCard(
                      onTap: () {
                        controller.goToLogin();
                      },
                      paddingAll: 24,
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.only(
                          bottomLeft:
                              Radius.circular(Constant.containerRadius.large),
                          bottomRight:
                              Radius.circular(Constant.containerRadius.large)),
                      width: MediaQuery.of(context).size.width - 64,
                      marginAll: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText.bodyMedium(
                            'Join Now',
                            fontWeight: 700,
                            color: theme.colorScheme.onPrimary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
