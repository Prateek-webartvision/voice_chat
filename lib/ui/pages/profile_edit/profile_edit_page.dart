// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
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
  List gender = ["male", "femail", "others"];

  @override
  void initState() {
    ProfileRepository.instance.getProfile();
    super.initState();
  }

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
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          //loading and error
          if (controller.profileData == null) {
            if (controller.error == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Text(controller.error!),
              );
            }
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
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
                            AppUtils.imagePickerDailog(
                              seletedImage: (image) {
                                print("object $image");
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
                              image: (controller.profileData!.image != null)
                                  ? DecorationImage(
                                      //Come here user profile pic
                                      image: CachedNetworkImageProvider(
                                          "https://preview.keenthemes.com/metronic-v4/theme/assets/pages/media/profile/profile_user.jpg"),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          AppColor.black.withOpacity(0.2),
                                          BlendMode.darken),
                                    )
                                  : null,
                            ),
                            child: Icon(Icons.camera_alt_outlined,
                                color: AppColor.white),
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
                                    Text("Edit Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(color: AppColor.black)),
                                    SizedBox(height: h20),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: KTextField2(
                                              textEditingController: firstName,
                                              hintText: "First Name",
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Flexible(
                                            child: KTextField2(
                                              textEditingController: lastName,
                                              hintText: "Last Name",
                                              textInputAction:
                                                  TextInputAction.done,
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
                                            // TODO add save api
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
                                  "${controller.profileData!.firstName} ${controller.profileData!.lastName}",
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
                              ).then((date) => print(date!.year));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.profileData!.dob ?? "NA",
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
                                  .map((e) => PopupMenuItem(child: Text(e)))
                                  .toList();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.profileData!.gender ?? "NA",
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
                                  AppUtils.showSnakBar(msg: value.toString());
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.profileData!.country ?? "NA",
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
              ),
            );
          }
        },
      ),
    );
  }
}
