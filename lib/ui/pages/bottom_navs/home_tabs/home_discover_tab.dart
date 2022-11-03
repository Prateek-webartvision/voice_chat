import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/models/countrys_flag_imoji_model.dart';
import 'package:voice_chat/models/room_model.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/rooms/room_page.dart';
import 'package:voice_chat/ui/widgets/main_title_with_widget.dart';

class HomeDiscoverTab extends StatelessWidget {
  const HomeDiscoverTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(height: 20.h),
            MainTitleWithWidget(
              title: "Most Popular Countries",
              onTab: () {
                print("object");
              },
              child: const CountryGridView(),
            ),
            const SizedBox(height: 20),
            MainTitleWithWidget(
              title: "New Rooms",
              onTab: () {
                print("new Rooms");
              },
              child: const Rooms(),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}

class Rooms extends StatelessWidget {
  const Rooms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: rooms.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              Get.to(RoomPage(room: rooms[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(rooms[index].roomThum),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    AppColor.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              rooms[index].userProfile),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        rooms[index].userName,
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CountryGridView extends StatelessWidget {
  const CountryGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: GridView.builder(
        itemCount: countrysFlagEmojiList.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    countrysFlagEmojiList[index].emoji,
                    style: TextStyle(fontSize: 26.sp),
                  ),
                  Text(
                    countrysFlagEmojiList[index].name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
