import 'package:get/get.dart';

class MessageController extends GetxController {
  static MessageController instance = Get.find<MessageController>();
  List<RoomMessageModel> messages = [];

  //update chat messages
  pushMessage(RoomMessageModel data) {
    messages.add(data);
    update();
  }

  // clearMessage() {
  //   messages;
  // }
}

class RoomMessageModel {
  final String message;
  final String name;
  String? profilePic;
  final String? msg;

  RoomMessageModel({required this.name, required this.message, this.profilePic, this.msg});

  // factory RoomMessageModel.fromJson(Map<String, dynamic> map) {
  //   // print();
  //   return RoomMessageModel(
  //     name: map['name'],
  //     profilePic: null,
  //     message: map['message'],
  //     msg: "chat",
  //   );
  // }
}
