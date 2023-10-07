import 'package:flutkit/full_apps/m3/estate/models/agent.dart';
import 'package:flutkit/full_apps/m3/estate/models/house.dart';
import 'package:flutkit/full_apps/m3/estate/views/single_estate_screen.dart';
import 'package:get/get.dart';

class SingleAgentController extends GetxController {
  bool showLoading = true, uiLoading = true;

  List<House>? houses;
  late Agent agent;

  SingleAgentController(this.agent);

  @override
  void onInit() {
    super.onInit();
    // super.save = false;

    fetchData();
  }

  void fetchData() async {
    await Future.delayed(Duration(seconds: 1));

    houses = await House.getDummyList();

    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleHouseScreen(House house) {
    Get.to(SingleEstateScreen(house));
    // Navigator.of(context, rootNavigator: true).push(
    //     MaterialPageRoute(builder: (context) => SingleEstateScreen(house)));
  }
}
