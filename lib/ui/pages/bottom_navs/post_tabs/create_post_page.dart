import 'dart:io';

import 'package:flutter/material.dart';
import 'package:voice_chat/repositorys/post_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:voice_chat/res/constant_value.dart';
import 'package:voice_chat/ui/widgets/my_login_btn.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/repositorys/profile_repo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/gradient_icon_widget.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController messageTextController = TextEditingController();
  final imagePicker = ImagePicker();
  File? imageFile;

  @override
  void initState() {
    ProfileRepository.instance.getProfile();

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
      body: SingleChildScrollView(
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
                        onTap: () {
                          print("Add Tag");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            const Text("Add Tag"),
                            const SizedBox(width: 10),
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
                            )
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
                            imagePicker
                                .pickImage(source: ImageSource.gallery)
                                .then((value) {
                              setState(() {
                                imageFile = File(value!.path);
                              });
                            });
                          },
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                color: AppColor.black.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(16),
                                image: (imageFile == null)
                                    ? null
                                    : DecorationImage(
                                        image: FileImage(imageFile!))),
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
                              Expanded(
                                  child: Text(
                                      "Them moment isnot without picture ")),
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
      ),
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

  //sedPost
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
