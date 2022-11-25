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
  List<RequestSent> requestSent;
  List<RequestReceived> requestReceived;

  Data({
    required this.requestSent,
    required this.requestReceived,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<RequestSent> sendRequestTempList = [];
    List<RequestReceived> recvRequestTempList = [];
    json['request_sent'].forEach((v) {
      sendRequestTempList.add(RequestSent.fromJson(v));
    });
    json['request_received'].forEach((v) {
      recvRequestTempList.add(RequestReceived.fromJson(v));
    });

    return Data(
      requestSent: sendRequestTempList,
      requestReceived: recvRequestTempList,
    );
  }
}

class RequestSent {
  final String firstName;
  final String lastName;
  String? image;
  final int id;
  final String createdAt;
  final String updatedAt;

  RequestSent({
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RequestSent.fromJson(Map<String, dynamic> json) {
    return RequestSent(
        firstName: json['first_name'],
        lastName: json['last_name'],
        image: json['image'],
        id: json['userid'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}

class RequestReceived {
  final String firstName;
  final String lastName;
  String? image;
  final int id;
  final String createdAt;
  final String updatedAt;

  RequestReceived({
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RequestReceived.fromJson(Map<String, dynamic> json) {
    return RequestReceived(
        firstName: json['first_name'],
        lastName: json['last_name'],
        image: json['image'],
        id: json['userid'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}
