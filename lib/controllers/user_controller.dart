import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voice_chat/models/profile_model.dart';

class UserController extends GetxController {
  static UserController instance = Get.find<UserController>();
  GetStorage userStorage = GetStorage();

  final String _user = "user";
  final String token = "token";

  final String _userData = "userData";

  final String _id = "id";
  final String _firstName = "first_name";
  final String _lastName = "last_name";
  final String _mobile = "mobile";
  final String _image = "image";
  final String _coverImage = "cover_image";
  final String _gender = "gender";
  final String _dob = "dob";
  final String _country = "country";
  final String _bio = "bio";
  // int? id;
  // String? firstName;
  // String? lastName;
  // String? mobile;
  // String? image;
  // String? gender;
  // String? dob;
  // String? country;

  setUser({required Map<String, dynamic> userData}) {
    var v = userStorage.write(_user, userData);
    update();
    return v;
  }

  setUserProfileData({required ProfileModel profileData}) {
    print("User Upade Profile Call");
    //set data
    userStorage.write(_userData, {
      _id: profileData.id,
      _firstName: profileData.firstName,
      _lastName: profileData.lastName,
      _mobile: profileData.mobile,
      _image: profileData.image,
      _coverImage: profileData.coverImage,
      _gender: profileData.gender,
      _dob: profileData.dob,
      _bio: profileData.bio,
      _country: profileData.country,
    });

    //  getData
    // id = getId;
    // firstName = getFirstName;
    update();
  }

  get _getUserProfileData => userStorage.read(_userData);

  get getId => _getUserProfileData[_id];
  get getFirstName => _getUserProfileData[_firstName];
  get getLastName => _getUserProfileData[_lastName];
  get getMobile => _getUserProfileData[_mobile];
  get getImage => _getUserProfileData[_image];
  get getGender => _getUserProfileData[_gender];
  get getDob => _getUserProfileData[_dob];
  get getCoverImage => _getUserProfileData[_coverImage];
  get getBio => _getUserProfileData[_bio];
  get getCountry => _getUserProfileData[_country];

  //delete user
  logoutUser() async {
    var v = userStorage.remove(_user);
    update();
    return v;
  }

  bool checkCurrentUser() => userStorage.read(_user) == null ? false : true;

  //user geters
  get getUser => userStorage.read(_user);
  get getToken => getUser[token];
}
