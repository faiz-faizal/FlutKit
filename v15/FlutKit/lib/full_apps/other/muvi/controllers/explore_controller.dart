import 'package:flutkit/full_apps/other/muvi/models/movie.dart';
import 'package:flutkit/full_apps/other/muvi/views/single_movie_screen.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  bool showLoading = true, uiLoading = true;
  String selectedCategory = "Action";
  List<String> categories = [
    "Action",
    "Comedy",
    "Kids",
    "Thriller",
    "Suspense",
    "Drama",
    "Horror",
    "Fantasy",
    "Romance",
    "Mystery",
  ];
  List<Movie>? movies;
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    movies = await Movie.getDummyList();
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleMovieScreen(Movie movie) {
    Get.to(SingleMovieScreen(movie));
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => SingleMovieScreen(movie)));
  }

  double findAspectRatio() {
    double width = Get.width;
    return ((width - 60) / 2) / (250);
  }

  void selectCategory(String category) {
    selectedCategory = category;
    update();
  }
}
