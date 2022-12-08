import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:voice_chat/repositorys/post_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/repositorys/profile_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_chat/utils/app_utils.dart';

import '../../../widgets/gradient_icon_widget.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController messageTextController = TextEditingController();
  PostPostController postController = Get.put(PostPostController());

  final imagePicker = ImagePicker();
  File? imageFile;

  @override
  void initState() {
    ProfileRepository.instance.getProfile();
    postController.selectedTag = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.black),
        centerTitle: true,
        title: Text(
          "Post a moment",
          style: TextStyle(color: AppColor.black),
        ),
      ),
      body: GetBuilder<PostPostController>(builder: (controller) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(height: h30),
                KTextField2(
                  textEditingController: messageTextController,
                  hintText: "Moment of your life...",
                  maxLines: 16,
                  minLines: 16,
                ),
                const Divider(thickness: 2),
                SizedBox(height: h10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Tag btn
                    Flexible(
                      flex: 1,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColor.black54.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: addTag,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(mainAxisSize: MainAxisSize.min, children: [
                              Container(
                                height: h30,
                                width: h30,
                                decoration: BoxDecoration(
                                  color: AppColor.closeToPurple,
                                  gradient: AppColor.backgraundGradient(),
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "#",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(child: Text(controller.tagsString ?? "Add Tag")),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    //Image btn
                    Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Add Image");
                              imagePicker.pickImage(source: ImageSource.gallery).then((value) {
                                setState(() {
                                  imageFile = File(value!.path);
                                });
                              });
                            },
                            child: Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: AppColor.black.withOpacity(0.3), borderRadius: BorderRadius.circular(16), image: (imageFile == null) ? null : DecorationImage(image: FileImage(imageFile!))),
                              child: Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 50,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                          SizedBox(height: h10),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColor.grey200,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: const [
                                Expanded(child: Text("Them moment isnot without picture ")),
                                // Icon(Icons.info_outlined)
                                GradientIcon(
                                  Icons.info_outline_rounded,
                                  20,
                                  AppColor.backgraundGradientV,
                                )
                              ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: MyGradientBtn(
            onPress: sedPost,
            text: "Send",
            borderRadius: 20,
          ),
        )),
      ),
    );
  }

  //*Add Tags
  addTag() {
    Get.bottomSheet(GetBuilder<PostPostController>(builder: (controller) {
      return Container(
        color: AppColor.white,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Please choose a tag",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.black, fontSize: 16),
            ),
            Text(
              "Only you can choose one tag",
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.black54, fontSize: 10),
            ),

            const SizedBox(height: 20),
            //Tags
            Wrap(
              children: postController.myTags.map(
                (e) {
                  return Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: (controller.myTags.indexOf(e) != controller.selectedTag) ? null : AppColor.closeToPurple.withOpacity(.3),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColor.black54.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        postController.selectedTags(controller.myTags.indexOf(e));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Container(
                            height: h30,
                            width: h30,
                            decoration: BoxDecoration(
                              color: AppColor.closeToPurple,
                              gradient: AppColor.backgraundGradient(),
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "#",
                              style: TextStyle(
                                color: AppColor.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(child: Text(e)),
                        ]),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: MyGradientBtn(
                  onPress: () {
                    if (controller.selectedTag != null) {
                      controller.updateTag(controller.myTags[controller.selectedTag!]);
                      Get.back();
                    } else {
                      AppUtils.showSnakBar(msg: "Selcet Tag");
                    }
                  },
                  text: "add Tag",
                  borderRadius: 40),
            ),

            //Btn,
            const SizedBox(height: 20),
          ],
        ),
      );
    }), isScrollControlled: true);
    setState(() {
      // tagsString = "kundan";
    });
  }

  //*sedPost
  sedPost() => PostRepository.instance.createNewPost(
        image: imageFile?.path,
        postMessage: messageTextController.text,
        tag: "",
      );

  @override
  void dispose() {
    messageTextController.dispose();
    super.dispose();
  }
}

class PostPostController extends GetxController {
  String? tagsString;
  List<String> myTags = ["Tag1", "Test Tag", "new Tag"];
  int? selectedTag;

  selectedTags(int? ss) {
    selectedTag = ss;
    update();
  }

  updateTag(String tag) {
    tagsString = tag;
    update();
  }
}
