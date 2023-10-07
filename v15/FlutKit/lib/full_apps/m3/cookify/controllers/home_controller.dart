import 'package:flutkit/full_apps/m3/cookify/models/recipe.dart';
import 'package:flutkit/full_apps/m3/cookify/views/recipe_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool showLoading = true, uiLoading = true;
  late Recipe recipe;
  late List<Recipe> trendingRecipe;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    recipe = await Recipe.getOne();
    trendingRecipe = await Recipe.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToRecipeScreen() {
    Get.to(RecipeScreen());
    // Navigator.of(context, rootNavigator: true)
    //     .push(MaterialPageRoute(builder: (context) => RecipeScreen()));
  }
}
