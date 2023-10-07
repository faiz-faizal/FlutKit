import 'package:flutkit/full_apps/animations/rental_service/controllers/collection_controller.dart';
import 'package:flutkit/full_apps/animations/rental_service/models/car.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  late ThemeData theme;
  late CollectionController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.rentalServiceTheme;
    controller = CollectionController();
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionController>(
        init: controller,
        tag: 'collection_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.fromLTRB(
                  20, MySpacing.safeAreaTop(context) + 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    search(),
                    MySpacing.height(20),
                    cars(),
                    MySpacing.height(20),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget search() {
    return TextField(
      style: MyTextStyle.bodyMedium(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          isDense: true,
          filled: true,
          prefixIcon: Icon(
            LucideIcons.search,
          ),
          hintText: "Search your favorite car",
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
          contentPadding: MySpacing.all(16),
          hintStyle: MyTextStyle.bodyMedium(
              xMuted: true, color: theme.colorScheme.onPrimaryContainer),
          isCollapsed: true),
      maxLines: 1,
      controller: controller.searchController,
      cursorColor: theme.colorScheme.onBackground,
    );
  }

  Widget cars() {
    List<Widget> list = [];
    for (int i = 0; i < controller.cars.length; i++) {
      list.add(car(controller.cars[i]));
    }
    return Column(
      children: list,
    );
  }

  Widget car(Car car) {
    return MyContainer(
      onTap: () {
        controller.goToSingleCarScreen(car);
      },
      margin: MySpacing.bottom(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyText.bodyLarge(
            car.name,
            fontWeight: 700,
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
          MySpacing.height(20),
          MyContainer(
            paddingAll: 0,
            height: 150,
            borderRadiusAll: Constant.containerRadius.xs,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: AssetImage(car.image),
              fit: BoxFit.cover,
            ),
          ),
          MySpacing.height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.person,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                  MySpacing.width(4),
                  MyText.bodySmall(
                    "${car.passengers} Passengers",
                    fontWeight: 600,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.settings,
                    color: theme.colorScheme.primary,
                    size: 20,
                  ),
                  MySpacing.width(4),
                  MyText.bodySmall(
                    car.type,
                    fontWeight: 600,
                  ),
                ],
              ),
              MyText.bodySmall("\$${car.price.precise}/hour"),
            ],
          ),
        ],
      ),
    );
  }
}
