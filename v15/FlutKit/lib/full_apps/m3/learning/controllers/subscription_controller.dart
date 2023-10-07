import 'package:flutkit/full_apps/m3/learning/models/pricing.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  bool showLoading = true, uiLoading = true;
  int selected = 1;
  List<Pricing>? pricingPlans;
  late Pricing selectedPlan;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    pricingPlans = await Pricing.getDummyList();
    selectedPlan = pricingPlans!.first;
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Get.back();
  }

  void onSelectPlan(Pricing pricing) {
    selectedPlan = pricing;
    update();
  }
}
