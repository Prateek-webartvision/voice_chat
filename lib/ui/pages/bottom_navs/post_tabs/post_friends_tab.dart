import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/post_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/models/post_model.dart';
import 'package:voice_chat/repositorys/friend_repo.dart';
import 'package:voice_chat/repositorys/post_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/utils/app_utils.dart';

class PostFriendsTab extends StatefulWidget {
  const PostFriendsTab({super.key});

  @override
  State<PostFriendsTab> createState() => _PostFriendsTabState();
}

class _PostFriendsTabState extends State<PostFriendsTab> {
  Future refreshFun() async {
    await PostRepository.instance.getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("No data"));
    // return GetBuilder<PostController>(
    //   builder: (controller) {
    //     if (controller.allPostList.isEmpty || controller.erroMessage != null) {
    //       if (controller.allPostList.isEmpty) {
    //         return Center(child: Text("No Post"));
    //       } else if (controller.erroMessage != null) {
    //         return Center(child: Text(controller.erroMessage!));
    //       } else {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     } else {
    //       // postList
    //       return RefreshIndicator(
    //           onRefresh: refreshFun,
    //           child: ListView.separated(
    //             shrinkWrap: true,
    //             reverse: true,
    //             padding: EdgeInsets.only(bottom: 20, left: 16, right: 16),
    //             itemCount: controller.allPostList.length,
    //             itemBuilder: (context, index) {
    //               return PostCardWidget(
    //                 cardData: controller.allPostList[index],
    //                 onAddFriendTab: (friend) {
    //                   // AppUtils.showSnakBar(msg: "friends");
    //                   FriendRepository.instance.sendFriendRequest(
    //                     friendId: controller.allPostList[index].createdBy,
    //                   );
    //                 },
    //                 // likeBtn
    //                 onLikeTab: (like) {
    //                   PostController.instance.likePost(postId: controller.allPostList[index].id);
    //                 },
    //                 //comment btn
    //                 onCommentTab: () {
    //                   Get.bottomSheet(PostCommentCard(postId: controller.allPostList[index].id), isScrollControlled: true);
    //                 },

    //                 //Delete Post
    //                 deletePost: () {
    //                   PostRepository.instance.removePost(postId: controller.allPostList[index].id);
    //                 },
    //               );
    //             },
    //             separatorBuilder: (BuildContext context, int index) {
    //               return Column(
    //                 children: [
    //                   const Divider(
    //                     thickness: 2,
    //                     endIndent: 40,
    //                   ),
    //                   SizedBox(
    //                     height: h10,
    //                   )
    //                 ],
    //               );
    //             },
    //           ));
    //     }
    //   },
    // );
  }
}

//posts comments

// class PostCommentCard extends StatefulWidget {
//   const PostCommentCard({Key? key, required this.postId}) : super(key: key);
//   final int postId;

//   @override
//   State<PostCommentCard> createState() => _PostCommentCardState();
// }

// class _PostCommentCardState extends State<PostCommentCard> {
//   TextEditingController commentMessageController = TextEditingController();
//   final ScrollController commentScrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColor.white,
//       // height: 200,
//       width: Get.width,

//       padding: EdgeInsets.all(8),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             constraints: BoxConstraints(
//               maxHeight: 300,
//             ),
//             child: GetBuilder<PostController>(builder: (postController) {
//               // get post data
//               PostModel post = postController.allPostList.where((element) {
//                 if (element.id == widget.postId) {
//                   return true;
//                 } else {
//                   return false;
//                 }
//               }).first;

//               return ListView.builder(
//                 itemCount: post.comments.length,
//                 controller: commentScrollController,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   // return Text("data");
//                   return commentCard(
//                     postComment: post.comments[index],
//                     postPostedById: post.createdBy,
//                     // Delete Comment
//                     onDelete: (String commentId) {
//                       PostRepository.instance.removeComment(commentId: commentId, postId: post.id);
//                     },
//                   );
//                 },
//               );
//             }),
//           ),

//           //Comment area
//           Row(
//             children: [
//               Expanded(
//                 child: KTextField2(
//                   hintText: "Write your comment...",
//                   textEditingController: commentMessageController,
//                   maxLines: 2,
//                   minLines: 1,
//                 ),
//               ),
//               //send comment
//               IconButton(
//                   onPressed: () async {
//                     // PostController.instance.findPost(widget.postId);
//                     if (commentMessageController.text.isEmpty) {
//                       AppUtils.showSnakBar(msg: "Enter Your Comment", second: 2);
//                     } else {
//                       await PostRepository.instance
//                           .addPostComment(
//                         postId: widget.postId,
//                         postMessage: commentMessageController.text,
//                       )
//                           .then((value) {
//                         commentScrollController.jumpTo(commentScrollController.position.maxScrollExtent);
//                         commentMessageController.clear();
//                       });
//                     }
//                   },
//                   icon: Icon(Icons.send)),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   //Post comment  card
//   Widget commentCard({
//     required PostCommentModel postComment,
//     required int postPostedById,
//     required Function(String commentId) onDelete,
//   }) {
//     return Container(
//       margin: EdgeInsets.all(8),
//       // color: AppColor.grey200,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 height: 25,
//                 width: 25,
//                 clipBehavior: Clip.hardEdge,
//                 decoration: BoxDecoration(
//                   gradient: AppColor.backgraundGradientV,
//                   borderRadius: BorderRadius.circular(16),
//                   image: (postComment.image == null)
//                       ? null
//                       : DecorationImage(
//                           image: CachedNetworkImageProvider("${ApiImagePath.profile}${postComment.image}"),
//                           fit: BoxFit.cover,
//                         ),
//                 ),
//               ),
//               SizedBox(width: 6),
//               //Name
//               Expanded(
//                 child: Text(
//                   "${postComment.firstName} ${postComment.lastName}",
//                   style: TextStyle(
//                     color: AppColor.black,
//                     fontSize: 12,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   overflow: TextOverflow.clip,
//                 ),
//               ),
//               (postComment.userid == UserController.instance.getId) ? SizedBox(width: 6) : SizedBox(),
//               SizedBox(width: 6),
//               //Delete btn
//               //check if post owner delete all commnet
//               (postPostedById == UserController.instance.getId || postComment.userid == UserController.instance.getId)
//                   ? IconButton(
//                       onPressed: () => onDelete(postComment.commentId!),
//                       icon: Icon(
//                         Icons.delete_rounded,
//                         size: 20,
//                       ))
//                   : SizedBox(),
//             ],
//           ),
//           SizedBox(height: 10),
//           Text(
//             postComment.message,
//             style: TextStyle(
//               color: AppColor.black,
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     commentMessageController.dispose();
//     super.dispose();
//   }
// }

// class PostCardWidget extends StatelessWidget {
//   const PostCardWidget({
//     super.key,
//     required this.cardData,
//     required this.onLikeTab,
//     required this.onCommentTab,
//     required this.onAddFriendTab,
//     required this.deletePost,
//   });
//   final PostModel cardData;
//   final Function(bool like) onLikeTab;
//   final Function onCommentTab;
//   final Function(bool friend) onAddFriendTab;
//   final Function() deletePost;
//   @override
//   Widget build(BuildContext context) {
//     final avtarSize = 40.h;
//     return Column(
//       children: [
//         Container(height: 10),
//         Row(
//           children: [
//             //avtar
//             Container(
//               height: avtarSize,
//               width: avtarSize,
//               decoration: BoxDecoration(
//                 gradient: AppColor.backgraundGradientV,
//                 borderRadius: BorderRadius.circular(40),
//                 image: (cardData.userProfile != null)
//                     ? DecorationImage(
//                         image: CachedNetworkImageProvider("${ApiImagePath.profile}${cardData.userProfile!}"),
//                         fit: BoxFit.cover,
//                       )
//                     : null,
//               ),
//             ),
//             const SizedBox(width: 10),
//             //User name
//             Expanded(
//               child: Text(
//                 cardData.userName,
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             const SizedBox(width: 10),

//             //delete Btn
//             // Text(cardData.createdBy.toString()),
//             // (cardData.createdBy == UserController.instance.getId)
//             //     ? const SizedBox(width: 10)
//             // : SizedBox(),
//             (cardData.createdBy == UserController.instance.getId)
//                 ? Container(
//                     height: 30,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       // color: AppColor.closeToPurple,
//                       gradient: AppColor.backgraundGradient(),
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     child: InkWell(
//                       onTap: deletePost,
//                       child: Icon(
//                         Icons.delete_rounded,
//                         color: AppColor.white,
//                       ),
//                     ),
//                   )
//                 : //Add Btn
//                 Container(
//                     height: 30,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       // color: AppColor.closeToPurple,
//                       gradient: AppColor.backgraundGradient(),
//                       borderRadius: BorderRadius.circular(40),
//                     ),
//                     child: InkWell(
//                       onTap: () => onAddFriendTab(!cardData.isfriend),
//                       child: Icon(
//                         Icons.add,
//                         color: AppColor.white,
//                       ),
//                     ),
//                   ),
//           ],
//         ),
//         SizedBox(height: h10),
//         //Comment
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 (cardData.messageBody != null) ? cardData.messageBody! : "",
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: h10),
//         //Post Image
//         (cardData.image != null)
//             ? ClipRRect(
//                 borderRadius: BorderRadius.circular(16),
//                 child: CachedNetworkImage(imageUrl: "${ApiImagePath.post}${cardData.image!}"),
//               )
//             : const SizedBox(),
//         (cardData.image != null) ? SizedBox(height: h10) : const SizedBox(),

//         //Likes and comments
//         Row(
//           children: [
//             // Likes
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 InkWell(
//                   onTap: () => onLikeTab(true),
//                   child: Icon(
//                     Icons.favorite,
//                     color: (cardData.isLiked == false) ? AppColor.black54 : Colors.red,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Text(cardData.likeCount.toString())
//               ],
//             ),
//             const SizedBox(width: 20),

//             //Comments
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 InkWell(
//                   onTap: () => onCommentTab(),
//                   child: Icon(
//                     Icons.message,
//                     color: AppColor.black54,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Text(
//                   cardData.comments.length.toString(),
//                   overflow: TextOverflow.clip,
//                 )
//               ],
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
