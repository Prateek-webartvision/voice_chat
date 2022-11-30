// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_suggested_controller.dart';
import 'package:voice_chat/data/app_enums.dart';
import 'package:voice_chat/repositorys/friend_repo.dart';
import 'package:voice_chat/repositorys/post_repo.dart';
import 'package:voice_chat/res/constant_value.dart';

import 'post_widgets/post_card.dart';
import 'post_widgets/post_comment_bottom_sheet.dart';
import 'post_widgets/try_again_btn.dart';

class PostSuggestedTab extends StatefulWidget {
  const PostSuggestedTab({super.key});

  @override
  State<PostSuggestedTab> createState() => _PostSuggestedTabState();
}

class _PostSuggestedTabState extends State<PostSuggestedTab> {
  @override
  void initState() {
    Get.lazyPut(() => PostSuggestedController());
    refreshFun();
    super.initState();
  }

  //Refresh indictor fun
  Future refreshFun() async {
    await PostRepository.instance.getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostSuggestedController>(
      builder: (controller) {
        if (controller.postEnum == ApiStatusEnum.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.postEnum == ApiStatusEnum.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.erroMessage.toString(),
                ),
                SizedBox(height: 20),
                TryAgainBtn(
                  onTab: () {
                    refreshFun();
                  },
                )
              ],
            ),
          );
        } else {
          //Success
          return RefreshIndicator(
            onRefresh: refreshFun,
            child: ListView.separated(
              // physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              // reverse: true,
              padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
              itemCount: controller.allPostList.length,
              itemBuilder: (context, index) {
                int reversedIndex = controller.allPostList.length - 1 - index;

                return PostCardWidget(
                  cardData: controller.allPostList[reversedIndex],

                  //AddFrinetBtn
                  onAddFriendTab: (friend) {
                    FriendRepository.instance.sendFriendRequest(friendId: controller.allPostList[reversedIndex].createdBy);
                  },
                  // likeBtn
                  onLikeTab: (like) {
                    PostSuggestedController.instance.likePost(postId: controller.allPostList[reversedIndex].id);
                  },
                  //comment btn
                  onCommentTab: () {
                    Get.bottomSheet(PostSuggestedCommentCard(postId: controller.allPostList[reversedIndex].id), isScrollControlled: true);
                  },

                  //Delete Post
                  deletePost: () {
                    PostRepository.instance.removePost(postId: controller.allPostList[reversedIndex].id);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    const Divider(
                      thickness: 2,
                      endIndent: 40,
                    ),
                    SizedBox(
                      height: h10,
                    )
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}

//posts comments

