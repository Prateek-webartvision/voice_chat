class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  dynamic emailVerifiedAt;
  String? password;
  dynamic rememberToken;
  String? createdAt;
  String? updatedAt;
  String? role;
  dynamic isdCode;
  String? mobile;
  int? accessLevel;
  String? status;
  String? info;
  dynamic image;
  dynamic appLoginToken;
  dynamic nationalId;
  String? userGroup;
  dynamic photoId;
  dynamic zipcode;
  String? firstName;
  String? lastName;
  dynamic address;
  dynamic country;
  dynamic state;
  dynamic city;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.isdCode,
    this.mobile,
    this.accessLevel,
    this.status,
    this.info,
    this.image,
    this.appLoginToken,
    this.nationalId,
    this.userGroup,
    this.photoId,
    this.zipcode,
    this.firstName,
    this.lastName,
    this.address,
    this.country,
    this.state,
    this.city,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    password = json['password'];
    rememberToken = json['remember_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    isdCode = json['isd_code'];
    mobile = json['mobile'];
    accessLevel = json['access_level'];
    status = json['status'];
    info = json['info'];
    image = json['image'];
    appLoginToken = json['app_login_token'];
    nationalId = json['national_id'];
    userGroup = json['user_group'];
    photoId = json['photo_id'];
    zipcode = json['zipcode'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['password'] = password;
    data['remember_token'] = rememberToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['role'] = role;
    data['isd_code'] = isdCode;
    data['mobile'] = mobile;
    data['access_level'] = accessLevel;
    data['status'] = status;
    data['info'] = info;
    data['image'] = image;
    data['app_login_token'] = appLoginToken;
    data['national_id'] = nationalId;
    data['user_group'] = userGroup;
    data['photo_id'] = photoId;
    data['zipcode'] = zipcode;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address'] = address;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    return data;
  }
}
