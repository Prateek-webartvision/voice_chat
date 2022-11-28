import 'package:voice_chat/models/friends_models/friend_user_model.dart';

class FirendModel {
  final bool status;
  final String msg;
  final Data data;

  FirendModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory FirendModel.fromJson(Map<String, dynamic> json) {
    return FirendModel(
      status: json['status'],
      msg: json['msg'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  List<FriendUserModel> requestSent;
  List<FriendUserModel> requestReceived;

  Data({
    required this.requestSent,
    required this.requestReceived,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<FriendUserModel> sendRequestTempList = [];
    List<FriendUserModel> recvRequestTempList = [];
    json['request_sent'].forEach((v) {
      sendRequestTempList.add(FriendUserModel.fromJson(v));
    });
    json['request_received'].forEach((v) {
      recvRequestTempList.add(FriendUserModel.fromJson(v));
    });

    return Data(
      requestSent: sendRequestTempList,
      requestReceived: recvRequestTempList,
    );
  }
}
