import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_controller.dart';
import 'package:voice_chat/models/post_suggested_model.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PostSuggestedTab extends StatefulWidget {
  const PostSuggestedTab({super.key});

  @override
  State<PostSuggestedTab> createState() => _PostSuggestedTabState();
}

class _PostSuggestedTabState extends State<PostSuggestedTab> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          // postList
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.allPostList.length,
                  itemBuilder: (context, index) {
                    return PostCardWidget(
                      cardData: controller.allPostList[index],
                      onAddFriendTab: (friend) {
                        AppUtils.showSnakBar(msg: "friends");
                      },
                      onLikeTab: (like) {
                        AppUtils.showSnakBar(msg: "Like");
                        setState(() {
                          controller.allPostList[index].isLiked = like;
                        });
                      },
                      onCommentTab: () {
                        AppUtils.showSnakBar(msg: "Comment");
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

                //Space Sized
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    super.key,
    required this.cardData,
    required this.onLikeTab,
    required this.onCommentTab,
    required this.onAddFriendTab,
  });
  final PostSeggestedModel cardData;
  final Function(bool like) onLikeTab;
  final Function onCommentTab;
  final Function(bool friend) onAddFriendTab;
  @override
  Widget build(BuildContext context) {
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
                        image:
                            CachedNetworkImageProvider(cardData.userProfile!),
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
                (cardData.comment != null) ? cardData.comment! : "",
              ),
            ),
          ],
        ),
        SizedBox(height: h10),
        //Post Image
        (cardData.image != null)
            ? ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(imageUrl: cardData.image!))
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
                  onTap: () => onLikeTab(!cardData.isLiked),
                  child: Icon(
                    Icons.favorite,
                    color: (cardData.isLiked == false)
                        ? AppColor.black54
                        : Colors.red,
                  ),
                ),
                const SizedBox(width: 10),
                Text(cardData.likes.toString())
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
                Text(cardData.comments.toString())
              ],
            )
          ],
        ),
      ],
    );
  }
}
