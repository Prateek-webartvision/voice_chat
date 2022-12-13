// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/room_message_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/res/app_color.dart';

class RoomAppBar extends StatelessWidget {
  const RoomAppBar({super.key, this.userImage, required this.name, required this.roomName});
  final String? userImage;
  final String name;
  final String roomName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 112,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* usner image and name room name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //*Avtar
                  Row(
                    children: [
                      //*image
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          gradient: AppColor.backgraundGradientV,
                          image: (userImage != null)
                              ? DecorationImage(
                                  image: CachedNetworkImageProvider("${ApiImagePath.profile}$userImage"),
                                  fit: BoxFit.cover,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      SizedBox(width: 10),
                      //name number
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            roomName,
                            style: TextStyle(color: AppColor.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 2),
                          Text(
                            name,
                            style: TextStyle(
                              color: AppColor.white54,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),

                  //*Troffis
                  Row(
                    children: [
                      Icon(
                        Icons.wine_bar_outlined,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "1254",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              //* connected user list
              GetBuilder<RoomMessageController>(builder: (controller) {
                print(controller.allConnectedUsers.length);
                return Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: (controller.allConnectedUsers.length > 3) ? 3 : controller.allConnectedUsers.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            constraints: BoxConstraints(maxHeight: 30, maxWidth: 30),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(15),
                              image: (controller.allConnectedUsers[index].profileImage != null)
                                  ? DecorationImage(
                                      image: CachedNetworkImageProvider('${ApiImagePath.profile}${controller.allConnectedUsers[index].profileImage}'),
                                      fit: BoxFit.cover,
                                    )
                                  : null,
                            ),
                            // child: CircleAvatar(
                            //   radius: 12,
                            //   backgroundColor: AppColor.white,
                            //   // foregroundImage: (userImage != null)
                            //   //     ? CachedNetworkImageProvider(userImage!)
                            //   //     : null,
                            // ),
                          ),
                        );
                      },
                    ),
                    Visibility(visible: ((controller.allConnectedUsers.length - 3) > 0), child: SizedBox(width: 8)),
                    Visibility(
                      visible: ((controller.allConnectedUsers.length - 3) > 0),
                      child: Text(
                        "${controller.allConnectedUsers.length - 3}",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    )
                  ],
                );
                // return Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Wrap(
                //       // runSpacing: 10,
                //       spacing: 8,
                //       children: [
                //         CircleAvatar(
                //           radius: 12,
                //           backgroundColor: AppColor.white,
                //           // foregroundImage: (userImage != null)
                //           //     ? CachedNetworkImageProvider(userImage!)
                //           //     : null,
                //         ),
                //         CircleAvatar(
                //           radius: 12,
                //           backgroundColor: AppColor.white,
                //           // foregroundImage: (userImage != null)
                //           //     ? CachedNetworkImageProvider(userImage!)
                //           //     : null,
                //         ),
                //         CircleAvatar(
                //           radius: 12,
                //           backgroundColor: AppColor.white,
                //           // foregroundImage: (userImage != null)
                //           //     ? CachedNetworkImageProvider(userImage!)
                //           //     : null,
                //         ),
                //       ],
                //     ),
                //     SizedBox(width: 8),
                //     Text(
                //       "5",
                //       style: TextStyle(
                //         color: AppColor.white,
                //         fontSize: 10.sp,
                //       ),
                //     )
                //   ],
                // );
              })
            ],
          ),
        ),
      ),
    );
  }
}
