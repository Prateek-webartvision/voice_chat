import 'package:voice_chat/models/profile_model.dart';

class FriendProfileModel extends ProfileModel {
  bool isFriend;
  bool isFollowing;
  int friendsCount;
  int followersCount;
  int followingCount;

  FriendProfileModel({
    required int id,
    required String firstName,
    required String lastName,
    required String mobile,
    String? image,
    String? coverImage,
    String? gender,
    String? dob,
    String? country,
    String? bio,
    required this.isFriend,
    required this.isFollowing,
    required this.followersCount,
    required this.followingCount,
    required this.friendsCount,
    int? level,
  }) : super(
          id: id,
          firstName: firstName,
          lastName: lastName,
          mobile: mobile,
          image: image,
          coverImage: coverImage,
          gender: gender,
          dob: dob,
          country: country,
          bio: bio,
          level: level,
        );

  factory FriendProfileModel.fromJson(Map<String, dynamic> json) {
    return FriendProfileModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      mobile: json['mobile'],
      image: json["image"],
      coverImage: json['cover_image'],
      gender: json['gender'],
      dob: json['dob'],
      country: json['country'],
      bio: json['bio'],
      isFriend: json['is_friend'],
      isFollowing: json['is_following'],
      followersCount: json['followers'],
      followingCount: json['followings'],
      friendsCount: json['friends'],
      level: json['level'],
    );
  }
}
