import 'package:flutkit/full_apps/other/estate/controllers/single_agent_controller.dart';
import 'package:flutkit/full_apps/other/estate/models/agent.dart';
import 'package:flutkit/full_apps/other/estate/models/house.dart';
import 'package:flutkit/full_apps/other/estate/views/single_estate_screen.dart';
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

class EstateSingleAgentScreen extends StatefulWidget {
  final Agent agent;

  const EstateSingleAgentScreen(this.agent);

  @override
  _EstateSingleAgentScreenState createState() =>
      _EstateSingleAgentScreenState();
}

class _EstateSingleAgentScreenState extends State<EstateSingleAgentScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;
  late EstateSingleAgentController estateSingleAgentController;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    estateSingleAgentController = EstateSingleAgentController(widget.agent);
  }

  Widget _buildSingleHouse(House house) {
    return MyCard(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EstateSingleEstateScreen(house)));
      },
      margin: MySpacing.right(16),
      width: 200,
      paddingAll: 16,
      borderRadiusAll: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyContainer(
            paddingAll: 0,
            borderRadiusAll: 8,
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
          ),
          MySpacing.height(4),
          MyText.bodySmall(
            house.location,
            xMuted: true,
          ),
          MySpacing.height(4),
          MyText.bodySmall(
            house.price,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHouseList() {
    List<Widget> list = [];
    list.add(MySpacing.width(24));

    for (House house in estateSingleAgentController.houses!) {
      list.add(_buildSingleHouse(house));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EstateSingleAgentController>(
        init: estateSingleAgentController,
        tag: 'estate_single_agent_controller',
        builder: (estateSingleAgentController) {
          return Scaffold(
            body: Padding(
              padding: MySpacing.top(32),
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                    child: estateSingleAgentController.showLoading
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
    if (estateSingleAgentController.uiLoading) {
      return Container(
          margin: MySpacing.top(16),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ));
    } else {
      return ListView(
        padding: MySpacing.top(8),
        children: [
          Padding(
            padding: MySpacing.horizontal(24),
            child: Row(
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
              borderRadiusAll: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      MyContainer(
                        paddingAll: 0,
                        borderRadiusAll: 12,
                        clipBehavior: Clip.hardEdge,
                        child: Image(
                          height: 56,
                          fit: BoxFit.cover,
                          image: AssetImage(
                              estateSingleAgentController.agent.image),
                        ),
                      ),
                      MySpacing.width(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyLarge(
                            estateSingleAgentController.agent.name,
                            fontWeight: 700,
                          ),
                          MySpacing.height(8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: theme.colorScheme.onBackground
                                    .withAlpha(180),
                              ),
                              MySpacing.width(4),
                              MyText.bodySmall(
                                estateSingleAgentController.agent.address,
                                xMuted: true,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  MySpacing.height(16),
                  MyText.bodySmall(
                    'Information',
                    fontWeight: 700,
                  ),
                  MySpacing.height(8),
                  Row(
                    children: [
                      MyContainer.rounded(
                          paddingAll: 4,
                          color: customTheme.estatePrimary.withAlpha(40),
                          child: Icon(
                            Icons.phone,
                            color: customTheme.estatePrimary,
                            size: 14,
                          )),
                      MySpacing.width(12),
                      MyText.bodySmall(
                        estateSingleAgentController.agent.number,
                      ),
                    ],
                  ),
                  MySpacing.height(8),
                  Row(
                    children: [
                      MyContainer.rounded(
                          paddingAll: 4,
                          color: customTheme.estatePrimary.withAlpha(40),
                          child: Icon(
                            Icons.house,
                            color: customTheme.estatePrimary,
                            size: 14,
                          )),
                      MySpacing.width(12),
                      MyText.bodySmall(
                        estateSingleAgentController.agent.properties,
                      ),
                    ],
                  ),
                  MySpacing.height(16),
                  MyText.bodySmall(
                    'About Me',
                    fontWeight: 700,
                  ),
                  MySpacing.height(8),
                  RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: estateSingleAgentController.agent.description,
                          style: MyTextStyle.bodySmall(
                            color: theme.colorScheme.onBackground,
                            xMuted: true,
                            height: 1.5,
                          )),
                      TextSpan(
                        text: " Read more",
                        style: MyTextStyle.bodySmall(
                          color: customTheme.estatePrimary,
                        ),
                      ),
                    ]),
                  ),
                  MySpacing.height(16),
                  MyButton.block(
                    padding:
                        MySpacing.symmetric(horizontal: 24, vertical: 2016),
                    onPressed: () {
                      estateSingleAgentController.goToAgentChat();
                    },
                    backgroundColor: customTheme.estatePrimary,
                    borderRadiusAll: 12,
                    elevation: 0,
                    child: MyText.bodyMedium(
                      'Ask A Question',
                      color: customTheme.estateOnPrimary,
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
                MyText.labelSmall(
                  'See All',
                  xMuted: true,
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
