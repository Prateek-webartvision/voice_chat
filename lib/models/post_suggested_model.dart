class PostSeggestedModel {
  final int id;
  final String? title;
  final String? messageBody;
  final String? image;
  final int createdBy;
  final String userName;
  final String? userProfile;

  final int likes;
  final int comments;
  final bool active;
  final String? info;
  final String? createdAt;
  final String? updatedAt;

  bool isfriend;
  bool isLiked;

  PostSeggestedModel({
    required this.id,
    this.title,
    this.image,
    required this.createdBy,
    required this.userName,
    this.userProfile,
    this.messageBody,
    required this.likes,
    required this.comments,
    required this.active,
    this.info,
    this.createdAt,
    this.updatedAt,
    required this.isLiked,
    required this.isfriend,
  });

  factory PostSeggestedModel.formJson(Map<String, dynamic> json) {
    return PostSeggestedModel(
      id: json['id'],
      title: json["title"],
      messageBody: json['body'],
      image: json['image'],
      userName: "${json['first_name']} ${json['last_name']}",
      createdBy: json['created_by'],
      userProfile: json['creator_image'],
      active: json['active'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      info: json['info'],
      likes: 2,
      comments: 2,
      isfriend: false,
      isLiked: false,
    );
  }
}
