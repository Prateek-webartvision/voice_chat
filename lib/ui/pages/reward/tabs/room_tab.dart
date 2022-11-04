// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/reward/top_players_reward.dart';

class RoomTab extends StatefulWidget {
  const RoomTab({super.key});

  @override
  State<RoomTab> createState() => _RoomTabState();
}

class _RoomTabState extends State<RoomTab> {
  int currentindex = 0;
  List<String> days = [
    "Daily",
    "Weekly",
    "Monthly",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top playser
        Container(
          height: 250,
          decoration: BoxDecoration(color: AppColor.closeToPurple),
          child: Column(
            children: [
              // days tab
              DaysWeel(
                days: days,
                currentTic: currentindex,
                activeColor: AppColor.white,
                activeTextColor: AppColor.closeToPurple,
                onTab: (sIndex) {
                  setState(() {
                    currentindex = sIndex;
                  });
                },
              ),
              // top 3 players
              Expanded(
                child: Row(
                  children: [
                    //player 3
                    TopPlayerRenk(
                        rank: 3,
                        name: "parshant",
                        iamge:
                            "https://image.shutterstock.com/image-photo/portrait-normal-boy-smiling-over-260nw-135283244.jpg"),
                    //Player 1
                    TopPlayerRenk(
                        rank: 1,
                        name: "Prateek",
                        iamge:
                            "https://image.shutterstock.com/image-photo/portrait-normal-boy-smiling-over-260nw-135283244.jpg"),
                    //player 2
                    TopPlayerRenk(
                        rank: 2,
                        name: "Pradeep",
                        iamge:
                            "https://image.shutterstock.com/image-photo/portrait-normal-boy-smiling-over-260nw-135283244.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
        //All Players
        Flexible(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shrinkWrap: true,
            itemCount: 55 - 4,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(
                    "${index + 4}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "User name",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.diamond,
                        color: AppColor.white,
                      ),
                      SizedBox(width: 6),
                      Text(
                        "154864",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 12.sp),
                      )
                    ],
                  )
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: AppColor.white54,
                thickness: 1.5,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopPlayerRenk extends StatelessWidget {
  const TopPlayerRenk({
    Key? key,
    required this.rank,
    required this.name,
    required this.iamge,
  }) : super(key: key);
  final int rank;
  final String name;
  final String iamge;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 3,
      // color: Colors.white,
      child: Column(
        children: [
          Text(
            "$rank",
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: AppColor.white),
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: CachedNetworkImageProvider(iamge),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "$name",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
