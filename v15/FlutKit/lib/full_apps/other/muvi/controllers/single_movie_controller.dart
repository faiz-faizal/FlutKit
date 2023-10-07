import 'package:flutkit/full_apps/other/muvi/models/movie.dart';
import 'package:get/get.dart';

class SingleMovieController extends GetxController {
  final Movie movie;

  SingleMovieController(this.movie);

  bool showLoading = true, uiLoading = true;
  @override
  void onInit() {
    // super.save = false;
    fetchData();
    super.onInit();
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
