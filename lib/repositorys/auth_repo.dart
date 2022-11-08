import 'package:voice_chat/data/api_services.dart';
import 'package:voice_chat/data/app_urls.dart';

class AuthRepository {
  ApiServices apiServices = ApiServices();

  signInWithId({required String phone, required String password}) {
    Map<String, dynamic> userData = {
      "mobile": "1234567890",
      "password": "123",
    };

    ApiServices.postApi(url: AppUrls.signInWithId, mapData: userData)
        .then(
          (value) => print(value),
        )
        .onError(
          (error, stackTrace) => print("My error: $error"),
        );
  }
}
