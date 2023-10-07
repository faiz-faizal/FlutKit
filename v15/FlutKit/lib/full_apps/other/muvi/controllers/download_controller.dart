import 'package:flutkit/full_apps/other/muvi/models/download_movie.dart';
import 'package:get/get.dart';

class DownloadController extends GetxController {
  bool showLoading = true, uiLoading = true;
  List<DownloadMovie>? downloadMovies;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    downloadMovies = await DownloadMovie.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }
}
