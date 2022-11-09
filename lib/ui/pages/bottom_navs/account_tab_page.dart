// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/main.dart';
import 'package:voice_chat/repositorys/profile_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/pages/Collectibles/my_collectibles_page.dart';
import 'package:voice_chat/ui/pages/check_name/check_name_page.dart';
import 'package:voice_chat/ui/pages/error_report/error_reporting_page.dart';
import 'package:voice_chat/ui/pages/profile_edit/profile_edit_page.dart';
import 'package:voice_chat/ui/pages/setting/setting_page.dart';
import 'package:voice_chat/ui/pages/store/store_page.dart';
import 'package:voice_chat/ui/pages/wallet/wallet_page.dart';
import 'package:voice_chat/ui/widgets/account_tab_page_bg.dart';
import 'package:voice_chat/ui/widgets/gradient_icon_widget.dart';

class AccountTabPage extends StatefulWidget {
  const AccountTabPage({super.key});

  @override
  State<AccountTabPage> createState() => _AccountTabPageState();
}

class _AccountTabPageState extends State<AccountTabPage> {
  @override
  void initState() {
    ProfileRepository.instance.getProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          //Loading and error
          if (controller.profileData == null) {
            if (controller.error == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Text(controller.error!),
              );
            }
          } else {
            //Success
            return AccountTabPageBg(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 70),
                        //Account card
                        Container(
                          padding: const EdgeInsets.all(16),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Avatr
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      gradient: AppColor.backgraundGradientV,
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "N",
                                      style: TextStyle(
                                        color: AppColor.white,
                                        fontSize: 50.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: h20),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: h20),
                                      //name and id
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            //put user name
                                            "${controller.profileData!.firstName!} ${controller.profileData!.lastName!}",
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          //Edit btn
                                          IconButton(
                                            icon: Icon(
                                              Icons.mode_edit_outlined,
                                              color: AppColor.closeToPurple,
                                            ),
                                            onPressed: () {
                                              Get.to(() => ProfileEditPage());
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(height: h20),

                                      // user id or phone number
                                      Text(
                                        controller.profileData!.mobile!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(color: AppColor.black54),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              SizedBox(height: h10),
                              const Divider(thickness: 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //Following
                                  Column(
                                    children: [
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Following",
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //Followers
                                  Column(
                                    children: [
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //friends
                                  Column(
                                    children: [
                                      Text(
                                        "0",
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Friends",
                                        style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        //setting
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              //Level
                              ListTile(
                                leading: GradientIcon(Icons.reviews, 25,
                                    AppColor.backgraundGradientV),
                                title: Text(
                                  "Level",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                              const Divider(
                                thickness: 1.5,
                              ),
                              // Wallet
                              ListTile(
                                onTap: () {
                                  Get.to(() => WalletPage());
                                },
                                leading: GradientIcon(Icons.wallet, 25,
                                    AppColor.backgraundGradientV),
                                title: Text(
                                  "Wallet",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text("0"),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.arrow_forward_ios_rounded),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1.5,
                              ),
                              // Store
                              ListTile(
                                onTap: () {
                                  Get.to(() => StorePage());
                                },
                                leading: GradientIcon(
                                  Icons.store,
                                  25,
                                  AppColor.backgraundGradientV,
                                ),
                                title: Text(
                                  "Store",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        //setting2
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            children: [
                              //Mamilies
                              ListTile(
                                leading: GradientIcon(Icons.safety_check, 25,
                                    AppColor.backgraundGradientV),
                                title: Text(
                                  "Mamilies",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                              const Divider(
                                thickness: 1.5,
                              ),
                              //My Collectibles
                              ListTile(
                                leading: GradientIcon(Icons.hexagon_outlined,
                                    25, AppColor.backgraundGradientV),
                                onTap: () {
                                  Get.to(() => MyCollectiblesPage());
                                },
                                title: Text(
                                  "My Collectibles",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                              const Divider(
                                thickness: 1.5,
                              ),
                              //Error Reporting
                              ListTile(
                                onTap: () {
                                  Get.to(() => ErrorReportingPage());
                                },
                                leading: GradientIcon(Icons.file_present_sharp,
                                    25, AppColor.backgraundGradientV),
                                title: Text(
                                  "Error Reporting",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                              const Divider(
                                thickness: 1.5,
                              ),

                              //Check name
                              ListTile(
                                onTap: () {
                                  Get.to(() => CheckNamePage());
                                },
                                leading: GradientIcon(Icons.file_present_sharp,
                                    25, AppColor.backgraundGradientV),
                                title: Text(
                                  "Check Name",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                              //setting
                              const Divider(
                                thickness: 1.5,
                              ),
                              ListTile(
                                onTap: () {
                                  Get.to(() => SettingPage());
                                },
                                leading: GradientIcon(
                                  Icons.settings_outlined,
                                  25,
                                  AppColor.backgraundGradientV,
                                ),
                                title: Text(
                                  "Setting",
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.arrow_forward_ios_rounded),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    ProfileController.instance.error = null;
    ProfileController.instance.profileData = null;
    super.dispose();
  }
}
