import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';

class BgWithAvtar extends StatelessWidget {
  const BgWithAvtar({
    Key? key,
    this.coverImage,
    this.profileImage,
    required this.userName,
    required this.friendsCount,
    required this.followersCount,
    required this.followingsCount,
  }) : super(key: key);

  final String? coverImage;
  final String? profileImage;
  final String userName;
  final int friendsCount;
  final int followersCount;
  final int followingsCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Cover Image
        Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: AppColor.backgraundGradientV,
            image: (coverImage != null)
                ? DecorationImage(
                    image: CachedNetworkImageProvider(
                      coverImage!,
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),

        Column(
          children: [
            const SizedBox(height: 160),
            Container(
              width: double.maxFinite,
              height: 108,
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Stack(
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: [
                  //Avtar
                  Positioned(
                    left: 16,
                    top: -120 * .4,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            gradient: AppColor.backgraundGradientV,
                            image: (profileImage != null)
                                ? DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      profileImage!,
                                    ),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(60),
                          ),
                        ),
                        //
                        const SizedBox(height: 6),
                        Text(
                          userName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row
                  Positioned(
                    left: 156,
                    top: 10,
                    child: Row(
                      children: [
                        //Followed
                        Column(
                          children: [
                            Text(
                              "$followingsCount",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "Following",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        //Followers
                        Column(
                          children: [
                            Text(
                              "$followersCount",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "Followers",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        //Friends
                        Column(
                          children: [
                            Text(
                              "$friendsCount",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              "Friends",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
