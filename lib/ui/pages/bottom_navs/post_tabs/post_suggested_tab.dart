import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
              itemCount: allPostList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(40),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    allPostList[index].userProfile),
                                fit: BoxFit.cover,
                              )),
                        ),
                        const SizedBox(width: 10),
                        //User name
                        Expanded(
                          child: Text(allPostList[index].userName),
                        ),
                        const SizedBox(width: 10),
                        //Add Btn
                        Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColor.closeToRed,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: InkWell(
                            onTap: () {
                              AppUtils.showSnakBar("Friend added");
                            },
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
                            (allPostList[index].comment != null)
                                ? allPostList[index].comment!
                                : "",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: h10),
                    //Post Image
                    (allPostList[index].image != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                                imageUrl: allPostList[index].image!))
                        : const SizedBox(),
                    (allPostList[index].image != null)
                        ? SizedBox(height: h10)
                        : const SizedBox(),

                    //Likes and comments
                    Row(
                      children: [
                        // Likes
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                AppUtils.showSnakBar("Like");
                                setState(() {
                                  allPostList[index].isLiked =
                                      !allPostList[index].isLiked;
                                });
                              },
                              child: Icon(
                                Icons.favorite,
                                color: (allPostList[index].isLiked == false)
                                    ? AppColor.black54
                                    : AppColor.closeToRed,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(allPostList[index].likes.toString())
                          ],
                        ),
                        const SizedBox(width: 20),

                        //Comments
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.message,
                              color: AppColor.black54,
                            ),
                            const SizedBox(width: 10),
                            Text(allPostList[index].comments.toString())
                          ],
                        )
                      ],
                    ),
                  ],
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
  }
}
