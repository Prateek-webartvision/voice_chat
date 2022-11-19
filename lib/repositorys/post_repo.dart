import 'package:voice_chat/controllers/post_controller.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_suggested_model.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PostRepository {
  static PostRepository instance = PostRepository();

  createNewPost({String? postMessage, String? tag, String? image}) {
    ApiServices.postApi(url: AppUrls.createPost, mapData: {
      "title": "?",
      "body": postMessage!,
      "created_by": UserController.instance.getId,
      "first_name": UserController.instance.getFirstName,
      "last_name": UserController.instance.getLastName,
      "creator_image": UserController.instance.getImage,
      "image": null,
      "active": true
    }).then((value) {
      AppUtils.showSnakBar(msg: "Your Moment is Posted");
    });
  }

  getAllPost() {
    PostController.instance.allPostList.clear();
    ApiServices.getApi(url: AppUrls.getAllPost).then((value) {
      if (value['status'] == true) {
        for (var element in value['data']) {
          print(element);
          PostController.instance.addPost(PostSeggestedModel.formJson(element));
        }
      } else {
        AppUtils.showSnakBar(msg: value['msg']);
      }
    });
  }
}
