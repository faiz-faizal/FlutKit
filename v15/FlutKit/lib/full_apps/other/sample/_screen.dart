import 'package:flutkit/full_apps/other/sample/_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late Controller controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = Controller();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
        init: controller,
        tag: 'controller',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Center(
          child: MyText.bodyLarge(
            'Loading ...',
            fontWeight: 600,
          ),
        ),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: MySpacing.top(16),
          children: const [],
        ),
      );
    }
  }
}
