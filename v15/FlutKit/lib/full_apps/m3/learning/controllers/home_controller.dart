import 'package:flutkit/full_apps/m3/learning/models/course.dart';
import 'package:flutkit/full_apps/m3/learning/models/module.dart';
import 'package:flutkit/full_apps/m3/learning/models/recent_course.dart';
import 'package:flutkit/full_apps/m3/learning/views/single_course_screen.dart';
import 'package:flutkit/full_apps/m3/learning/views/subscription_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool showLoading = true, uiLoading = true;
  List<Course>? courses;
  List<Module>? modules;
  List<RecentCourse>? recentCourses;
  late Module selectedModule;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void onChangeSingleModule(Module module) {
    selectedModule = module;
    update();
  }

  void goToSingleCourseScreen(RecentCourse recentCourse) {
    Get.to(SingleCourseScreen(recentCourse));
    // Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
    //     builder: (context) => SingleCourseScreen(recentCourse)));
  }

  void goToPricingScreen() {
    Get.to(SubscriptionScreen());
    // Navigator.of(context, rootNavigator: true)
    //     .push(MaterialPageRoute(builder: (context) => SubscriptionScreen()));
  }

  void fetchData() async {
    courses = Course.categoryList();
    recentCourses = await RecentCourse.getDummyList();
    modules = Module.moduleList();
    selectedModule = modules!.first;
    showLoading = false;
    uiLoading = false;
    update();
  }
}
