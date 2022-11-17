class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? mobile;
  dynamic image;
  dynamic gender;
  dynamic dob;
  int? level;
  String? country;
  String? token;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.mobile,
    this.image,
    this.gender,
    this.dob,
    this.level,
    this.country,
    this.token,
  });

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    image = json['image'];
    gender = json['gender'];
    dob = json['dob'];
    level = json['level'];
    country = json['country'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['image'] = image;
    data['gender'] = gender;
    data['dob'] = dob;
    data['level'] = level;
    data['token'] = token;
    data['country'] = country;
    return data;
  }
}
