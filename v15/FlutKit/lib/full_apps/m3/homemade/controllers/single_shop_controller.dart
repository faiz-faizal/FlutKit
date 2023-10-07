import 'package:flutkit/full_apps/m3/homemade/models/category.dart';
import 'package:get/get.dart';

class SingleShopController extends GetxController {
  bool showLoading = true, uiLoading = true;
  List<Category> categories = [];

  @override
  void onInit() {
    // super.save = false;
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    categories = await Category.getDummyList();
    await Future.delayed(Duration(seconds: 1));

    showLoading = false;
    uiLoading = false;
    update();
  }
}
