// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isUser = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Search Bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: KTextField2(
                        textInputAction: TextInputAction.search,
                        hintText: "Search",
                        onSubmit: (value) {
                          print(value);
                        },
                        prefixIcon: Icon(Icons.search)),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text("Cencel"))
                ],
              ),
            ),
            // is User cheack
            RoomOrUser(
              isUser: isUser,
              onTab: (isUser) {
                setState(() {
                  this.isUser = isUser;
                });
              },
            ),
            //Result
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text("Result"),
            ))
          ],
        ),
      ),
    );
  }
}

class RoomOrUser extends StatelessWidget {
  const RoomOrUser({
    super.key,
    required this.isUser,
    required this.onTab,
  });
  final bool isUser;
  final Function(bool isUser) onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          //USer
          InkWell(
            onTap: () => onTab(true),
            child: _tab(
              text: "User",
              isActive: isUser,
            ),
          ),

          SizedBox(width: 16),
          InkWell(
            onTap: () => onTab(false),
            child: _tab(
              text: "Room",
              isActive: !isUser,
            ),
          )
        ],
      ),
    );
  }

  Widget _tab({required String text, required bool isActive}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isActive == true ? AppColor.closeToPurple : AppColor.black54,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        isActive == true
            ? Container(
                height: 3,
                width: 10,
                decoration: BoxDecoration(
                  gradient: AppColor.backgraundGradientV,
                ),
              )
            : Container(
                height: 3,
                width: 10,
                decoration: BoxDecoration(
                    // gradient: AppColor.backgraundGradientV,
                    ),
              ),
      ],
    );
  }
}
