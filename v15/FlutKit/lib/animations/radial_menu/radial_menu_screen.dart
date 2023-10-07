import 'package:flutkit/animations/radial_menu/radial_menu_controller.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:flutkit/helpers/theme/app_theme.dart';

class RadialMenuScreen extends StatefulWidget {
  const RadialMenuScreen({Key? key}) : super(key: key);

  @override
  _RadialMenuScreenState createState() => _RadialMenuScreenState();
}

class _RadialMenuScreenState extends State<RadialMenuScreen> {
  late ThemeData theme;
  late RadialMenuController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;
    controller = RadialMenuController();
  }

  Widget _buildOption(Icon icon, Color iconColor) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(turns: animation, child: child);
        },
        child: InkWell(
          key: UniqueKey(),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: iconColor),
                  child: Center(child: icon))),
          onTap: () {},
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RadialMenuController>(
        init: controller,
        tag: 'radial_menu_controller',
        builder: (controller) {
          return Scaffold(
              body: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  centerTitle: true,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      LucideIcons.chevronLeft,
                      size: 22,
                    ),
                  ),
                  elevation: 0,
                  title: MyText.titleMedium('Radial Menu'),
                ),
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: controller.opened
                      ? MediaQuery.of(context).size.width / 2 - 40.0
                      : MediaQuery.of(context).size.width / 2 - 150.0,
                  top: (MediaQuery.of(context).size.height / 2) - 30,
                  child: _buildOption(
                      Icon(Icons.mail_outline, color: Colors.white),
                      Colors.purple)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: controller.opened
                      ? MediaQuery.of(context).size.width / 2 - 40.0
                      : (MediaQuery.of(context).size.width / 2) - 120.0,
                  top: controller.opened
                      ? (MediaQuery.of(context).size.height / 2) - 40.0
                      : (MediaQuery.of(context).size.height / 2) - 110.0,
                  child: _buildOption(
                      Icon(Icons.phone_outlined, color: Colors.white),
                      Colors.indigo)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: controller.opened
                      ? MediaQuery.of(context).size.width / 2 - 40.0
                      : (MediaQuery.of(context).size.width / 2) + 80.0,
                  top: (MediaQuery.of(context).size.height / 2) - 30.0,
                  child: _buildOption(
                      Icon(Icons.person_outline, color: Colors.white),
                      Colors.blue)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: controller.opened
                      ? MediaQuery.of(context).size.width / 2 - 40.0
                      : (MediaQuery.of(context).size.width / 2) + 50.0,
                  top: controller.opened
                      ? (MediaQuery.of(context).size.height / 2) - 40.0
                      : (MediaQuery.of(context).size.height / 2) - 110.0,
                  child: _buildOption(
                      Icon(LucideIcons.link, color: Colors.white),
                      Colors.green)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: MediaQuery.of(context).size.width / 2 - 35.0,
                  top: controller.opened
                      ? (MediaQuery.of(context).size.height / 2) - 40.0
                      : (MediaQuery.of(context).size.height / 2) - 150.0,
                  child: _buildOption(
                      Icon(Icons.open_in_browser, color: Colors.white),
                      Colors.teal)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: MediaQuery.of(context).size.width / 2 - 35.0,
                  top: controller.opened
                      ? (MediaQuery.of(context).size.height / 2) - 40.0
                      : (MediaQuery.of(context).size.height / 2) + 80.0,
                  child: _buildOption(
                      Icon(Icons.star_outline, color: Colors.white),
                      Colors.orange)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: controller.opened
                      ? MediaQuery.of(context).size.width / 2 - 40.0
                      : MediaQuery.of(context).size.width / 2 - 120.0,
                  top: controller.opened
                      ? (MediaQuery.of(context).size.height / 2) - 40.0
                      : (MediaQuery.of(context).size.height / 2) + 50.0,
                  child: _buildOption(
                      Icon(LucideIcons.facebook, color: Colors.white),
                      Colors.pink)),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  left: controller.opened
                      ? MediaQuery.of(context).size.width / 2 - 40.0
                      : MediaQuery.of(context).size.width / 2 + 50.0,
                  top: controller.opened
                      ? (MediaQuery.of(context).size.height / 2) - 40.0
                      : (MediaQuery.of(context).size.height / 2) + 50.0,
                  child: _buildOption(
                      Icon(LucideIcons.twitter, color: Colors.white),
                      Colors.brown)),
              Align(
                alignment: Alignment.center,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: controller.opened
                      ? InkWell(
                          key: UniqueKey(),
                          child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      color: Colors.blue),
                                  child: Center(
                                      child: Icon(Icons.share,
                                          color: Colors.white)))),
                          onTap: () {
                            controller.close();
                          })
                      : InkWell(
                          key: UniqueKey(),
                          child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      color: Colors.red),
                                  child: Center(
                                      child: Icon(Icons.close,
                                          color: Colors.white)))),
                          onTap: () {
                            controller.open();
                          }),
                ),
              )
            ],
          ));
        });
  }
}
