import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/friend_profile_controller.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/repositorys/friend_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/signle_chats/single_chat_page.dart';

class FriendsProfileBottomBtns extends StatelessWidget {
  const FriendsProfileBottomBtns({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FriendProfileController>(builder: (friendData) {
      return (friendData.apiStatus != ApiStatusEnum.success)
          ? const SizedBox()
          : Container(
              width: Get.width,
              height: 60,
              // color: AppColor.grey400,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // add friend or chat
                  Container(
                    width: 135,
                    height: 40,
                    decoration: BoxDecoration(gradient: AppColor.backgraundGradientV, borderRadius: BorderRadius.circular(40)),
                    child: InkWell(
                      onTap: () {
                        if (friendData.friendProfile!.isFriend != true) {
                          FriendRepository.instance.sendFriendRequest(friendId: friendData.friendProfile!.id!);
                          // friendData.changeIsFriend(!friendData.friendProfile!.isFriend);
                        } else {
                          //TODO Chat page rout
                          Get.to(() => SigleChatPage(
                                friendId: friendData.friendProfile!.id!,
                                fillName: "${friendData.friendProfile!.firstName} ${friendData.friendProfile!.lastName}",
                                profileUrl: friendData.friendProfile!.image,
                              ));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon((friendData.friendProfile!.isFriend == true) ? Icons.chat : Icons.add_circle_outline_sharp, color: AppColor.white),
                          const SizedBox(width: 8),
                          Text(
                            (friendData.friendProfile!.isFriend == true) ? "chat" : "Add Friend",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // follow and unfollow
                  Container(
                    width: 135,
                    height: 40,
                    decoration: BoxDecoration(gradient: AppColor.backgraundGradientV, borderRadius: BorderRadius.circular(40)),
                    child: InkWell(
                      onTap: () async {
                        if (friendData.friendProfile!.isFollowing != true) {
                          await FriendRepository.instance.followFriend(friendId: friendData.friendProfile!.id!).then((v) {
                            if (v != null) {
                              friendData.changeIsFollowing(!friendData.friendProfile!.isFollowing);
                            }
                          });
                        } else {
                          await FriendRepository.instance.unfollow(friendData.friendProfile!.id!).then((v) {
                            if (v != null) {
                              friendData.changeIsFollowing(!friendData.friendProfile!.isFollowing);
                            }
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.favorite, color: AppColor.white),
                          const SizedBox(width: 8),
                          Text(
                            (friendData.friendProfile!.isFollowing == true) ? "UnFollow" : "Follow",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
