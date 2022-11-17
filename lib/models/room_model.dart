class RoomModel {
  bool? status;
  String? msg;
  List<Room> rooms = [];

  RoomModel({
    required this.status,
    required this.msg,
    required this.rooms,
  });

  RoomModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        rooms.add(Room.fromJson(v));
      });
    }
    // print(Room.fromJson());
    // rooms = (json['data'] != null)
    //     ? json['data'].forEach((v) {
    //         Room.fromJson(v);
    //       })
    //     : [];
    // if (json['data'] != null) {
    //   json['data'].forEach((v) {
    //     rooms?.add(
    //       Room.fromJson(v),
    //     );
    //   });
    // }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['status'] = status;
  //   data['msg'] = msg;
  //   if (rooms != null) {
  //     data['data'] = rooms!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Room {
  late int id;
  late String roomName;
  String? users;
  late int createdBy;
  late String firstName;
  late String lastName;
  String? creatorImage;
  String? image;
  String? info;
  late bool active;
  late String createdAt;
  late String updatedAt;

  Room({
    required this.id,
    required this.roomName,
    this.users,
    required this.createdBy,
    required this.firstName,
    this.creatorImage,
    this.image,
    this.info,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  Room.fromJson(Map<String, dynamic> json) {
    // print(json);
    id = json['id'];
    roomName = json['room_name'];
    users = json['users'];
    createdBy = json['created_by'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    creatorImage = json['creator_image'];

    image = json['image'];
    info = json['info'];
    active = json['active'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['room_name'] = roomName;
    data['users'] = users;
    data['created_by'] = createdBy;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['creator_image'] = creatorImage;
    data['image'] = image;
    data['info'] = info;
    data['active'] = active;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
