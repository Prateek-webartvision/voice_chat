import 'package:get/get.dart';
import 'package:voice_chat/data/app_enums.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find<HomeController>();

  List<String> banners = [];

  // ApiStatusEnum statusEnum = ApiStatusEnum.loading;

  addBanner(String banner) {
    banners.add(banner);
    update();
  }
}
