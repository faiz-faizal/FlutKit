import 'package:flutkit/full_apps/animations/shopping/views/subscription_screen.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool showLoading = true, uiLoading = true;

  @override
  void onInit() {
    fetchData();

    super.onInit();
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSubscription() {
    Get.to(SubscriptionScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(
    //     builder: (context) => SubscriptionScreen(),
    //   ),
    // );
  }

  void logout() {
    Get.back();
    // Navigator.pop(context);
  }
}
