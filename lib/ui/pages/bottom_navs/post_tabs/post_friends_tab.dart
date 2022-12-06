import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_friends_controller.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/repositorys/friend_repo.dart';
import 'package:voice_chat/repositorys/post_repo.dart';
import 'package:voice_chat/ui/pages/bottom_navs/post_tabs/post_widgets/pos_comment_bottom_sheet_f.dart';

import 'post_widgets/post_card.dart';
import 'post_widgets/try_again_btn.dart';

class PostFriendsTab extends StatefulWidget {
  const PostFriendsTab({super.key});

  @override
  State<PostFriendsTab> createState() => _PostFriendsTabState();
}

class _PostFriendsTabState extends State<PostFriendsTab> {
  @override
  void initState() {
    Get.lazyPut(() => PostFriendsController());
    refreshFun();
    super.initState();
  }

  Future refreshFun() async {
    await PostRepository.instance.grtAllFriendsPost();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostFriendsController>(builder: (controller) {
      if (controller.postEnum == ApiStatusEnum.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (controller.postEnum == ApiStatusEnum.error) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                controller.erroMessage.toString(),
              ),
              const SizedBox(height: 20),
              TryAgainBtn(
                onTab: () {
                  refreshFun();
                },
              )
            ],
          ),
        );
      } else {
        return RefreshIndicator(
            onRefresh: refreshFun,
            child: ListView.separated(
              // physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              // reverse: true,
              padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
              itemCount: controller.allFriendsPostList.length,
              itemBuilder: (context, index) {
                int reversedIndex = controller.allFriendsPostList.length - 1 - index;

                return PostCardWidget(
                  cardData: controller.allFriendsPostList[reversedIndex],
                  onAddFriendTab: (friend) {
                    // AppUtils.showSnakBar(msg: "friends");
                    FriendRepository.instance.sendFriendRequest(
                      friendId: controller.allFriendsPostList[reversedIndex].createdBy,
                    );
                  },
                  // likeBtn
                  onLikeTab: (like) {
                    controller.likePost(postId: controller.allFriendsPostList[reversedIndex].id);
                  },
                  //comment btn
                  onCommentTab: () {
                    Get.bottomSheet(PostFriendsCommentCard(postId: controller.allFriendsPostList[reversedIndex].id), isScrollControlled: true);
                  },

                  //Delete Post
                  deletePost: () {
                    PostRepository.instance.removePost(postId: controller.allFriendsPostList[reversedIndex].id);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Column(
                  children: const [
                    Divider(
                      thickness: 2,
                      endIndent: 40,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                );
              },
            ));
      }
    });
  }
}
