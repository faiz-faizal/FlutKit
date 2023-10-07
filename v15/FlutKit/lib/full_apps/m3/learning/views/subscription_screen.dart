import 'package:flutkit/full_apps/m3/learning/controllers/subscription_controller.dart';
import 'package:flutkit/full_apps/m3/learning/models/pricing.dart';
import 'package:flutkit/helpers/extensions/extensions.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
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
  late SubscriptionController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.learningTheme;
    controller = SubscriptionController();
  }

  Widget _buildSinglePlan(Pricing pricing) {
    bool selected = controller.selectedPlan == pricing;
    return MyContainer.bordered(
      onTap: () {
        controller.onSelectPlan(pricing);
      },
      paddingAll: 16,
      margin: MySpacing.bottom(20),
      border: Border.all(
          color: selected ? theme.colorScheme.primary : Colors.transparent),
      color: theme.colorScheme.primaryContainer,
      borderRadiusAll: Constant.containerRadius.medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium(
            pricing.name,
            color: theme.colorScheme.primary,
            fontWeight: selected ? 700 : 500,
            letterSpacing: 0.3,
          ),
          MySpacing.height(8),
          Row(
            children: [
              MyText.displaySmall(
                '\$ ${pricing.price}',
                fontWeight: selected ? 700 : 500,
              ),
              MyText.bodyMedium(
                ' /Month ',
                muted: true,
                letterSpacing: 0,
                fontWeight: selected ? 700 : 500,
                color: selected ? theme.colorScheme.primary : null,
              ),
            ],
          ),
          MySpacing.height(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText.bodySmall(
                pricing.description,
                color: selected ? theme.colorScheme.primary : null,
              ),
              MyContainer.bordered(
                borderRadiusAll: Constant.buttonRadius.large,
                border: Border.all(color: theme.colorScheme.primary),
                color: selected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.primaryContainer,
                padding: MySpacing.xy(32, 10),
                child: MyText.labelLarge(
                  'Buy',
                  color: selected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        tag: 'subscription_screen',
        init: controller,
        builder: (controller) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (controller.uiLoading) {
      return Scaffold(
        body: Padding(
          padding: MySpacing.top(MySpacing.safeAreaTop(context) + 16),
          child: LoadingEffect.getSearchLoadingScreen(context),
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
              color: theme.colorScheme.onBackground,
            ).autoDirection(),
          ),
        ),
        body: ListView(
          padding: MySpacing.fromLTRB(20, 0, 20, 20),
          children: [
            MyText.titleLarge(
              'Pricing',
              fontWeight: 700,
              color: theme.colorScheme.primary,
            ),
            MyText.bodySmall(
              'Select a suitable plan',
              muted: true,
              color: theme.colorScheme.primary,
            ),
            MySpacing.height(20),
            ...controller.pricingPlans!
                .map((pricing) => _buildSinglePlan(pricing))
                .toList(),
          ],
        ),
      );
    }
  }
}
