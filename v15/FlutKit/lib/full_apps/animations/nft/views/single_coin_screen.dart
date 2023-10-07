import 'package:flutkit/full_apps/animations/nft/controllers/single_coin_controller.dart';
import 'package:flutkit/full_apps/animations/nft/models/coin.dart';
import 'package:flutkit/helpers/theme/app_theme.dart';
import 'package:flutkit/helpers/theme/constant.dart';
import 'package:flutkit/helpers/widgets/my_button.dart';
import 'package:flutkit/helpers/widgets/my_container.dart';
import 'package:flutkit/helpers/widgets/my_spacing.dart';
import 'package:flutkit/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SingleCoinScreen extends StatefulWidget {
  final Coin coin;

  const SingleCoinScreen({Key? key, required this.coin}) : super(key: key);

  @override
  _SingleCoinScreenState createState() => _SingleCoinScreenState();
}

class _SingleCoinScreenState extends State<SingleCoinScreen> {
  late ThemeData theme;
  late SingleCoinController controller;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.nftTheme;
    controller = SingleCoinController(widget.coin);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SingleCoinController>(
        init: controller,
        tag: 'single_coin_controller',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: InkWell(
                  onTap: () {
                    controller.goBack();
                  },
                  child: Icon(LucideIcons.chevronLeft)),
            ),
            body: Padding(
              padding: MySpacing.nTop(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        titleView(),
                        MySpacing.height(20),
                        coinPrice(),
                        MySpacing.height(20),
                        intervals(),
                        MySpacing.height(40),
                        coinChart(),
                        MySpacing.height(40),
                        chartOption(),
                      ],
                    ),
                  ),
                  MyButton.block(
                    onPressed: () {},
                    elevation: 0,
                    padding: MySpacing.y(20),
                    borderRadiusAll: Constant.buttonRadius.xs,
                    child: MyText.labelLarge(
                      "Buy Crypto",
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget titleView() {
    return Row(
      children: [
        MyContainer(
          paddingAll: 12,
          borderRadiusAll: Constant.containerRadius.xs,
          child: Image(
            height: 32,
            width: 32,
            image: AssetImage(controller.coin.image),
          ),
        ),
        MySpacing.width(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.bodyMedium(
                    controller.coin.name,
                    fontWeight: 700,
                  ),
                  MyText.bodyMedium(
                    "USD 2,325.50",
                    fontWeight: 700,
                  ),
                ],
              ),
              MySpacing.height(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText.bodyMedium(
                    controller.coin.code,
                    fontWeight: 600,
                    xMuted: true,
                  ),
                  MyText.bodyMedium("+3.05%",
                      fontWeight: 600, color: theme.colorScheme.primary),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget coinPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodySmall(
          "${controller.coin.name} Price",
          xMuted: true,
          fontWeight: 600,
        ),
        MySpacing.height(8),
        MyText.titleLarge(
          "\$ ${controller.coin.price}",
          fontWeight: 700,
        ),
        MySpacing.height(4),
        MyText.titleSmall(
          "\$ ${controller.coin.priceChange} (${controller.coin.percentChange}%)",
          fontWeight: 600,
          color: (controller.coin.percentChange.toString().startsWith("-"))
              ? theme.colorScheme.error
              : theme.colorScheme.primary,
        ),
      ],
    );
  }

  Widget coinChart() {
    return SizedBox(
      height: 240,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        margin: EdgeInsets.zero,
        primaryXAxis: NumericAxis(
            isVisible: false,
            majorGridLines: MajorGridLines(width: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(
            isVisible: true,
            interval: 200,
            axisLine: AxisLine(width: 0),
            majorGridLines: MajorGridLines(width: 0),
            majorTickLines: MajorTickLines(size: 0),
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        series: controller.getCoinSeries(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  Widget intervals() {
    List<Widget> list = [];
    for (int i = 0; i < controller.intervals.length; i++) {
      list.add(MyContainer.rounded(
        onTap: () {
          controller.changeInterval(i);
        },
        paddingAll: 12,
        color: controller.selected == i
            ? theme.colorScheme.primary
            : theme.scaffoldBackgroundColor,
        bordered: true,
        border: Border.all(
            color: controller.selected == i
                ? theme.colorScheme.primary
                : theme.dividerColor),
        child: Center(
            child: MyText.bodySmall(controller.intervals[i],
                fontWeight: 600,
                color: controller.selected == i
                    ? theme.colorScheme.onPrimary
                    : null)),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  Widget chartOption() {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: theme.colorScheme.primary,
        ),
        MySpacing.width(4),
        MyText.bodyMedium(
          "USD",
          fontWeight: 600,
        ),
        MySpacing.width(16),
        Icon(
          Icons.check_circle,
          color: theme.colorScheme.primary,
        ),
        MySpacing.width(4),
        MyText.bodyMedium(
          "Market cap",
          fontWeight: 600,
        ),
      ],
    );
  }
}
