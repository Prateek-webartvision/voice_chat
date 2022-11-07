// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/models/room_model.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/backgraund_widget.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key, required this.room});
  final RoomModel room;

  @override
  Widget build(BuildContext context) {
    return AuthBackgraundWidget(
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        body: Column(
          children: [
            //CustumAppBar
            RoomAppBar(name: room.userName, userImage: room.userProfile),
            //Room header
            RoomHeaderUsers(testImage: room.userProfile),
            //Chat List
            Flexible(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Text("this is your message $index");
                },
              ),
            ),

            //chat text
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Gift
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      gradient: AppColor.backgraundGradientV,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("Gift");
                      },
                      child: Icon(
                        Icons.card_giftcard,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("favorite");
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("favorite");
                      },
                      child: Icon(
                        Icons.gamepad_rounded,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("favorite");
                      },
                      child: Icon(
                        Icons.chat_outlined,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("favorite");
                      },
                      child: Icon(
                        Icons.mic,
                        color: AppColor.white,
                      ),
                    ),
                  ),

                  Container(
                    height: 35,
                    // width: 35,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // gradient: AppColor.backgraundGradientV,
                      color: AppColor.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        print("Message");
                      },
                      child: Text("Write a message...      "),
                    ),
                  ),
                ],
              ),
            ),
            // Center(child: Text(room.userName)),
          ],
        ),
      ),
    );
  }
}

class RoomHeaderUsers extends StatelessWidget {
  const RoomHeaderUsers({
    Key? key,
    required this.testImage,
  }) : super(key: key);
  final String testImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.green,
        image: DecorationImage(
            image: CachedNetworkImageProvider(
                "https://www.texassampling.com/wp-content/uploads/2014/04/bokeh-cover-bg.jpg"),
            fit: BoxFit.cover),
      ),
      child: GridView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / .78,
        ),
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColor.white,
                    width: 1.5,
                  ),
                  image: (index == 9)
                      ? DecorationImage(
                          image: CachedNetworkImageProvider(testImage),
                          fit: BoxFit.cover)
                      : null,
                ),
                child: (index == 9)
                    ? Container()
                    : Icon(
                        Icons.mic_none_rounded,
                        color: AppColor.white,
                      ),
              ),
              SizedBox(height: 6),
              Text(
                (index == 9) ? "user name" : "${index + 1}",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class RoomAppBar extends StatelessWidget {
  const RoomAppBar({super.key, required this.userImage, required this.name});
  final String userImage;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //user side
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Avtar
                  Row(
                    children: [
                      //image
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(userImage),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      SizedBox(width: 10),
                      //name number
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "154955634",
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

                  //Troffi
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
              )
              // viewers side
              ,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Wrap(
                    // runSpacing: 10,
                    spacing: 8,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.white,
                        foregroundImage: CachedNetworkImageProvider(userImage),
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.white,
                        foregroundImage: CachedNetworkImageProvider(userImage),
                      ),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColor.white,
                        foregroundImage: CachedNetworkImageProvider(userImage),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Text(
                    "5",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}