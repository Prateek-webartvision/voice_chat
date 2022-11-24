import 'package:get/get.dart';
import 'package:voice_chat/models/friend_model.dart';

class FriendRequestController extends GetxController {
  static FriendRequestController instance = Get.find<FriendRequestController>();

  FirendModel? firendsmodelList;

  friendRequestFun(FirendModel firendData) {
    firendsmodelList = firendData;
    update();
    // print(firendData.data.requestReceived[0]);
  }
}
