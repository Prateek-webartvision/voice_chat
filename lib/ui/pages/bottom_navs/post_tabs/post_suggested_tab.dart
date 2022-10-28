// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/res/constant_value.dart';

class PostSuggestedTab extends StatelessWidget {
  const PostSuggestedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(40),
                      )),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text("User name"),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColor.closeToRed,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColor.white,
                    ),
                  )
                ],
              ),
              SizedBox(height: h10),
              Row(
                children: [
                  Text("message comes here"),
                ],
              ),
              SizedBox(height: h10),
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: AppColor.black54,
                      ),
                      SizedBox(width: 10),
                      Text("1")
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.message,
                        color: AppColor.black54,
                      ),
                      SizedBox(width: 10),
                      Text("0")
                    ],
                  )
                ],
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 2,
            endIndent: 40,
          );
        },
      ),
    );
  }
}
