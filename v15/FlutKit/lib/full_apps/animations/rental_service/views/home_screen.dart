import 'package:flutkit/full_apps/animations/rental_service/controllers/home_controller.dart';
import 'package:flutkit/full_apps/animations/rental_service/models/car.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late HomeController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.rentalServiceTheme;
    controller = HomeController();
    outlineInputBorder = OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(Constant.containerRadius.medium)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        tag: 'home_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    title(),
                    MySpacing.height(20),
                    select(),
                    MySpacing.height(20),
                    brand(),
                    MySpacing.height(20),
                    categories(),
                    MySpacing.height(20),
                    bestCars(),
                    MySpacing.height(20),
                    cars(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget title() {
    return Padding(
      padding: MySpacing.x(20),
      child: Row(
        children: [
          MyContainer(
            paddingAll: 8,
            borderRadiusAll: Constant.containerRadius.medium,
            child: Icon(
              LucideIcons.mapPin,
              size: 20,
            ),
          ),
          MySpacing.width(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodySmall(
                  "Your Location",
                  xMuted: true,
                ),
                MyText.bodyMedium(
                  "Wellington, Canada",
                  fontWeight: 700,
                ),
              ],
            ),
          ),
          MyContainer.rounded(
            paddingAll: 0,
            height: 40,
            width: 40,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/images/full_apps/rental_service/images/profile.jpg"),
            ),
          ),
        ],
      ),
    );
  }

  Widget select() {
    return MyContainer(
      margin: MySpacing.x(20),
      child: Column(
        children: [
          MyText.titleLarge(
            "Select or search your \nfavourite vehicle",
            fontWeight: 700,
            textAlign: TextAlign.center,
          ),
          MySpacing.height(20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: MyTextStyle.bodyMedium(),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isDense: true,
                      filled: true,
                      prefixIcon: Icon(LucideIcons.search),
                      hintText: "Search Here",
                      enabledBorder: outlineInputBorder,
                      focusedBorder: outlineInputBorder,
                      border: outlineInputBorder,
                      contentPadding: MySpacing.all(16),
                      hintStyle: MyTextStyle.bodyMedium(xMuted: true),
                      isCollapsed: true),
                  maxLines: 1,
                  controller: controller.searchController,
                  cursorColor: theme.colorScheme.onBackground,
                ),
              ),
              MySpacing.width(12),
              MyContainer(
                paddingAll: 13,
                borderRadiusAll: Constant.containerRadius.medium,
                color: theme.colorScheme.primary,
                child: Icon(
                  LucideIcons.list,
                  size: 20,
                  color: theme.colorScheme.onPrimary,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget brand() {
    return Padding(
      padding: MySpacing.x(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText.bodyMedium(
            "Top Brands",
            fontWeight: 700,
          ),
          MyText.bodySmall(
            "See All",
            xMuted: true,
          ),
        ],
      ),
    );
  }

  Widget categories() {
    List<Widget> list = [];

    list.add(
      MySpacing.width(20),
    );
    for (int i = 0; i < controller.categories.length; i++) {
      list.add(category(controller.categories[i]));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }

  Widget category(Category category) {
    return MyContainer(
      margin: MySpacing.right(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: 40,
            width: 40,
            image: AssetImage(category.image),
          ),
          MySpacing.height(8),
          MyText.bodySmall(
            category.name,
            fontWeight: 600,
          ),
        ],
      ),
    );
  }

  Widget bestCars() {
    return Padding(
      padding: MySpacing.x(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText.bodyMedium(
            "Best Cars",
            fontWeight: 700,
          ),
          MyText.bodySmall(
            "See All",
            xMuted: true,
          ),
        ],
      ),
    );
  }

  Widget cars() {
    List<Widget> list = [];

    list.add(MySpacing.width(20));

    for (int i = 0; i < controller.cars.length; i++) {
      list.add(car(controller.cars[i]));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: list,
      ),
    );
  }

  Widget car(Car car) {
    return MyContainer(
      onTap: () {
        controller.goToSingleCarScreen(car);
      },
      paddingAll: 4,
      borderRadiusAll: Constant.containerRadius.xs,
      margin: MySpacing.right(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyContainer(
            borderRadiusAll: Constant.containerRadius.xs,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            paddingAll: 0,
            child: Image(
              width: 150,
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
                  "\$${car.price}/hour",
                  color: theme.colorScheme.primary,
                  fontWeight: 600,
                ),
                MySpacing.height(4),
                Row(
                  children: [
                    Icon(
                      LucideIcons.mapPin,
                      size: 14,
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
