import 'package:flutkit/full_apps/animations/rental_service/controllers/single_car_controller.dart';
import 'package:flutkit/full_apps/animations/rental_service/models/car.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SingleCarScreen extends StatefulWidget {
  final Car car;

  const SingleCarScreen({Key? key, required this.car}) : super(key: key);

  @override
  _SingleCarScreenState createState() => _SingleCarScreenState();
}

class _SingleCarScreenState extends State<SingleCarScreen> {
  late ThemeData theme;
  late SingleCarController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.rentalServiceTheme;
    controller = SingleCarController(widget.car);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleCarController>(
        init: controller,
        tag: 'single_car_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  controller.goBack();
                },
                child: Icon(
                  LucideIcons.chevronLeft,
                ),
              ),
              title: MyText.titleMedium(
                "Details",
                fontWeight: 700,
              ),
              elevation: 0,
              centerTitle: true,
              actions: [
                InkWell(
                    onTap: () {
                      controller.toggleFav();
                    },
                    child: Icon(
                      controller.fav ? Icons.favorite : Icons.favorite_outline,
                      color: theme.colorScheme.secondary,
                    )),
                MySpacing.width(20),
              ],
            ),
            body: Padding(
              padding: MySpacing.x(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        image(),
                        MySpacing.height(20),
                        MyText.titleMedium(
                          controller.car.name,
                          fontWeight: 700,
                        ),
                        MySpacing.height(4),
                        location(),
                        MySpacing.height(4),
                        MyText.titleSmall(
                            "\$${controller.car.price.precise} /hour"),
                        MySpacing.height(20),
                        carSpecsTitle(),
                        MySpacing.height(20),
                        carSpecs(),
                        MySpacing.height(20),
                        MyText.bodyMedium(
                          "Car Info",
                          fontWeight: 700,
                        ),
                        MySpacing.height(20),
                        carInfo(),
                      ],
                    ),
                  ),
                  MyButton.block(
                    onPressed: () {
                      controller.goToPaymentScreen();
                    },
                    elevation: 0,
                    padding: MySpacing.y(20),
                    borderRadiusAll: Constant.buttonRadius.small,
                    child: MyText.labelLarge(
                      "Book Now",
                      fontWeight: 700,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                  MySpacing.height(20),
                ],
              ),
            ),
          );
        });
  }

  Widget image() {
    return MyContainer(
      paddingAll: 0,
      borderRadiusAll: Constant.containerRadius.xs,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image(
        image: AssetImage(controller.car.image),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget location() {
    return Row(
      children: [
        Icon(
          LucideIcons.mapPin,
          size: 12,
        ),
        MySpacing.width(8),
        MyText.bodyMedium(
          controller.car.location,
          xMuted: true,
        ),
      ],
    );
  }

  Widget carSpecsTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText.bodyMedium(
          "Car Specs",
          fontWeight: 700,
        ),
        MyText.bodySmall(
          "See More",
          fontWeight: 600,
          color: theme.colorScheme.primary,
        ),
      ],
    );
  }

  Widget carSpecs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MyContainer.bordered(
            color: theme.scaffoldBackgroundColor,
            borderRadiusAll: Constant.containerRadius.small,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodySmall(
                  "Max Power",
                  xMuted: true,
                  fontWeight: 600,
                ),
                MySpacing.height(8),
                MyText.bodyMedium(
                  controller.car.power.precise.toString(),
                  fontWeight: 700,
                ),
                // MySpacing.height(4),
                MyText.bodySmall(
                  "hp",
                  muted: true,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
        ),
        MySpacing.width(20),
        Expanded(
          child: MyContainer.bordered(
            color: theme.scaffoldBackgroundColor,
            borderRadiusAll: Constant.containerRadius.small,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodySmall(
                  "0-60 mph",
                  xMuted: true,
                  fontWeight: 600,
                ),
                MySpacing.height(8),
                MyText.bodyMedium(
                  controller.car.time.toString(),
                  fontWeight: 700,
                ),
                // MySpacing.height(4),
                MyText.bodySmall(
                  "sec",
                  muted: true,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
        ),
        MySpacing.width(20),
        Expanded(
          child: MyContainer.bordered(
            color: theme.scaffoldBackgroundColor,
            borderRadiusAll: Constant.containerRadius.small,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodySmall(
                  "Top Speed",
                  xMuted: true,
                  fontWeight: 600,
                ),
                MySpacing.height(8),
                MyText.bodyMedium(
                  controller.car.speed.toString(),
                  fontWeight: 700,
                ),
                // MySpacing.height(4),
                MyText.bodySmall(
                  "mph",
                  muted: true,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget carInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                MySpacing.width(8),
                MyText.bodySmall(
                  "${controller.car.passengers} Passengers",
                  fontWeight: 600,
                ),
              ],
            ),
            MySpacing.height(4),
            Row(
              children: [
                Icon(
                  Icons.ac_unit,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                MySpacing.width(8),
                MyText.bodySmall(
                  "Air Conditioning",
                  fontWeight: 600,
                ),
              ],
            ),
            MySpacing.height(4),
            Row(
              children: [
                Icon(
                  Icons.speed,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                MySpacing.width(8),
                MyText.bodySmall(
                  "Unlimited Milieage",
                  fontWeight: 600,
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.sensor_door,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                MySpacing.width(8),
                MyText.bodySmall(
                  "${controller.car.doors} Doors",
                  fontWeight: 600,
                ),
              ],
            ),
            MySpacing.height(4),
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                MySpacing.width(8),
                MyText.bodySmall(
                  controller.car.type,
                  fontWeight: 600,
                ),
              ],
            ),
            MySpacing.height(4),
            Row(
              children: [
                Icon(
                  Icons.speed,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                MySpacing.width(8),
                MyText.bodySmall(
                  "Fuel: full to full",
                  fontWeight: 600,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
