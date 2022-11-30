import 'package:voice_chat/controllers/home_controller.dart';
import 'package:voice_chat/data/app_urls.dart';

import '../data/api_services.dart';

class HomeRepository {
  static getHomeBanner() {
    HomeController.instance.banners.clear();
    ApiServices.getApi(url: AppUrls.homeBanner).then((value) {
      if (value["status"] == true) {
        for (var element in value['data']) {
          HomeController.instance.addBanner(element['obj']);
        }
      }
      // print(value);
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
