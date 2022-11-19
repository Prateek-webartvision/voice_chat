import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';

class PostRepository {
  static PostRepository instance = PostRepository();

  createNewPost({String? postMessage, String? tag, String? image}) {
    ApiServices.postApi(url: AppUrls.createPost, mapData: {
      "title": "?",
      "body": postMessage!,
      "created_by": 1,
      "first_name": "name 1",
      "last_name": "name 2",
      "creator_image": null,
      "image": null,
      "active": true
    }).then((value) => print(value));
  }
}
