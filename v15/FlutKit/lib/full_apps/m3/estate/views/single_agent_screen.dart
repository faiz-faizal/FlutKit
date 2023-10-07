import 'package:flutkit/full_apps/m3/estate/controllers/single_agent_controller.dart';
import 'package:flutkit/full_apps/m3/estate/models/agent.dart';
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

class SingleAgentScreen extends StatefulWidget {
  final Agent agent;

  const SingleAgentScreen(this.agent);

  @override
  _SingleAgentScreenState createState() => _SingleAgentScreenState();
}

class _SingleAgentScreenState extends State<SingleAgentScreen> {
  late ThemeData theme;
  late SingleAgentController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.estateTheme;
    controller = SingleAgentController(widget.agent);
  }

  Widget _buildSingleHouse(House house) {
    return MyContainer(
      onTap: () {
        controller.goToSingleHouseScreen(house);
      },
      margin: MySpacing.right(16),
      width: 200,
      paddingAll: 16,
      borderRadiusAll: Constant.containerRadius.medium,
      color: theme.colorScheme.secondaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyContainer(
            paddingAll: 0,
            borderRadiusAll: Constant.containerRadius.medium,
            clipBehavior: Clip.hardEdge,
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(house.image),
            ),
          ),
          MySpacing.height(8),
          MyText.bodyLarge(
            house.name,
            fontWeight: 700,
            color: theme.colorScheme.onSecondaryContainer,
          ),
          MySpacing.height(4),
          MyText.bodySmall(
            house.location,
            xMuted: true,
            color: theme.colorScheme.onSecondaryContainer,
          ),
          MySpacing.height(4),
          MyText.bodySmall(
            house.price.toString(),
            color: theme.colorScheme.onSecondaryContainer,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));

    for (House house in controller.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleAgentController>(
        init: controller,
        tag: 'single_agent_controller',
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
      return ListView(
        padding: MySpacing.fromLTRB(0, 8, 0, 20),
        children: [
          Padding(
            padding: MySpacing.horizontal(24),
            child: Row(
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
                MySpacing.width(64),
                MyText.bodyLarge(
                  'Agent Profile',
                  fontWeight: 700,
                ),
              ],
            ),
          ),
          MySpacing.height(24),
          Padding(
            padding: MySpacing.horizontal(24),
            child: MyContainer(
              paddingAll: 12,
              borderRadiusAll: Constant.containerRadius.large,
              color: theme.colorScheme.primaryContainer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyContainer(
                        paddingAll: 0,
                        borderRadiusAll: Constant.containerRadius.medium,
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          height: 56,
                          fit: BoxFit.cover,
                          image: AssetImage(controller.agent.image),
                        ),
                      ),
                      MySpacing.width(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyLarge(
                            controller.agent.name,
                            fontWeight: 700,
                            color: theme.colorScheme.onPrimaryContainer,
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
                                controller.agent.address,
                                xMuted: true,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  MySpacing.height(16),
                  MyText.bodyMedium(
                    'Information',
                    fontWeight: 700,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  MySpacing.height(8),
                  Row(
                    children: [
                      MyContainer.rounded(
                          paddingAll: 4,
                          color: theme.colorScheme.primary.withAlpha(40),
                          child: Icon(
                            Icons.phone,
                            color: theme.colorScheme.primary,
                            size: 14,
                          )),
                      MySpacing.width(12),
                      MyText.bodySmall(
                        controller.agent.number,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ],
                  ),
                  MySpacing.height(8),
                  Row(
                    children: [
                      MyContainer.rounded(
                          paddingAll: 4,
                          color: theme.colorScheme.primary.withAlpha(40),
                          child: Icon(
                            Icons.house,
                            color: theme.colorScheme.primary,
                            size: 14,
                          )),
                      MySpacing.width(12),
                      MyText.bodySmall(
                        controller.agent.properties,
                        color: theme.colorScheme.onPrimaryContainer,
                      ),
                    ],
                  ),
                  MySpacing.height(16),
                  MyText.bodyMedium(
                    'About Me',
                    fontWeight: 700,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                  MySpacing.height(8),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: controller.agent.description,
                          style: MyTextStyle.bodySmall(
                            color: theme.colorScheme.onPrimaryContainer,
                            xMuted: true,
                            height: 1.5,
                          )),
                      TextSpan(
                        text: " Read more",
                        style: MyTextStyle.bodySmall(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ]),
                  ),
                  MySpacing.height(16),
                  MyButton.block(
                    padding: MySpacing.symmetric(horizontal: 24, vertical: 16),
                    onPressed: () {},
                    backgroundColor: theme.colorScheme.primary,
                    borderRadiusAll: Constant.containerRadius.large,
                    elevation: 0,
                    child: MyText.bodyMedium(
                      'Ask A Question',
                      color: theme.colorScheme.onPrimary,
                      fontWeight: 700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          MySpacing.height(16),
          Padding(
            padding: MySpacing.horizontal(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText.bodyMedium(
                  'Agent Listings',
                  fontWeight: 700,
                ),
                MyText.bodySmall(
                  'See All',
                  xMuted: true,
                  fontSize: 10,
                ),
              ],
            ),
          ),
          MySpacing.height(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildHouseList(),
            ),
          ),
        ],
      );
    }
  }
}
