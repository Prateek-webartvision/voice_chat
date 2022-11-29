import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_suggested_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/repositorys/post_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PostSuggestedCommentCard extends StatefulWidget {
  const PostSuggestedCommentCard({Key? key, required this.postId}) : super(key: key);
  final int postId;

  @override
  State<PostSuggestedCommentCard> createState() => _PostSuggestedCommentCardState();
}

class _PostSuggestedCommentCardState extends State<PostSuggestedCommentCard> {
  TextEditingController commentMessageController = TextEditingController();
  final ScrollController commentScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      width: Get.width,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            constraints: const BoxConstraints(
              maxHeight: 300,
            ),
            child: GetBuilder<PostSuggestedController>(builder: (postController) {
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
                  return commentCard(
                    postComment: post.comments[index],
                    postPostedById: post.createdBy,
                    // Delete Comment
                    onDelete: (String commentId) {
                      PostRepository.instance.removeComment(commentId: commentId, postId: post.id);
                    },
                  );
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
                ),
              ),
              //send comment
              IconButton(
                  onPressed: () async {
                    // PostController.instance.findPost(widget.postId);
                    if (commentMessageController.text.isEmpty) {
                      AppUtils.showSnakBar(msg: "Enter Your Comment", second: 2);
                    } else {
                      await PostRepository.instance
                          .addPostComment(
                        postId: widget.postId,
                        postMessage: commentMessageController.text,
                      )
                          .then((value) {
                        commentScrollController.jumpTo(commentScrollController.position.maxScrollExtent);
                        commentMessageController.clear();
                      });
                    }
                  },
                  icon: const Icon(Icons.send)),
            ],
          )
        ],
      ),
    );
  }

  //Post comment  card
  Widget commentCard({
    required PostCommentModel postComment,
    required int postPostedById,
    required Function(String commentId) onDelete,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
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
                          image: CachedNetworkImageProvider("${ApiImagePath.profile}${postComment.image}"),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(width: 6),
              //Name
              Expanded(
                child: Text(
                  "${postComment.firstName} ${postComment.lastName}",
                  style: TextStyle(
                    color: AppColor.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),
              (postComment.userid == UserController.instance.getId) ? const SizedBox(width: 6) : const SizedBox(),
              const SizedBox(width: 6),
              //Delete btn
              //check if post owner delete all commnet
              (postPostedById == UserController.instance.getId || postComment.userid == UserController.instance.getId)
                  ? IconButton(
                      onPressed: () => onDelete(postComment.commentId!),
                      icon: const Icon(
                        Icons.delete_rounded,
                        size: 20,
                      ))
                  : const SizedBox(),
            ],
          ),
          const SizedBox(height: 10),
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
