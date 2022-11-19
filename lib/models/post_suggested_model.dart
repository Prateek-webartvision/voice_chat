class PostSeggestedModel {
  final String userName;
  final String? userProfile;
  final String? comment;
  final String? image;
  final int likes;
  final int comments;
  bool isfriend;
  bool isLiked;

  PostSeggestedModel({
    required this.userName,
    this.userProfile,
    this.comment,
    this.image,
    required this.likes,
    required this.comments,
    required this.isfriend,
    required this.isLiked,
  });

  factory PostSeggestedModel.formJson(Map<String, dynamic> json) {
    return PostSeggestedModel(
      userName: "${json['first_name']} ${json['last_name']}",
      comment: json['body'],
      image: json['creator_image'],
      likes: 2,
      comments: 2,
      isfriend: false,
      isLiked: false,
    );
  }
}
