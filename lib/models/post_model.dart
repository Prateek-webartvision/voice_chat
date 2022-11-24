import 'package:voice_chat/controllers/user_controller.dart';

class PostModel {
  final int id;
  final String? title;
  String? messageBody;
  String? tag;
  final String? image;

  List<PostLikeModel> likes;
  List<PostCommentModel> comments;

  final int createdBy;
  final String userName;

  String? userProfile;
  String? info;
  final bool active;

  final String? createdAt;
  final String? updatedAt;

  int likeCount;
  // int comments;
  bool isfriend;
  bool isLiked;

  PostModel({
    required this.id,
    required this.title,
    required this.messageBody,
    required this.tag,
    required this.image,
    required this.likes,
    required this.comments,
    required this.createdBy,
    required this.userName,
    required this.userProfile,
    required this.info,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.isLiked,
    required this.likeCount,
    required this.isfriend,
  });

  factory PostModel.formJson(Map<String, dynamic> json) {
    bool isliked = false;
    List<PostLikeModel> _likes = [];
    json['likes'].forEach((v) {
      _likes.add(PostLikeModel.fromJson(v));
      if (v["userid"] == UserController.instance.getId) {
        isliked = true;
      }
    });

    List<PostCommentModel> _commnet = [];
    json['comments'].forEach((v) {
      // print(v);
      _commnet.add(PostCommentModel.fromJson(v));
    });

    return PostModel(
      id: json['id'],
      title: json["title"],
      messageBody: json['body'],
      tag: json['tags'],
      image: json['image'],
      createdBy: json['created_by'],
      userName: "${json['first_name']} ${json['last_name']}",
      userProfile: json['creator_image'],
      info: json['info'],
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isfriend: false,
      likes: _likes,
      comments: _commnet,
      isLiked: isliked,
      likeCount: _likes.length,

      // isfriend: false,
      // isLiked: _isLiked,
    );
  }
}

//Post like
class PostLikeModel {
  final int userid;
  final String firstName;
  final String lastName;
  final String? image;
  final String createdAt;
  final String updatedAt;

  PostLikeModel({
    required this.userid,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostLikeModel.fromJson(Map<String, dynamic> json) {
    // if(json['userid'] )
    return PostLikeModel(
      userid: json['userid'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

// Post Model
class PostCommentModel {
  final int userid;
  final String firstName;
  final String lastName;
  final String? image;
  final String createdAt;
  final String updatedAt;
  final String message;

  PostCommentModel({
    required this.userid,
    required this.message,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostCommentModel.fromJson(Map<String, dynamic> json) {
    return PostCommentModel(
      userid: json['userid'],
      message: json['message'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
