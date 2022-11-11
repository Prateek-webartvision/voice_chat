import 'package:get/get.dart';
import 'package:voice_chat/models/room_model.dart';

class RoomController extends GetxController {
  static RoomController instance = Get.find<RoomController>();

  List<RoomModel> rooms = [
    RoomModel(
      userProfile:
          "https://image.shutterstock.com/image-photo/portrait-normal-boy-smiling-over-260nw-135283244.jpg",
      userName: "Ali",
      roomThum:
          "https://img.freepik.com/premium-psd/modern-video-game-review-youtube-channel-thumbnail-web-banner-template-premium-psd_449870-718.jpg?w=2000",
    ),
    RoomModel(
      userProfile:
          "https://thumbs.dreamstime.com/b/handsome-man-black-suit-white-shirt-posing-studio-attractive-guy-fashion-hairstyle-confident-man-short-beard-125019349.jpg",
      userName: "Ali Baba",
      roomThum:
          "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pubg-thumbnail-design-template-10e7f5b04d05ef85b50fe4a9b497a0c8_screen.jpg?ts=1612534876",
    ),
    RoomModel(
      userProfile:
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      userName: "Prashant",
      roomThum: "https://i.ytimg.com/vi/05wIRd0Mz4U/maxresdefault.jpg",
    ),
  ];

  createRoom({required RoomModel room}) {
    rooms.add(room);
    update();
  }
}
