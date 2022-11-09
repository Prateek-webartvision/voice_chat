import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController {
  static UserController instance = Get.find<UserController>();
  GetStorage userStorage = GetStorage();

  String user = "user";
  String id = "id";
  String firstName = "first_name";
  String lastName = "last_name";
  String mobile = "mobile";
  String token = "token";

  setUser({required Map<String, dynamic> userData}) {
    var v = userStorage.write(user, userData);
    update();
    return v;
  }

  //delete user
  logoutUser() async {
    var v = userStorage.remove(user);
    update();
    return v;
  }

  bool checkCurrentUser() => userStorage.read(user) == null ? false : true;

  //user geters
  get getUser => userStorage.read(user);
  get getId => getUser[id];
  get getFirstName => getUser[firstName];
  get getLastName => getUser[lastName];
  get getMobile => getUser[mobile];
  get getToken => getUser[token];
}
