import 'package:flutkit/full_apps/other/muvi/controllers/subscription_controller.dart';
import 'package:flutkit/full_apps/other/muvi/models/subscription.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutkit/loading_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late SubscriptionController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;

    controller = SubscriptionController();
  }

  List<Widget> _buildPlanList() {
    List<Widget> list = [];
    for (Subscription subscription in controller.subscriptions!) {
      list.add(_buildSinglePlan(subscription));
    }
    return list;
  }

  Widget _buildSinglePlan(Subscription subscription) {
    bool selected = subscription == controller.subscription;
    return MyContainer.bordered(
      borderRadiusAll: 4,
      width: (MediaQuery.of(context).size.width - 60) / 2,
      onTap: () {
        controller.selectPlan(subscription);
      },
      color:
          selected ? customTheme.muviPrimary.withAlpha(30) : customTheme.card,
      border: Border.all(
          color: selected ? customTheme.muviPrimary : customTheme.border),
      child: Column(
        children: [
          MyText.bodyLarge(
            subscription.type,
            fontWeight: 600,
          ),
          MySpacing.height(8),
          MyText.titleMedium(
            '\$${subscription.price}',
            fontWeight: 700,
          ),
          MyText.bodySmall(
            '/per month',
            xMuted: true,
          ),
          MySpacing.height(8),
          MyText.labelMedium(
            subscription.features,
          ),
          MySpacing.height(8),
          MyButton(
            buttonType:
                selected ? MyButtonType.elevated : MyButtonType.outlined,
            onPressed: () {
              controller.selectPlan(subscription);
            },
            padding: MySpacing.xy(12, 8),
            backgroundColor:
                selected ? customTheme.muviPrimary : Colors.transparent,
            elevation: 0,
            borderColor: customTheme.muviPrimary,
            borderRadiusAll: 4,
            splashColor: (!selected
                    ? customTheme.muviPrimary
                    : customTheme.muviOnPrimary)
                .withAlpha(40),
            child: MyText.bodySmall(
              selected ? 'Selected' : 'Choose Plan',
              color: selected
                  ? customTheme.muviOnPrimary
                  : customTheme.muviPrimary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        init: controller,
        tag: 'subscription_screen',
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Container(
          margin: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
          child: LoadingEffect.getSearchLoadingScreen(
            context,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () {
              controller.goBack();
            },
            child: Icon(
              LucideIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: MyText.titleMedium(
            'Choose your plan',
            fontWeight: 600,
          ),
        ),
        body: ListView(
          padding: MySpacing.fromLTRB(20, 0, 20, 20),
          children: [
            MyContainer(
              padding: MySpacing.xy(32, 20),
              borderRadiusAll: 4,
              border: Border.all(color: customTheme.muviPrimary),
              color: customTheme.muviPrimary.withAlpha(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.bodyMedium(
                    'Upgrade your \nplan anytime!',
                    textAlign: TextAlign.center,
                    color: customTheme.muviPrimary,
                  ),
                  MyContainer(
                    color: customTheme.muviPrimary,
                    padding: MySpacing.xy(20, 10),
                    borderRadiusAll: 20,
                    child: MyText.labelMedium(
                      'Upgrade',
                      color: customTheme.muviOnPrimary,
                    ),
                  ),
                ],
              ),
            ),
            MySpacing.height(20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: _buildPlanList(),
            ),
          ],
        ),
      );
    }
  }
}
