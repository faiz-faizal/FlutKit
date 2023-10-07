import 'package:flutkit/full_apps/other/muvi/controllers/splash_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
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
  late CustomTheme customTheme;

  late SplashController controller;

  @override
  void initState() {
    super.initState();
    // FxControllerStore.resetStore();
    controller = SplashController();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.muviPrimary.withAlpha(80))),
      home: GetBuilder<SplashController>(
          tag: 'splash_controller',
          init: controller,
          builder: (controller) {
            return _buildBody();
          }),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/apps/muvi/splash.jpg'),
            ),
          ),
          Center(
            child: Padding(
              padding: MySpacing.fromLTRB(40, 100, 40, 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.headlineSmall(
                    'Watch your favourite movies anytime, anywhere',
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontWeight: 700,
                  ),
                  MyButton.block(
                    onPressed: () {
                      controller.goToLoginScreen();
                    },
                    backgroundColor: Color(0xa4161616),
                    borderRadiusAll: 4,
                    elevation: 0,
                    padding: MySpacing.y(20),
                    child: MyText.bodyLarge(
                      'Log In',
                      fontWeight: 700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
