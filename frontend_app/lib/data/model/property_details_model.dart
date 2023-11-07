// To parse this JSON data, do
//
//     final propertyDetailsModel = propertyDetailsModelFromJson(jsonString);

import 'dart:convert';

PropertyDetailsModel propertyDetailsModelFromJson(String str) =>
    PropertyDetailsModel.fromJson(json.decode(str));

String propertyDetailsModelToJson(PropertyDetailsModel data) =>
    json.encode(data.toJson());

class PropertyDetailsModel {
  String message;
  Data data;

  PropertyDetailsModel({
    required this.message,
    required this.data,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) =>
      PropertyDetailsModel(
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
  List<PropertyImage> propertyImages;
  List<PropertyType> amenities;
  Host host;
  PropertyType propertyType;
  String title;
  String description;
  String pricePerNight;
  String state;
  String city;
  String address;
  int numberOfGuestAllowed;
  int numberOfBedrooms;
  int numberOfQueenBeds;
  int numberOfKingBeds;
  int numberOfDoubleBeds;
  int numberOfSingleBeds;
  bool isActive;
  bool isReserved;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.propertyImages,
    required this.amenities,
    required this.host,
    required this.propertyType,
    required this.title,
    required this.description,
    required this.pricePerNight,
    required this.state,
    required this.city,
    required this.address,
    required this.numberOfGuestAllowed,
    required this.numberOfBedrooms,
    required this.numberOfQueenBeds,
    required this.numberOfKingBeds,
    required this.numberOfDoubleBeds,
    required this.numberOfSingleBeds,
    required this.isActive,
    required this.isReserved,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        propertyImages: List<PropertyImage>.from(
            json["property_images"].map((x) => PropertyImage.fromJson(x))),
        amenities: List<PropertyType>.from(
            json["amenities"].map((x) => PropertyType.fromJson(x))),
        host: Host.fromJson(json["host"]),
        propertyType: PropertyType.fromJson(json["property_type"]),
        title: json["title"],
        description: json["description"],
        pricePerNight: json["price_per_night"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        numberOfGuestAllowed: json["number_of_guest_allowed"],
        numberOfBedrooms: json["number_of_bedrooms"],
        numberOfQueenBeds: json["number_of_queen_beds"],
        numberOfKingBeds: json["number_of_king_beds"],
        numberOfDoubleBeds: json["number_of_double_beds"],
        numberOfSingleBeds: json["number_of_single_beds"],
        isActive: json["is_active"],
        isReserved: json["is_reserved"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_images":
            List<dynamic>.from(propertyImages.map((x) => x.toJson())),
        "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
        "host": host.toJson(),
        "property_type": propertyType.toJson(),
        "title": title,
        "description": description,
        "price_per_night": pricePerNight,
        "state": state,
        "city": city,
        "address": address,
        "number_of_guest_allowed": numberOfGuestAllowed,
        "number_of_bedrooms": numberOfBedrooms,
        "number_of_queen_beds": numberOfQueenBeds,
        "number_of_king_beds": numberOfKingBeds,
        "number_of_double_beds": numberOfDoubleBeds,
        "number_of_single_beds": numberOfSingleBeds,
        "is_active": isActive,
        "is_reserved": isReserved,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class PropertyType {
  int id;
  String name;
  bool isActive;
  String? icon;

  PropertyType({
    required this.id,
    required this.name,
    required this.isActive,
    this.icon,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
        id: json["id"],
        name: json["name"],
        isActive: json["is_active"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_active": isActive,
        "icon": icon,
      };
}

class Host {
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

  Host({
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

  factory Host.fromJson(Map<String, dynamic> json) => Host(
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

class PropertyImage {
  String propertyImages;

  PropertyImage({
    required this.propertyImages,
  });

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
        propertyImages: json["property_images"],
      );

  Map<String, dynamic> toJson() => {
        "property_images": propertyImages,
      };
}
