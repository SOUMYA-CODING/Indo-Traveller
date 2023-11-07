import 'dart:convert';

ReviewListModel reviewListModelFromJson(String str) =>
    ReviewListModel.fromJson(json.decode(str));

String reviewListModelToJson(ReviewListModel data) =>
    json.encode(data.toJson());

class ReviewListModel {
  String message;
  List<Datum> data;
  double totalRating;

  ReviewListModel({
    required this.message,
    required this.data,
    required this.totalRating,
  });

  factory ReviewListModel.fromJson(Map<String, dynamic> json) =>
      ReviewListModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalRating: json["total_rating"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total_rating": totalRating,
      };
}

class Datum {
  int id;
  User user;
  String rating;
  String comment;
  DateTime createdAt;
  int property;

  Datum({
    required this.id,
    required this.user,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.property,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        user: User.fromJson(json["user"]),
        rating: json["rating"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        property: json["property"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "rating": rating,
        "comment": comment,
        "created_at": createdAt.toIso8601String(),
        "property": property,
      };
}

class User {
  int id;
  dynamic profilePicture;
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

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        profilePicture: json["profile_picture"] ?? "",
        password: json["password"] ?? "",
        username: json["username"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        email: json["email"] ?? "",
        isActive: json["is_active"] ?? "",
        isSuperuser: json["is_superuser"] ?? "",
        userType: json["user_type"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        address: json["address"] ?? "",
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
