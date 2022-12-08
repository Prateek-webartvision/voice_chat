import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/friend_profile_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/repositorys/friend_profile_repo.dart';
import 'package:voice_chat/repositorys/post_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/friends_profile/friend_profile_comment.page.dart';

class MomentsTabPage extends StatefulWidget {
  const MomentsTabPage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final int userId;

  @override
  State<MomentsTabPage> createState() => _MomentsTabPageState();
}

class _MomentsTabPageState extends State<MomentsTabPage> {
  @override
  void initState() {
    // print(widget.userId);

    FriendProfileRepository.getPostByUserId(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FriendProfileController>(
      builder: (controller) {
        if (controller.friendProfilePostList == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.friendProfilePostList!.isEmpty) {
          return const Center(child: Text("No post"));
        } else {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return postCart(
                      post: controller.friendProfilePostList![index],
                      onLike: (lastValue) {
                        PostRepository.instance.addPostLike(postId: controller.friendProfilePostList![index].id).then((value) {
                          controller.postLike(!lastValue, controller.friendProfilePostList![index].id);
                        });
                      },
                      onComment: () {
                        Get.bottomSheet(FriendProfileCommentCard(postId: controller.friendProfilePostList![index].id), isScrollControlled: true);
                      },
                    );
                  },
                  childCount: controller.friendProfilePostList!.length,
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget postCart({
    required FriendProfilePostModel post,
    required Function(bool lastValue) onLike,
    required Function() onComment,
  }) {
    return Container(
      color: AppColor.grey200,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.body ?? ""),
          const SizedBox(height: 8),
          //? check post image is null or not
          (post.postImage != null)
              ? Image.network(
                  "${ApiImagePath.post}${post.postImage}",
                  fit: BoxFit.fitHeight,
                )
              : const SizedBox(),
          (post.postImage != null) ? const SizedBox(height: 8) : const SizedBox(),
          Row(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () => onLike(post.isLiked),
                    child: Icon(Icons.favorite, color: (post.isLiked == true) ? Colors.red : AppColor.black54),
                  ),
                  const SizedBox(width: 6),
                  Text(post.likesCount.toString()),
                ],
              ),
              const SizedBox(width: 6),
              Row(
                children: [
                  InkWell(onTap: () => onComment(), child: const Icon(Icons.message)),
                  const SizedBox(width: 6),
                  Text(post.commentCount.toString()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
