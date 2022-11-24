// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/repositorys/post_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PostSuggestedTab extends StatefulWidget {
  const PostSuggestedTab({super.key});

  @override
  State<PostSuggestedTab> createState() => _PostSuggestedTabState();
}

class _PostSuggestedTabState extends State<PostSuggestedTab> {
  //Refresh indictor fun
  Future refreshFun() async {
    await PostRepository.instance.getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      builder: (controller) {
        if (controller.allPostList.isEmpty || controller.erroMessage != null) {
          if (controller.allPostList.isEmpty) {
            return Center(child: Text("No Post"));
          } else if (controller.erroMessage != null) {
            return Center(child: Text(controller.erroMessage!));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        } else {
          // postList
          return RefreshIndicator(
              onRefresh: refreshFun,
              child: ListView.separated(
                shrinkWrap: true,
                // reverse: true,
                padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
                itemCount: controller.allPostList.length,
                itemBuilder: (context, index) {
                  return PostCardWidget(
                      cardData: controller.allPostList[index],
                      onAddFriendTab: (friend) {
                        AppUtils.showSnakBar(msg: "friends");
                      },
                      // likeBtn
                      onLikeTab: (like) {
                        PostController.instance
                            .likePost(postId: controller.allPostList[index].id);
                      },
                      //comment btn
                      onCommentTab: () {
                        // AppUtils.showSnakBar(msg: "Comment");
                        Get.bottomSheet(
                            PostCommentCard(
                                postId: controller.allPostList[index].id),
                            isScrollControlled: true);
                      });
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
              ));
        }
      },
    );
  }
}

//posts comments

class PostCommentCard extends StatefulWidget {
  const PostCommentCard({Key? key, required this.postId}) : super(key: key);
  final int postId;

  @override
  State<PostCommentCard> createState() => _PostCommentCardState();
}

class _PostCommentCardState extends State<PostCommentCard> {
  TextEditingController commentMessageController = TextEditingController();
  final ScrollController commentScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      // height: 200,
      width: Get.width,

      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            constraints: BoxConstraints(maxHeight: 300, minHeight: 50),
            child: GetBuilder<PostController>(builder: (postController) {
              // get post data
              PostModel post = postController.allPostList.where((element) {
                if (element.id == widget.postId) {
                  return true;
                } else {
                  return false;
                }
              }).first;

              return ListView.builder(
                itemCount: post.comments.length,
                controller: commentScrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // return Text("data");
                  return commentCard(post.comments[index]);
                },
              );
            }),
          ),
          //Comment area
          Row(
            children: [
              Expanded(
                  child: KTextField2(
                hintText: "Write your comment...",
                textEditingController: commentMessageController,
                maxLines: 2,
                minLines: 1,
              )),
              //send comment
              IconButton(
                  onPressed: () async {
                    // PostController.instance.findPost(widget.postId);
                    if (commentMessageController.text.isEmpty) {
                      AppUtils.showSnakBar(
                          msg: "Enter Your Comment", second: 2);
                    } else {
                      await PostRepository.instance
                          .addPostComment(
                        postId: widget.postId,
                        postMessage: commentMessageController.text,
                      )
                          .then((value) {
                        commentScrollController.jumpTo(
                            commentScrollController.position.maxScrollExtent);
                        commentMessageController.clear();
                      });
                    }
                  },
                  icon: Icon(Icons.send)),
            ],
          )
        ],
      ),
    );
  }

  //Post message card
  Widget commentCard(PostCommentModel postComment) {
    return Container(
      margin: EdgeInsets.all(8),
      // color: AppColor.grey200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 25,
                width: 25,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  gradient: AppColor.backgraundGradientV,
                  borderRadius: BorderRadius.circular(16),
                  image: (postComment.image == null)
                      ? null
                      : DecorationImage(
                          image: CachedNetworkImageProvider(
                              "${ApiImagePath.profile}${postComment.image}"),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(width: 6),
              Text(
                "${postComment.firstName} ${postComment.lastName}",
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            postComment.message,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    commentMessageController.dispose();
    super.dispose();
  }
}

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    super.key,
    required this.cardData,
    required this.onLikeTab,
    required this.onCommentTab,
    required this.onAddFriendTab,
    // required this.postLikeData,
    // required this.postCommentData,
  });
  final PostModel cardData;
  // final List<PostLikeModel> postLikeData;
  // final List<PostCommentModel> postCommentData;
  final Function(bool like) onLikeTab;
  final Function onCommentTab;
  final Function(bool friend) onAddFriendTab;
  @override
  Widget build(BuildContext context) {
    bool islike = false;

    final avtarSize = 40.h;
    return Column(
      children: [
        Container(height: 10),
        Row(
          children: [
            //avtar
            Container(
              height: avtarSize,
              width: avtarSize,
              decoration: BoxDecoration(
                gradient: AppColor.backgraundGradientV,
                borderRadius: BorderRadius.circular(40),
                image: (cardData.userProfile != null)
                    ? DecorationImage(
                        image: CachedNetworkImageProvider(
                            "${ApiImagePath.profile}${cardData.userProfile!}"),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 10),
            //User name
            Expanded(
              child: Text(
                cardData.userName,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 10),
            //Add Btn
            Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                // color: AppColor.closeToPurple,
                gradient: AppColor.backgraundGradient(),
                borderRadius: BorderRadius.circular(40),
              ),
              child: InkWell(
                onTap: () => onAddFriendTab(!cardData.isfriend),
                child: Icon(
                  Icons.add,
                  color: AppColor.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: h10),
        //Comment
        Row(
          children: [
            Expanded(
              child: Text(
                (cardData.messageBody != null) ? cardData.messageBody! : "",
              ),
            ),
          ],
        ),
        SizedBox(height: h10),
        //Post Image
        (cardData.image != null)
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                    imageUrl: "${ApiImagePath.post}${cardData.image!}"),
              )
            : const SizedBox(),
        (cardData.image != null) ? SizedBox(height: h10) : const SizedBox(),

        //Likes and comments
        Row(
          children: [
            // Likes
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => onLikeTab(true),
                  child: Icon(
                    Icons.favorite,
                    color: (cardData.isLiked == false)
                        ? AppColor.black54
                        : Colors.red,
                  ),
                ),
                const SizedBox(width: 10),
                Text(cardData.likeCount.toString())
              ],
            ),
            const SizedBox(width: 20),

            //Comments
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () => onCommentTab(),
                  child: Icon(
                    Icons.message,
                    color: AppColor.black54,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  cardData.comments.length.toString(),
                  overflow: TextOverflow.clip,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
