import 'package:flutkit/animations/theme_changer/theme_changer_controller.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:flutkit/helpers/theme/app_theme.dart';

class ThemeChangerScreen extends StatefulWidget {
  const ThemeChangerScreen({Key? key}) : super(key: key);

  @override
  _ThemeChangerScreenState createState() => _ThemeChangerScreenState();
}

class _ThemeChangerScreenState extends State<ThemeChangerScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late ThemeChangerController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = ThemeChangerController(this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeChangerController>(
        init: controller,
        tag: 'theme_changer_controller',
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: MyText.titleMedium("Theme Animation"),
              elevation: 0,
              centerTitle: true,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(LucideIcons.chevronLeft),
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: controller.scaleAnimation,
                    builder: (context, child) => Transform.scale(
                      scale: controller.scaleAnimation.value,
                      child: MyContainer.rounded(
                        paddingAll: 1,
                        child: Container(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.scaleController.forward();
                    },
                    child: MyContainer.rounded(
                      child: Icon(
                        Icons.wb_sunny_sharp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
