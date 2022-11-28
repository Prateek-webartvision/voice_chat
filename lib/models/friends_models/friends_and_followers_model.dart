import 'package:voice_chat/models/friends_models/friend_user_model.dart';

class FriendsAndFollowersModel {
  List<FriendUserModel> friends;
  List<FriendUserModel> followers;
  List<FriendUserModel> followings;

  FriendsAndFollowersModel({
    required this.friends,
    required this.followers,
    required this.followings,
  });

  factory FriendsAndFollowersModel.fromJson(Map<String, dynamic> json) {
    // print(json);
    List<FriendUserModel> tempFriends = [];
    if (json['friends'] != null) {
      for (var element in json['friends']) {
        tempFriends.add(
          FriendUserModel(
            id: element['friend_id'],
            firstName: element['first_name'],
            lastName: element['last_name'],
            image: element['image'],
            createdAt: element['createdAt'],
            updatedAt: element['updatedAt'],
          ),
        );
      }
    }
    List<FriendUserModel> tempFollowers = [];
    if (json['followers'] != null) {
      for (var element in json['followers']) {
        tempFriends.add(
          FriendUserModel(
            id: element['friend_id'],
            firstName: element['first_name'],
            lastName: element['last_name'],
            image: element['image'],
            createdAt: element['createdAt'],
            updatedAt: element['updatedAt'],
          ),
        );
      }
    }
    List<FriendUserModel> tempFollowings = [];
    if (json['following'] != null) {
      for (var element in json['following']) {
        tempFriends.add(
          FriendUserModel(
            id: element['friend_id'],
            firstName: element['first_name'],
            lastName: element['last_name'],
            image: element['image'],
            createdAt: element['createdAt'],
            updatedAt: element['updatedAt'],
          ),
        );
      }
    }
    return FriendsAndFollowersModel(friends: tempFriends, followers: tempFollowers, followings: tempFollowings);
  }
}
