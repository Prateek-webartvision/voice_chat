class PostSeggestedModel {
  final String userName;
  final String userProfile;
  final String? message;
  final String? image;
  final int likes;
  final int comments;
  final bool isfriend;
  final bool isLiked;

  PostSeggestedModel({
    required this.userName,
    required this.userProfile,
    this.message,
    this.image,
    required this.likes,
    required this.comments,
    required this.isfriend,
    required this.isLiked,
  });
}
