import 'package:voice_chat/controllers/home_controller.dart';
import 'package:voice_chat/data/app_urls.dart';

import '../data/api_services.dart';

class HomeRepository {
  static getHomeBanner() {
    HomeController.instance.setNull();
    ApiServices.getApi(url: AppUrls.homeBanner).then((value) {
      List<String> tempList = [];

      if (value["status"] == true) {
        for (var element in value['data']) {
          tempList.add(element['obj']);
        }

        HomeController.instance.addBanner(tempList);

        // print(tempList);
      }
      // print(value);
    }).onError((error, stackTrace) {
      print(error);
    });
  }
}
