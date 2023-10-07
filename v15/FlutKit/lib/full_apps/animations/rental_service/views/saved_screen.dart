import 'package:flutkit/full_apps/animations/rental_service/controllers/saved_controller.dart';
import 'package:flutkit/full_apps/animations/rental_service/models/car.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late ThemeData theme;
  late SavedController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.rentalServiceTheme;
    controller = SavedController();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavedController>(
        init: controller,
        tag: 'saved_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 20, 20, 00),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        child: MyText.titleMedium(
                      "My Collections",
                      fontWeight: 600,
                    )),
                    MySpacing.height(20),
                    cars(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget cars() {
    return GridView.builder(
        padding: MySpacing.zero,
        shrinkWrap: true,
        itemCount: controller.cars.length,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: controller.findAspectRatio(),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return car(controller.cars[index]);
        });
  }

  Widget car(Car car) {
    return MyContainer(
      onTap: () {
        controller.goToSingleCarScreen(car);
      },
      padding: MySpacing.nBottom(4),
      borderRadiusAll: Constant.containerRadius.xs,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyContainer(
            borderRadiusAll: Constant.containerRadius.xs,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            paddingAll: 0,
            child: Image(
              height: 100,
              fit: BoxFit.cover,
              image: AssetImage(car.image),
            ),
          ),
          Container(
            padding: MySpacing.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  car.name,
                  fontWeight: 700,
                ),
                MySpacing.height(4),
                MyText.bodyMedium(
                  "\$${car.price.precise}/hour",
                  color: theme.colorScheme.primary,
                  fontWeight: 600,
                ),
                MySpacing.height(4),
                Row(
                  children: [
                    Icon(
                      LucideIcons.mapPin,
                      size: 12,
                    ),
                    MySpacing.width(4),
                    MyText.bodySmall(
                      car.location,
                      xMuted: true,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
