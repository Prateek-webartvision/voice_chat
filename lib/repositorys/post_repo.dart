import 'package:voice_chat/controllers/post_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_suggested_model.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PostRepository {
  static PostRepository instance = PostRepository();

  createNewPost({String? postMessage, String? tag, String? image}) {
    AppUtils.progressDailog();
    ApiServices.multifilePost(
      url: AppUrls.createPost,
      mapData: {
        "token": UserController.instance.getToken,
        "body": postMessage ?? "",
        "title": "dsadsa",
      },
      imageData: (image != null)
          ? {
              "key": "post_image",
              "path": image,
            }
          : null,
    ).then((value) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: value['msg']);
      getAllPost();
    }).onError((error, stackTrace) {
      AppUtils.closeDailog();
      AppUtils.showSnakBar(msg: error.toString());
    });
  }

  getAllPost() {
    PostController.instance.allPostList.clear();
    ApiServices.getApi(url: AppUrls.getAllPost).then((value) {
      if (value['status'] == true) {
        for (var element in value['data']) {
          PostController.instance.addPost(PostSeggestedModel.formJson(element));
        }
      } else {
        AppUtils.showSnakBar(msg: value['msg']);
      }
    });
  }
}
