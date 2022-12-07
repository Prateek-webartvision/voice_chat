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
  }
}

class Room {
  late int id;
  late String roomName;
  String? image;
  late String firstName;
  List? users;
  late int createdBy;
  late String lastName;
  String? creatorImage;

  Room({
    required this.id,
    required this.roomName,
    required this.users,
    required this.createdBy,
    required this.firstName,
    required this.creatorImage,
    required this.image,
  });

  Room.fromJson(Map<String, dynamic> json) {
    // print(json);
    id = json['id'];
    roomName = json['room_name'];
    users = json['users'];
    image = json['image'];
    createdBy = int.parse("${json['created_by']}");
    firstName = json['first_name'];
    lastName = json['last_name'];
    creatorImage = json['creator_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['room_name'] = roomName;
    data['users'] = users;
    data['image'] = image;
    data['created_by'] = createdBy;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['creator_image'] = creatorImage;
    return data;
  }
}
