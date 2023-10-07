import 'package:flutkit/full_apps/other/muvi/views/full_app.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  bool showLoading = true, uiLoading = true;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void forgotPassword() {
    Get.to(FullApp());
    // Navigator.push(context, MaterialPageRoute(builder: (context) => FullApp()));
  }
}
