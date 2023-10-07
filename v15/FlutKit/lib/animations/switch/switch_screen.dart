import 'package:flare_flutter/flare_actor.dart';
import 'package:flutkit/animations/switch/switch_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late SwitchController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = SwitchController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SwitchController>(
        init: controller,
        tag: 'switch_controller',
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: InkWell(
                child: Icon(
                  LucideIcons.chevronLeft,
                  color: Colors.white,
                ),
                onTap: () {
                  controller.goBack();
                },
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyText.bodyLarge("Flare Animation"),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        controller.onClick();
                      },
                      child: FlareActor(
                          "assets/animations/rive/smiley_switch.flr",
                          snapToEnd: false,
                          animation: controller.status),
                    ),
                  ),
                  MySpacing.height(20),
                  MyText.bodyLarge("Custom Animation"),
                  MySpacing.height(80),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: controller.toggleValue
                            ? Colors.greenAccent.shade100
                            : Colors.redAccent.shade100.withOpacity(0.5)),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          top: 3,
                          left: controller.toggleValue ? 48 : 0,
                          right: controller.toggleValue ? 0 : 48,
                          child: InkWell(
                            onTap: controller.toggleButton,
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 200),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return RotationTransition(
                                  turns: animation,
                                  child: child,
                                );
                              },
                              child: controller.toggleValue
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 32,
                                      key: UniqueKey(),
                                    )
                                  : Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                      size: 32,
                                      key: UniqueKey(),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
