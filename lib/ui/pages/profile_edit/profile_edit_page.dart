// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/data/app_urls.dart';
import 'package:voice_chat/repositorys/profile_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/utils/app_utils.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController bioTextController = TextEditingController();
  List gender = ['male', 'female', 'other'];
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  @override
  void initState() {
    ProfileRepository.instance.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (userProfile) {
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
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.black54),
                      ),
                      InkWell(
                        onTap: () {
                          // print("Get Image");
                          //get and change image
                          AppUtils.imagePickerDailog(
                            seletedImage: (image) {
                              // print("object $image");
                              AppUtils.closeDailog();
                              // Get.dialog(Center(
                              //   child: Image.file(File(image)),
                              // ));
                              ProfileRepository.instance.postApiWithMultiPartProfile(image: File(image), isProfile: true);
                            },
                          );
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: 50,
                            maxWidth: 50,
                            minHeight: 50,
                            minWidth: 50,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            gradient: AppColor.backgraundGradientV,
                            borderRadius: BorderRadius.circular(25),
                            image: (userProfile.getImage != null)
                                ? DecorationImage(
                                    //Come here user profile pic
                                    image: CachedNetworkImageProvider("${ApiImagePath.profile}${UserController.instance.getImage}"),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(AppColor.black.withOpacity(0.2), BlendMode.darken),
                                  )
                                : null,
                          ),
                          child: Icon(Icons.camera_alt_outlined, color: AppColor.white),
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 2),
                  // image Cover
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Cover picture",
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.black54),
                      ),
                      InkWell(
                        onTap: () {
                          // print("Get Image");
                          //get and change image
                          AppUtils.imagePickerDailog(
                            seletedImage: (image) {
                              // print("object $image");
                              AppUtils.closeDailog();
                              // Get.dialog(Center(
                              //   child: Image.file(File(image)),
                              // ));
                              ProfileRepository.instance.postApiWithMultiPartProfile(image: File(image), isProfile: false);
                            },
                          );
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: 50,
                            maxWidth: 50,
                            minHeight: 50,
                            minWidth: 50,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            gradient: AppColor.backgraundGradientV,
                            borderRadius: BorderRadius.circular(25),
                            image: (userProfile.getImage != null)
                                ? DecorationImage(
                                    //Come here user profile pic
                                    image: CachedNetworkImageProvider("${ApiImagePath.cover}${UserController.instance.getCoverImage}"),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(AppColor.black.withOpacity(0.2), BlendMode.darken),
                                  )
                                : null,
                          ),
                          child: Icon(Icons.camera_alt_outlined, color: AppColor.white),
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
                        Text("Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColor.black,
                            )),
                        InkWell(
                          onTap: () {
                            //Bottom sheet
                            Get.bottomSheet(Container(
                              // height: 100,
                              color: AppColor.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: h20),
                                  Text(
                                    "Edit Name",
                                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black),
                                  ),
                                  SizedBox(height: h20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: KTextField2(
                                            textEditingController: firstName,
                                            hintText: "First Name",
                                            textInputAction: TextInputAction.next,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Flexible(
                                          child: KTextField2(
                                            textEditingController: lastName,
                                            hintText: "Last Name",
                                            textInputAction: TextInputAction.done,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: h20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyGradientBtn(
                                        onPress: () {
                                          if (firstName.text.isEmpty || lastName.text.isEmpty) {
                                            AppUtils.showSnakBar(msg: "Enter Full Name");
                                          } else {
                                            if (Get.isBottomSheetOpen == true) {
                                              Get.back();
                                            }
                                            ProfileRepository.instance.updateProfile(
                                              firstName: firstName.text,
                                              lastName: lastName.text,
                                            );

                                            firstName.clear();
                                            lastName.clear();
                                          }
                                        },
                                        text: "Save"),
                                  )
                                ],
                              ),
                            ));
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                // "${controller.profileData!.firstName} ${controller.profileData!.lastName}",
                                "${userProfile.getFirstName} ${userProfile.getLastName} ",
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
                          onTap: () async {
                            //TODO DateTime Picker and api
                            print("Date of Birth");
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(3000),
                            ).then((date) {
                              ProfileRepository.instance.updateProfile(dob: date.toString());
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                //Error Check
                                (userProfile.getDob.toString().isEmpty || userProfile.getDob == null) ? "NA" : dateFormat.format(DateTime.parse(userProfile.getDob)).toString(),
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
                        PopupMenuButton(
                          itemBuilder: (context) {
                            return gender
                                .map((e) => PopupMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList();
                          },
                          onSelected: (value) {
                            ProfileRepository.instance.updateProfile(gender: value.toString());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                userProfile.getGender ?? "NA",
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
                            showCountryPicker(
                              context: context,
                              onSelect: (value) {
                                ProfileRepository.instance.updateProfile(country: value.name);
                                Get.back();
                                // print(value.name);
                                // AppUtils.showSnakBar(msg: value.toString());
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                userProfile.getCountry ?? "NA",
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

                  // Bio
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your bio",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                userProfile.getBio ?? "NA",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            print("bio");
                            Get.bottomSheet(Container(
                              // height: 100,
                              color: AppColor.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: h20),
                                  Text(
                                    "Edit Bio",
                                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColor.black),
                                  ),
                                  // SizedBox(height: h20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: KTextField2(
                                            textEditingController: bioTextController,
                                            hintText: "All about you",
                                            textInputAction: TextInputAction.done,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: h20),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyGradientBtn(
                                        onPress: () {
                                          if (bioTextController.text.isEmpty) {
                                            AppUtils.showSnakBar(msg: "Enter your bio");
                                          } else {
                                            if (Get.isBottomSheetOpen == true) {
                                              Get.back();
                                            }
                                            ProfileRepository.instance.updateProfile(
                                              // firstName: firstName.text,
                                              // lastName: lastName.text,
                                              bio: bioTextController.text,
                                            );

                                            firstName.clear();
                                            lastName.clear();
                                          }
                                        },
                                        text: "Save"),
                                  )
                                ],
                              ),
                            ));

                            // showCountryPicker(
                            //   context: context,
                            //   onSelect: (value) {
                            //     // ProfileRepository.instance.updateProfile(country: value.name);
                            //     // Get.back();
                            //     // print(value.name);
                            //     // AppUtils.showSnakBar(msg: value.toString());
                            //   },
                            // );
                          },
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColor.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 2),
                ],
              ),
            ),
          ));
    });
  }
}
