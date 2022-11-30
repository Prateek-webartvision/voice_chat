import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/pages/friends_profile/friend_profile_page.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({
    super.key,
    required this.cardData,
    required this.onLikeTab,
    required this.onCommentTab,
    required this.onAddFriendTab,
    required this.deletePost,
  });

  final PostModel cardData;
  final Function(bool like) onLikeTab;
  final Function() onCommentTab;
  final Function(bool friend) onAddFriendTab;
  final Function() deletePost;

  @override
  Widget build(BuildContext context) {
    final avtarSize = 40.h;
    return Column(
      children: [
        Container(height: 10),
        Row(
          children: [
            //avtar
            InkWell(
              //Nivigate to friend profile page
              onTap: () => Get.to(() => FriendProfilePage(friendId: cardData.createdBy)),
              child: Container(
                height: avtarSize,
                width: avtarSize,
                decoration: BoxDecoration(
                  gradient: AppColor.backgraundGradientV,
                  borderRadius: BorderRadius.circular(40),
                  image: (cardData.userProfile != null)
                      ? DecorationImage(
                          image: CachedNetworkImageProvider("${ApiImagePath.profile}${cardData.userProfile!}"),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
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
            (cardData.createdBy == UserController.instance.getId)
                ? Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      // color: AppColor.closeToPurple,
                      gradient: AppColor.backgraundGradient(),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: InkWell(
                      onTap: deletePost,
                      child: Icon(
                        Icons.delete_rounded,
                        color: AppColor.white,
                      ),
                    ),
                  )
                : //Add Btn
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
                  ),
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
                child: CachedNetworkImage(imageUrl: "${ApiImagePath.post}${cardData.image!}"),
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
                    color: (cardData.isLiked == false) ? AppColor.black54 : Colors.red,
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
