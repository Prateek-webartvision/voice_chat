import 'package:get/get.dart';

class MessageController extends GetxController {
  static MessageController instance = Get.find<MessageController>();
  List<MessageModel> messages = [];

  pushMessage(MessageModel data) {
    messages.add(data);
    update();
  }
}

class MessageModel {
  final String message;
  final String name;
  String? profilePic;

  MessageModel({required this.name, required this.message, this.profilePic});

  factory MessageModel.fromJson(Map<String, dynamic> map) {
    return MessageModel(
      name: map['name'],
      profilePic: null,
      message: map['message'],
    );
  }
}
