import 'package:flare_flutter/flare_actor.dart';
import 'package:flutkit/animations/resizing_house/resizing_house_controller.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ResizingHouseScreen extends StatefulWidget {
  const ResizingHouseScreen({Key? key}) : super(key: key);

  @override
  _ResizingHouseScreenState createState() => _ResizingHouseScreenState();
}

class _ResizingHouseScreenState extends State<ResizingHouseScreen> {
  late ThemeData theme;
  late ResizingHouseController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingTheme;

    controller = ResizingHouseController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResizingHouseController>(
        init: controller,
        tag: 'resizing_house_controller',
        builder: (controller) {
          return Scaffold(
            backgroundColor: Color(0xff404366),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff404366),
              title: MyText.titleMedium(
                'Flare Animation',
                color: Colors.white,
              ),
              centerTitle: true,
              leading: InkWell(
                child: Icon(
                  LucideIcons.chevronLeft,
                  color: theme.colorScheme.onPrimary,
                ),
                onTap: () {
                  controller.goBack();
                },
              ),
            ),
            body: Stack(
              children: [
                FlareActor(
                  "assets/animations/rive/resizing_house.flr",
                  snapToEnd: false,
                  shouldClip: false,
                  controller: controller.houseController,
                ),
                MySpacing.height(20),
                Slider(
                    min: 0,
                    max: 3,
                    divisions: 3,
                    value: controller.rooms.toDouble() - 3,
                    onChanged: (double value) {
                      controller.onSliderChange(value);
                    }),
              ],
            ),
          );
        });
  }
}
