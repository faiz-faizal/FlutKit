import 'package:flutkit/full_apps/m3/cookify/models/date_time.dart';
import 'package:flutkit/full_apps/m3/cookify/models/meal_plan.dart';
import 'package:get/get.dart';

class MealPlanController extends GetxController {
  bool showLoading = true, uiLoading = true;
  int selectedDate = 0;
  late List<DateTime> listDateTime;
  late List<MealPlan> listMealPlan;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    listDateTime = DateTime.getList();
    listMealPlan = await MealPlan.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }
}
