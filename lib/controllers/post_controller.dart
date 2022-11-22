import 'package:get/get.dart';
import 'package:voice_chat/models/post_suggested_model.dart';

class PostController extends GetxController {
  static PostController instance = Get.find<PostController>();

  List<PostSeggestedModel> allPostList = [];

  addPost(PostSeggestedModel post) {
    // print(post.id);
    allPostList.add(post);
    update();
  }
}
