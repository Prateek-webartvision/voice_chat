class FriendUserModel {
  final int id;
  final String firstName;
  final String lastName;
  String? image;
  final String createdAt;
  final String updatedAt;

  FriendUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FriendUserModel.fromJson(Map<String, dynamic> json) {
    return FriendUserModel(
      id: json['userid'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
