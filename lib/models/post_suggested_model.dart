class PostSeggestedModel {
  final String userName;
  final String userProfile;
  final String? comment;
  final String? image;
  final int likes;
  final int comments;
  bool isfriend;
  bool isLiked;

  PostSeggestedModel({
    required this.userName,
    required this.userProfile,
    this.comment,
    this.image,
    required this.likes,
    required this.comments,
    required this.isfriend,
    required this.isLiked,
  });
}

List<PostSeggestedModel> allPostList = [
  PostSeggestedModel(
    userName: "Ali",
    userProfile:
        "https://image.shutterstock.com/image-photo/portrait-normal-boy-smiling-over-260nw-135283244.jpg",
    image:
        "https://image.shutterstock.com/image-photo/portrait-normal-boy-smiling-over-260nw-135283244.jpg",
    comment:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    likes: 12,
    comments: 6,
    isfriend: false,
    isLiked: false,
  ),
  PostSeggestedModel(
    userName: "Ali Baba",
    userProfile:
        "https://thumbs.dreamstime.com/b/handsome-man-black-suit-white-shirt-posing-studio-attractive-guy-fashion-hairstyle-confident-man-short-beard-125019349.jpg",
    comment:
        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    likes: 12,
    comments: 6,
    isfriend: false,
    isLiked: false,
  ),
  PostSeggestedModel(
    userName: "Prashant",
    userProfile:
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
    likes: 1,
    comments: 1,
    isfriend: false,
    isLiked: true,
    image:
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&w=1000&q=80",
    comment:
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
  )
];
