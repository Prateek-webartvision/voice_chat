// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/account_tab_page_bg.dart';
import 'package:voice_chat/ui/widgets/gradient_icon_widget.dart';

class AccountTabPage extends StatelessWidget {
  const AccountTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountTabPageBg(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  //Account card
                  Container(
                    height: 210,
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Avatr
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                gradient: AppColor.backgraundGradientV,
                                borderRadius: BorderRadius.circular(100.r),
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
                            const SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Name",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Icon(
                                      Icons.mode_edit_outlined,
                                      color: AppColor.closeToPurple,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "12345678",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: AppColor.black54),
                                ),
                              ],
                            ))
                          ],
                        ),
                        SizedBox(height: h10),
                        const Divider(thickness: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        ListTile(
                          // leading: Icon(
                          //   Icons.reviews,
                          //   color: AppColor.closeToPurple,
                          // ),
                          leading: GradientIcon(
                              Icons.reviews, 25, AppColor.backgraundGradientV),
                          title: Text(
                            "Level",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.wallet,
                          //   color: AppColor.closeToPurple,
                          // ),
                          leading: GradientIcon(
                              Icons.wallet, 25, AppColor.backgraundGradientV),
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
                        ListTile(
                          // leading: Icon(
                          //   Icons.store,
                          //   color: AppColor.closeToPurple,
                          // ),
                          leading: GradientIcon(
                              Icons.store, 25, AppColor.backgraundGradientV),
                          title: Text(
                            "Store",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
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
                        ListTile(
                          // leading: Icon(
                          //   Icons.safety_check,
                          //   color: AppColor.closeToPurple,
                          // ),
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
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.hexagon_outlined,
                          //   color: AppColor.closeToPurple,
                          // ),
                          leading: GradientIcon(Icons.hexagon_outlined, 25,
                              AppColor.backgraundGradientV),
                          title: Text(
                            "My Collectibles",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.file_present_sharp,
                          //   color: AppColor.closeToPurple,
                          // ),
                          leading: GradientIcon(Icons.file_present_sharp, 25,
                              AppColor.backgraundGradientV),
                          title: Text(
                            "Error Reporting",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        const Divider(
                          thickness: 1.5,
                        ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.file_present_sharp,
                          //   color: AppColor.closeToPurple,
                          // ),

                          leading: GradientIcon(Icons.file_present_sharp, 25,
                              AppColor.backgraundGradientV),
                          title: Text(
                            "Check Name",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
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
      ),
    );
  }
}
