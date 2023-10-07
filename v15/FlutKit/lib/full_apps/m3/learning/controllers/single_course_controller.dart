import 'package:flutkit/full_apps/m3/learning/models/recent_course.dart';
import 'package:get/get.dart';

class SingleCourseController extends GetxController {
  RecentCourse recentCourse;

  SingleCourseController(this.recentCourse);

  bool showLoading = true, uiLoading = true;

  @override
  void onInit() {
    super.onInit();
    // save = false;
    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goBack() {
    Get.back();
    // Navigator.pop(context);
  }
}
