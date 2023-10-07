import 'package:flutkit/full_apps/m3/learning/models/course.dart';
import 'package:flutkit/full_apps/m3/learning/views/edit_profile_screen.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool showLoading = true, uiLoading = true;
  List<Course>? courses;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    courses = Course.categoryList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToEditProfile() {
    Get.to(EditProfileScreen());
    // Navigator.of(context, rootNavigator: true).push(
    //   MaterialPageRoute(
    //     builder: (context) => EditProfileScreen(),
    //   ),
    // );
  }

  void logout() {
    Get.back();
    // Navigator.pop(context);
  }
}
