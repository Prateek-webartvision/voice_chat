import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/models/profile_model.dart';
import 'package:voice_chat/models/room_model.dart';
import 'package:voice_chat/repositorys/profile_repo.dart';
import 'package:voice_chat/repositorys/room_repo.dart';
import 'package:voice_chat/res/app_color.dart';
import 'package:voice_chat/ui/pages/rooms/room_page.dart';
import 'package:voice_chat/ui/widgets/backgraund_widget.dart';
import 'package:voice_chat/ui/widgets/k_text_field.dart';
import 'package:voice_chat/utils/app_utils.dart';

class CreateRoomTabPage extends StatefulWidget {
  const CreateRoomTabPage({super.key});

  @override
  State<CreateRoomTabPage> createState() => _CreateRoomTabPageState();
}

class _CreateRoomTabPageState extends State<CreateRoomTabPage> {
  TextEditingController roomname = TextEditingController();
  late ProfileModel userData;
  @override
  void initState() {
    ProfileRepository.instance.getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackgraundWidget(
      child: Scaffold(
        backgroundColor: AppColor.transparent,
        appBar: AppBar(
          backgroundColor: AppColor.transparent,
          elevation: 0,
        ),
        body: GetBuilder<ProfileController>(
          builder: (controller) {
            if (controller.profileData == null) {
              if (controller.error == null) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(
                  child: Text(controller.error!),
                );
              }
            } else {
              userData = controller.profileData!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 150),
                    //Text field
                    KTextField2(
                      hintText: "Room Name",
                      textEditingController: roomname,
                      fillColor: AppColor.grey200.withOpacity(0.5),
                    ),
                    const SizedBox(height: 10),
                    //Dowpdown
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: AppColor.grey200.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Room Type",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_circle,
                            color: AppColor.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //mic
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: AppColor.white, width: 1)),
                          child: Icon(
                            Icons.mic,
                            color: AppColor.white,
                          ),
                        ),
                        //create
                        InkWell(
                          onTap: createRoom,
                          child: Container(
                            height: 80,
                            width: 80,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(50),
                              // border: Border.all(color: AppColor.white, width: 1),
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColor.white,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: AppColor.closeToPurple, width: 2),
                              ),
                            ),
                          ),
                        ),
                        //chat
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.green[400],
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(color: AppColor.white, width: 1)),
                          child: Icon(
                            Icons.chat,
                            color: AppColor.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
        // body:
      ),
    );
  }

  createRoom() async {
    if (roomname.text.isEmpty) {
      AppUtils.showSnakBar(msg: "Enter Room name", second: 2);
    } else {
      await RoomRepository.instance.createNewRoom(
        roomName: roomname.text,
        userFirstName: userData.firstName!,
        userLastName: userData.lastName!,
        userProfileImage: userData.image!,
        image: "iamge1",
        createBy: userData.id.toString(),
        info: "sadasd",
        onCreated: (Room room) {
          // try to join room here

          Get.off(() => RoomPage(room: room));
        },
      );
      // print("create ${roomname.text}");
      // AppUtils.showSnakBar(msg: "${roomname.text} Room Created ");

    }
  }

  @override
  void dispose() {
    roomname.dispose();
    super.dispose();
  }
}
