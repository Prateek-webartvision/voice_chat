import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find<HomeController>();

  List<String>? banners;

  // ApiStatusEnum statusEnum = ApiStatusEnum.loading;

  addBanner(List<String> banner) {
    banners = banner;
    update();
  }

  setNull() {
    banners = null;
    update();
  }
}
