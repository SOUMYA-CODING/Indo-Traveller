import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  String message;
  Data data;

  UserProfileModel({
    required this.message,
    required this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String profilePicture;
  String password;
  String username;
  String firstName;
  String lastName;
  String email;
  bool isActive;
  bool isSuperuser;
  String userType;
  String phoneNumber;
  String address;

  Data({
    required this.id,
    required this.profilePicture,
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isActive,
    required this.isSuperuser,
    required this.userType,
    required this.phoneNumber,
    required this.address,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        profilePicture: json["profile_picture"],
        password: json["password"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isActive: json["is_active"],
        isSuperuser: json["is_superuser"],
        userType: json["user_type"],
        phoneNumber: json["phone_number"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "profile_picture": profilePicture,
        "password": password,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_active": isActive,
        "is_superuser": isSuperuser,
        "user_type": userType,
        "phone_number": phoneNumber,
        "address": address,
      };
}
