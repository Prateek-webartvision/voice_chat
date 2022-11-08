// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';

class ErrorReportingPage extends StatefulWidget {
  const ErrorReportingPage({super.key});

  @override
  State<ErrorReportingPage> createState() => _ErrorReportingPageState();
}

class _ErrorReportingPageState extends State<ErrorReportingPage> {
  List<String> errorTypes = [
    "App Problem",
    "Suggestions",
    "Sgipping",
    "Other",
  ];
  int errorTypeIndex = 0;

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
          "Bug Reports",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.filter_frames_rounded),
                        SizedBox(width: 6),
                        Text("Problem type"),
                      ],
                    ),
                    SizedBox(height: 20),
                    BugTypeWrap(
                      data: errorTypes,
                      currentIndex: errorTypeIndex,
                      onTap: (index, value) {
                        setState(() {
                          errorTypeIndex = index;
                        });
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.insert_drive_file_outlined),
                  SizedBox(width: 8),
                  Text("Content of communication")
                ],
              ),
              SizedBox(height: 20),
              Container(
                // height: 200,
                constraints: BoxConstraints(minWidth: double.maxFinite),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Please write the details of the problem"),
                    SizedBox(height: 20),
                    KTextField2(
                      hintText: "Write here",
                      maxLines: 10,
                      minLines: 8,
                      textInputAction: TextInputAction.done,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.image),
                  SizedBox(width: 8),
                  Text("Communication photos")
                ],
              ),
              SizedBox(height: 20),
              Wrap(children: [
                InkWell(
                  onTap: () {
                    print("Image1");
                  },
                  child: Container(
                    width: (Get.width - 80) / 3,
                    height: (Get.width - 80) / 3,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Icon(
                      Icons.add_photo_alternate,
                      size: 50,
                      color: AppColor.black54,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Image2");
                  },
                  child: Container(
                    width: (Get.width - 80) / 3,
                    height: (Get.width - 80) / 3,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Icon(
                      Icons.add_photo_alternate,
                      size: 50,
                      color: AppColor.black54,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    print("Image3");
                  },
                  child: Container(
                    width: (Get.width - 80) / 3,
                    height: (Get.width - 80) / 3,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: Icon(
                      Icons.add_photo_alternate,
                      size: 50,
                      color: AppColor.black54,
                    ),
                  ),
                ),
              ]),
              // Text("data"),
            ],
          ),
        ),
      ),

      //send btn
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            margin: EdgeInsets.symmetric(horizontal: Get.width * .25),
            // padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              gradient: AppColor.backgraundGradientV,
              borderRadius: BorderRadius.circular(30),
            ),
            alignment: Alignment.center,
            child: Text("Send Problem",
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}

class BugTypeWrap extends StatelessWidget {
  const BugTypeWrap({
    super.key,
    required this.data,
    required this.onTap,
    required this.currentIndex,
  });
  final List<String> data;
  final Function(int index, String value) onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: data.map((e) {
        return InkWell(
          //send index
          onTap: () => onTap(data.indexOf(e), e),
          // box
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.closeToPurple),
              gradient: (currentIndex == data.indexOf(e))
                  ? AppColor.backgraundGradientV
                  : null,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              e,
              style: TextStyle(
                color: (currentIndex == data.indexOf(e))
                    ? AppColor.white
                    : AppColor.black54,
                fontSize: 12,
                fontWeight: (currentIndex == data.indexOf(e))
                    ? FontWeight.w600
                    : FontWeight.w500,
              ),
            ),
          ),
        );
        // return Text("$e ${data.indexOf(e)}");
      }).toList(),
    );
  }
}
