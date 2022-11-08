// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey200,
      appBar: AppBar(
        backgroundColor: AppColor.grey200,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.black),
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          children: [
            // image avtar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Sysmbol picture",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColor.black54),
                ),
                InkWell(
                  onTap: () {
                    print("Get Image");
                  },
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: 50,
                        maxWidth: 50,
                        minHeight: 50,
                        minWidth: 50),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg"),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              AppColor.black.withOpacity(0.2),
                              BlendMode.darken)),
                    ),
                    child:
                        Icon(Icons.camera_alt_outlined, color: AppColor.white),
                  ),
                ),
              ],
            ),
            Divider(thickness: 2),
            //Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("User name");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "User Name",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black54,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.black54,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            //Dob
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date of Birth",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("Date of Birth");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "1998-04-12",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black54,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.black54,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            //Gender
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("gender");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "male",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black54,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.black54,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            //Country
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Country",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("country");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "India",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColor.black54,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColor.black54,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
          ],
        ),
      )),
    );
  }
}
