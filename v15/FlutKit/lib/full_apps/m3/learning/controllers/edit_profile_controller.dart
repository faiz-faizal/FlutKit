import 'package:get/get.dart';

class EditProfileController extends GetxController {
  bool showLoading = true, uiLoading = true;

  Gender gender = Gender.male;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void changeGender(Gender gender) {
    this.gender = gender;
    update();
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }
}

enum Gender { male, female }
