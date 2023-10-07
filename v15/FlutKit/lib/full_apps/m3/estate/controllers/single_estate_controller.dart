import 'package:flutkit/full_apps/m3/estate/models/agent.dart';
import 'package:flutkit/full_apps/m3/estate/models/house.dart';
import 'package:flutkit/full_apps/m3/estate/views/single_agent_screen.dart';
import 'package:get/get.dart';

class SingleEstateController extends GetxController {
  bool showLoading = true, uiLoading = true;
  late House house;

  SingleEstateController(this.house);

  @override
  void onInit() {
    // super.save = false;
    getHouse();
    super.onInit();
  }

  getHouse() async {
    await Future.delayed(Duration(seconds: 1));
    showLoading = false;
    uiLoading = false;
    update();
  }

  void goToSingleAgentScreen(Agent agent) {
    Get.to(SingleAgentScreen(agent));
    // Navigator.of(context, rootNavigator: true).push(
    //     MaterialPageRoute(builder: (context) => SingleAgentScreen(agent)));
  }
}
