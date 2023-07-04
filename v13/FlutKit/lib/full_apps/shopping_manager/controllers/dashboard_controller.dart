import 'package:flutx/flutx.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutkit/widgets/syncfusion/data/charts_sample_data.dart';

class DashboardController extends FxController {
  late List<String> filterTime;
  late String time;
  late TooltipBehavior tooltipBehavior;
  late List<ChartSampleData> chartData;

  @override
  void initState() {
    super.initState();
    filterTime = ["All time", "Yesterday", "This week", "7 days ago"];
    time = filterTime.first;
    initChartData();
  }

  initChartData() {
    tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: false);

    chartData = <ChartSampleData>[
      ChartSampleData(
          x: '1', y: 10, pointColor: Constant.softColors.blue.color),
      ChartSampleData(
        x: '2',
        y: 8,
        pointColor: Constant.softColors.violet.color,
      ),
      ChartSampleData(
        x: '3',
        y: 16,
        pointColor: Constant.softColors.orange.color,
      ),
      ChartSampleData(
        x: '4',
        y: 24,
        pointColor: Constant.softColors.blue.color,
      ),
      ChartSampleData(
        x: '5',
        y: 32,
        pointColor: Constant.softColors.orange.color,
      ),
      ChartSampleData(
        x: '6',
        y: 30,
        pointColor: Constant.softColors.blue.color,
      ),
      ChartSampleData(
        x: '7',
        y: 25,
        pointColor: Constant.softColors.violet.color,
      ),
    ];
  }

  void changeFilter(String time) {
    this.time = time;
    update();
  }

  @override
  String getTag() {
    return "shopping_login_controller";
  }
}
