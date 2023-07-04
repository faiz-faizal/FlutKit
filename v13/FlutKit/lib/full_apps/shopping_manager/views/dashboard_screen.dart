import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutkit/widgets/syncfusion/data/charts_sample_data.dart';

import '../controllers/dashboard_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late ThemeData theme;
  late DashboardController controller;
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.shoppingManagerTheme;
    controller = FxControllerStore.putOrFind(DashboardController());
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        color: theme.dividerColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<DashboardController>(
        controller: controller,
        theme: theme,
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: FxSpacing.fromLTRB(
                    20, FxSpacing.safeAreaTop(context) + 16, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxText.titleLarge(
                      "Dashboard",
                      fontWeight: 600,
                    ),
                    FxSpacing.height(16),
                    alert(),
                    FxSpacing.height(16),
                    overview(),
                    FxSpacing.height(20),
                    statistics(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget alert() {
    return FxContainer(
      color: Constant.softColors.green.color,
      child: Row(
        children: [
          FxText.bodySmall(
            'Alert: ',
            color: Constant.softColors.green.onColor,
            fontWeight: 700,
          ),
          FxText.bodySmall(
            'Your shop is approved for outside delivery',
            color: Constant.softColors.green.onColor,
            fontWeight: 600,
            fontSize: 11,
          )
        ],
      ),
    );
  }

  Widget timeFilter() {
    return PopupMenuButton(
      color: theme.colorScheme.background,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constant.containerRadius.small)),
      elevation: 1,
      child: FxContainer.bordered(
          paddingAll: 12,

          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FxText.bodySmall(
                controller.time,
              ),
              FxSpacing.width(8),
              Icon(
                FeatherIcons.chevronDown,
                size: 14,
              )
            ],
          )),
      itemBuilder: (BuildContext context) => [
        ...controller.filterTime.map((time) => PopupMenuItem(
            onTap: () {
              controller.changeFilter(time);
            },
            padding: FxSpacing.x(16),
            height: 36,
            child: FxText.bodyMedium(time)))
      ],
    );
  }

  Widget overview() {
    return Column(
      children: [
        FxContainer(

            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FxContainer(
                      width: 10,
                      height: 20,
                      color: theme.colorScheme.primaryContainer,
                      borderRadiusAll: 2,
                    ),
                    FxSpacing.width(8),
                    FxText.titleSmall(
                      "Overview",
                      fontWeight: 600,
                    ),
                  ],
                ),
                timeFilter()
              ],
            ),
            FxSpacing.height(20),
            status()
          ],
        )),
      ],
    );
  }

  Widget status() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: FxContainer.bordered(
              color: theme.colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FxText.bodySmall(
                    'Customers',
                    fontWeight: 600,
                    muted: true,
                  ),
                  FxSpacing.height(8),
                  FxText.titleLarge(
                    '248',
                    fontWeight: 700,
                  ),
                  FxSpacing.height(8),
                  FxContainer(
                      borderRadiusAll: Constant.containerRadius.small,
                      paddingAll: 6,
                      color: theme.colorScheme.primaryContainer,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            FeatherIcons.arrowUp,
                            size: 12,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                          FxSpacing.width(2),
                          FxText.bodySmall(
                            "28%",
                            color: theme.colorScheme.onPrimaryContainer,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          FxSpacing.width(20),
          Expanded(
              child: FxContainer(
            color: theme.colorScheme.primaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodySmall(
                  'Income',
                  fontWeight: 600,
                  muted: true,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                FxSpacing.height(8),
                FxText.titleLarge(
                  '148k',
                  fontWeight: 700,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                FxSpacing.height(8),
                FxContainer(
                    borderRadiusAll: Constant.containerRadius.small,
                    paddingAll: 6,
                    color: theme.colorScheme.errorContainer,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          FeatherIcons.arrowDown,
                          size: 12,
                          color: theme.colorScheme.onErrorContainer,
                        ),
                        FxSpacing.width(2),
                        FxText.bodySmall(
                          "45%",
                          fontWeight: 600,
                          color: theme.colorScheme.onErrorContainer,
                        )
                      ],
                    ))
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget statistics() {
    return FxContainer(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FxContainer(
                  width: 10,
                  height: 20,
                  color: theme.colorScheme.primaryContainer,
                  borderRadiusAll: 2,
                ),
                FxSpacing.width(8),
                FxText.titleSmall(
                  "Sales Status",
                  fontWeight: 600,
                ),
              ],
            ),
            timeFilter()
          ],
        ),
        FxSpacing.height(20),
        salesStatusChart()
      ],
    ));
  }

  SfCartesianChart salesStatusChart() {
    return SfCartesianChart(
      margin: EdgeInsets.zero,
      plotAreaBorderWidth: 0,
      primaryXAxis: CategoryAxis(
        majorGridLines: MajorGridLines(
          width: 0,
          color: Colors.transparent,
        ),
      ),
      primaryYAxis: NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          axisLine: AxisLine(width: 0, color: Colors.transparent),
          labelFormat: '{value}k',
          majorTickLines: MajorTickLines(size: 4, color: Colors.transparent)),
      series: _getDefaultColumnSeries(),
      tooltipBehavior: controller.tooltipBehavior,
    );
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: controller.chartData,
        xValueMapper: (ChartSampleData sales, _) => sales.x as String,
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        pointColorMapper: (ChartSampleData sales, _) => sales.pointColor,
        width: 0.5,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(Constant.containerRadius.xs)),
        dataLabelSettings: DataLabelSettings(
            isVisible: false, textStyle: TextStyle(fontSize: 10)),
      )
    ];
  }
}
