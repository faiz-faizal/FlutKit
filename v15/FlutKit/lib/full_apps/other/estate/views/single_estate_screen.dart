import 'package:flutkit/full_apps/other/estate/controllers/single_estate_controller.dart';
import 'package:flutkit/full_apps/other/estate/models/house.dart';
import 'package:flutkit/full_apps/other/estate/views/single_agent_screen.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_card.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/helpers/widgets/my_text_style.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EstateSingleEstateScreen extends StatefulWidget {
  final House house;

  const EstateSingleEstateScreen(this.house);

  @override
  _EstateSingleEstateScreenState createState() =>
      _EstateSingleEstateScreenState();
}

class _EstateSingleEstateScreenState extends State<EstateSingleEstateScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late EstateSingleEstateController estateSingleEstateController;

  @override
  void initState() {
    super.initState();
    estateSingleEstateController = EstateSingleEstateController(widget.house);
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstateSingleEstateController>(
        init: estateSingleEstateController,
        tag: 'estate_single_estate_controller',
        builder: (estateSingleEstateController) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.top(32),
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                    child: estateSingleEstateController.showLoading
                        ? LinearProgressIndicator(
                            color: customTheme.estatePrimary,
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
          );
        });
  }

  Widget _buildBody() {
    if (estateSingleEstateController.uiLoading) {
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
                  child: MyContainer.bordered(
                    paddingAll: 4,
                    child: Icon(
                      Icons.chevron_left_outlined,
                      color: theme.colorScheme.onBackground.withAlpha(200),
                    ),
                  ),
                ),
                MyText.bodyLarge(
                  'Details',
                  fontWeight: 700,
                ),
                MyContainer.bordered(
                  paddingAll: 6,
                  child: MyContainer.rounded(
                    paddingAll: 4,
                    color: customTheme.estateSecondary,
                    child: Icon(
                      Icons.favorite,
                      size: 12,
                    ),
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
                    borderRadiusAll: 16,
                    clipBehavior: Clip.hardEdge,
                    child: Image(
                      fit: BoxFit.cover,
                      image:
                          AssetImage(estateSingleEstateController.house.image),
                    ),
                  ),
                  MySpacing.height(16),
                  MyCard(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EstateSingleAgentScreen(
                                  estateSingleEstateController.house.agent)));
                    },
                    paddingAll: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyContainer(
                          paddingAll: 0,
                          borderRadiusAll: 8,
                          clipBehavior: Clip.hardEdge,
                          child: Image(
                            height: 52,
                            fit: BoxFit.cover,
                            image: AssetImage(
                                estateSingleEstateController.house.agent.image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.bodyMedium(
                              estateSingleEstateController.house.agent.name,
                              fontWeight: 700,
                            ),
                            MySpacing.height(8),
                            MyText.bodySmall(
                              'View Agent Profile',
                              xMuted: true,
                            ),
                          ],
                        ),
                        MySpacing.width(60),
                        Icon(
                          Icons.chevron_right_sharp,
                          color: theme.colorScheme.onBackground,
                        ),
                      ],
                    ),
                  ),
                  MySpacing.height(16),
                  MyContainer(
                    paddingAll: 16,
                    borderRadiusAll: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText.bodyLarge(
                              estateSingleEstateController.house.name,
                              fontWeight: 700,
                            ),
                            MyText.bodyMedium(
                              estateSingleEstateController.house.price,
                              fontWeight: 600,
                              color: customTheme.estateSecondary,
                            ),
                          ],
                        ),
                        MySpacing.height(8),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(180),
                            ),
                            MySpacing.width(4),
                            MyText.bodySmall(
                              estateSingleEstateController.house.location,
                              xMuted: true,
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
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(180),
                                  ),
                                  MySpacing.width(4),
                                  MyText.bodySmall(
                                    estateSingleEstateController.house.bedrooms,
                                    xMuted: true,
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
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(180),
                                  ),
                                  MySpacing.width(4),
                                  MyText.bodySmall(
                                    estateSingleEstateController
                                        .house.bathrooms,
                                    xMuted: true,
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
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(180),
                                  ),
                                  MySpacing.width(4),
                                  MyText.bodySmall(
                                    estateSingleEstateController.house.floors,
                                    xMuted: true,
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
                                    color: theme.colorScheme.onBackground
                                        .withAlpha(180),
                                  ),
                                  MySpacing.width(4),
                                  MyText.bodySmall(
                                    estateSingleEstateController.house.area,
                                    xMuted: true,
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        MySpacing.height(20),
                        MyText.bodyMedium(
                          'Description',
                          fontWeight: 700,
                        ),
                        MySpacing.height(8),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: estateSingleEstateController
                                    .house.description,
                                style: MyTextStyle.bodyMedium(
                                  color: theme.colorScheme.onBackground,
                                  xMuted: true,
                                  height: 1.5,
                                )),
                            TextSpan(
                              text: "Read more",
                              style: MyTextStyle.bodyMedium(
                                color: customTheme.estateSecondary,
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
              padding: MySpacing.y(20),
              backgroundColor: customTheme.estatePrimary,
              borderRadiusAll: 12,
              elevation: 0,
              child: MyText.bodyMedium(
                'Rent Now',
                color: customTheme.estateOnPrimary,
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
