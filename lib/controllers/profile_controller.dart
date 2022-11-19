import 'package:get/get.dart';
import 'package:voice_chat/controllers/user_controller.dart';
import 'package:voice_chat/models/profile_model.dart';

class ProfileController extends GetxController {
  static ProfileController instance = Get.find<ProfileController>();
  ProfileModel? profileData;
  String? error;

  setProfileData(ProfileModel profileModel) {
    profileData = profileModel;
    UserController.instance.setUserProfileData(profileData: profileModel);
    // print(profileData?.id);
    update();
  }

  setError(String errorMessage) {
    error = errorMessage;
    print(errorMessage);
    update();
  }
}
