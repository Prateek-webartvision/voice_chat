import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voice_chat/controllers/profile_controller.dart';
import 'package:voice_chat/models/profile_model.dart';

class UserController extends GetxController {
  static UserController instance = Get.find<UserController>();
  GetStorage userStorage = GetStorage();

  String user = "user";
  String token = "token";

  String userData = "userData";
  String id = "id";
  String firstName = "first_name";
  String lastName = "last_name";
  String mobile = "mobile";
  String image = "image";
  String gender = "gender";
  String dob = "dob";
  String country = "country";

  setUser({required Map<String, dynamic> userData}) {
    var v = userStorage.write(user, userData);
    update();
    return v;
  }

  setUserProfileData({required ProfileModel profileData}) {
    print("User Upade Profile Call");
    userStorage.write(userData, {
      id: profileData.id,
      firstName: profileData.firstName,
      lastName: profileData.lastName,
      mobile: profileData.mobile,
      image: profileData.image,
      gender: profileData.gender,
      dob: profileData.dob,
      country: profileData.country,
    });
  }

  get _getUserProfileData => userStorage.read(userData);
  get getId => _getUserProfileData[id];
  get getFirstName => _getUserProfileData[firstName];
  get getLastName => _getUserProfileData[lastName];
  get getMobile => _getUserProfileData[mobile];
  get getImage => _getUserProfileData[image];
  get getGender => _getUserProfileData[gender];
  get getDob => _getUserProfileData[dob];
  get getCountry => _getUserProfileData[country];

  //delete user
  logoutUser() async {
    var v = userStorage.remove(user);
    update();
    return v;
  }

  bool checkCurrentUser() => userStorage.read(user) == null ? false : true;

  //user geters
  get getUser => userStorage.read(user);
  // get getId => getUser[id];
  // get getFirstName => getUser[firstName];
  // get getLastName => getUser[lastName];
  // get getMobile => getUser[mobile];
  get getToken => getUser[token];
}
