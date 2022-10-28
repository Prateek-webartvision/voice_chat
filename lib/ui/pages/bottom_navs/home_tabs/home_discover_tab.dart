import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/models/countrys_flag_imoji_model.dart';
import 'package:voice_chat/res/app_color.dart';
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
      itemCount: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: Clip.hardEdge,
          child: Container(
            // height: 180,
            // width: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const CachedNetworkImageProvider(
                    "https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/117935323/original/ff84d06b328e419ee1d23bb05f0350c330a2c75e/create-a-unique-and-professional-youtube-gaming-thumbnail.png"),
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
                      color: Colors.green,
                      image: const DecorationImage(
                        image: CachedNetworkImageProvider(
                            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Name",
                      style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
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
