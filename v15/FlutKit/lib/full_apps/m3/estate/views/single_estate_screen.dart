import 'package:flutkit/full_apps/m3/estate/controllers/single_estate_controller.dart';
import 'package:flutkit/full_apps/m3/estate/models/house.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleEstateScreen extends StatefulWidget {
  final House house;

  const SingleEstateScreen(this.house);

  @override
  _SingleEstateScreenState createState() => _SingleEstateScreenState();
}

class _SingleEstateScreenState extends State<SingleEstateScreen> {
  late ThemeData theme;
  late SingleEstateController controller;

  @override
  void initState() {
    super.initState();
    controller = SingleEstateController(widget.house);
    theme = AppTheme.estateTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleEstateController>(
        init: controller,
        tag: 'single_estate_controller',
        builder: (controller) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Padding(
                padding: MySpacing.top(MySpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                      child: controller.showLoading
                          ? LinearProgressIndicator(
                              color: theme.colorScheme.primary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Container(
          margin: MySpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return Container(
        padding: MySpacing.fromLTRB(24, 8, 24, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: MyContainer(
                    paddingAll: 4,
                    color: theme.colorScheme.primaryContainer,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: MyText.bodyLarge(
                    'Details',
                    fontWeight: 700,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: MySpacing.y(16),
                children: [
                  MyContainer(
                    paddingAll: 0,
                    borderRadiusAll: Constant.containerRadius.large,
                    clipBehavior: Clip.hardEdge,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(controller.house.image),
                    ),
                  ),
                  MySpacing.height(16),
                  MyContainer(
                    onTap: () {
                      controller.goToSingleAgentScreen(controller.house.agent);
                    },
                    color: theme.colorScheme.primaryContainer,
                    paddingAll: 8,
                    borderRadiusAll: Constant.containerRadius.medium,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyContainer(
                          paddingAll: 0,
                          borderRadiusAll: Constant.containerRadius.medium,
                          clipBehavior: Clip.hardEdge,
                          child: Image(
                            height: 52,
                            fit: BoxFit.cover,
                            image: AssetImage(controller.house.agent.image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.bodyMedium(
                              controller.house.agent.name,
                              fontWeight: 700,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                            MySpacing.height(8),
                            MyText.bodySmall(
                              'View Agent Profile',
                              xMuted: true,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ],
                        ),
                        MySpacing.width(60),
                        Icon(
                          Icons.chevron_right_sharp,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(16),
                  MyContainer(
                    paddingAll: 16,
                    borderRadiusAll: Constant.containerRadius.medium,
                    color: theme.colorScheme.primaryContainer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText.bodyLarge(
                              controller.house.name,
                              fontWeight: 700,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                            MyText.bodyMedium(
                              "\$${controller.house.price.toString()} /month",
                              fontWeight: 600,
                              color: theme.colorScheme.secondary,
                            ),
                          ],
                        ),
                        MySpacing.height(8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                            MySpacing.width(4),
                            MyText.bodySmall(
                              controller.house.location,
                              xMuted: true,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                          ],
                        ),
                        MySpacing.height(8),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.king_bed,
                                    size: 16,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                  MySpacing.width(4),
                                  MyText.bodySmall(
                                    '${controller.house.bedrooms} Beds',
                                    xMuted: true,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.bathtub,
                                    size: 16,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                  MySpacing.width(4),
                                  MyText.bodySmall(
                                    '${controller.house.bathrooms} Baths',
                                    xMuted: true,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MySpacing.height(8),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.square_foot,
                                    size: 16,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                  MySpacing.width(4),
                                  MyText.bodySmall(
                                    '${controller.house.floors} Floors',
                                    xMuted: true,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.aspect_ratio,
                                    size: 16,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                  MySpacing.width(4),
                                  MyText.bodySmall(
                                    '${controller.house.area} sqft',
                                    xMuted: true,
                                    height: 1,
                                    color: theme.colorScheme.onPrimaryContainer,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MySpacing.height(20),
                        MyText.bodyLarge(
                          'Description',
                          fontWeight: 700,
                          color: theme.colorScheme.onPrimaryContainer,
                        ),
                        MySpacing.height(8),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: controller.house.description,
                                style: MyTextStyle.bodyMedium(
                                  color: theme.colorScheme.onPrimaryContainer,
                                  xMuted: true,
                                  height: 1.5,
                                )),
                            TextSpan(
                              text: "Read more",
                              style: MyTextStyle.bodyMedium(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(16),
            MyButton.block(
              onPressed: () {},
              backgroundColor: theme.colorScheme.primary,
              borderRadiusAll: Constant.containerRadius.large,
              elevation: 0,
              padding: MySpacing.y(20),
              child: MyText.bodyMedium(
                'Rent Now',
                color: theme.colorScheme.onPrimary,
                fontWeight: 700,
              ),
            ),
            MySpacing.height(16),
          ],
        ),
      );
    }
  }
}
