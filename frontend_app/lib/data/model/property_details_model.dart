import 'dart:convert';

PropertyDetailsModel propertyDetailsModelFromJson(String str) => PropertyDetailsModel.fromJson(json.decode(str));

String propertyDetailsModelToJson(PropertyDetailsModel data) => json.encode(data.toJson());

class PropertyDetailsModel {
  String message;
  Data data;

  PropertyDetailsModel({
    required this.message,
    required this.data,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) => PropertyDetailsModel(
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
  List<Amenity> amenities;
  String title;
  String description;
  String pricePerNight;
  String state;
  String city;
  String address;
  int numberOfQueenBedrooms;
  int numberOfQueenBeds;
  int numberOfKingBeds;
  int numberOfDoubleBeds;
  int numberOfSingleBeds;
  bool isActive;
  bool isReserved;
  DateTime createdAt;
  DateTime updatedAt;
  int host;
  int propertyType;

  Data({
    required this.id,
    required this.propertyImages,
    required this.amenities,
    required this.title,
    required this.description,
    required this.pricePerNight,
    required this.state,
    required this.city,
    required this.address,
    required this.numberOfQueenBedrooms,
    required this.numberOfQueenBeds,
    required this.numberOfKingBeds,
    required this.numberOfDoubleBeds,
    required this.numberOfSingleBeds,
    required this.isActive,
    required this.isReserved,
    required this.createdAt,
    required this.updatedAt,
    required this.host,
    required this.propertyType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    propertyImages: List<PropertyImage>.from(json["property_images"].map((x) => PropertyImage.fromJson(x))),
    amenities: List<Amenity>.from(json["amenities"].map((x) => Amenity.fromJson(x))),
    title: json["title"],
    description: json["description"],
    pricePerNight: json["price_per_night"],
    state: json["state"],
    city: json["city"],
    address: json["address"],
    numberOfQueenBedrooms: json["number_of_queen_bedrooms"],
    numberOfQueenBeds: json["number_of_queen_beds"],
    numberOfKingBeds: json["number_of_king_beds"],
    numberOfDoubleBeds: json["number_of_double_beds"],
    numberOfSingleBeds: json["number_of_single_beds"],
    isActive: json["is_active"],
    isReserved: json["is_reserved"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    host: json["host"],
    propertyType: json["property_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "property_images": List<dynamic>.from(propertyImages.map((x) => x.toJson())),
    "amenities": List<dynamic>.from(amenities.map((x) => x.toJson())),
    "title": title,
    "description": description,
    "price_per_night": pricePerNight,
    "state": state,
    "city": city,
    "address": address,
    "number_of_queen_bedrooms": numberOfQueenBedrooms,
    "number_of_queen_beds": numberOfQueenBeds,
    "number_of_king_beds": numberOfKingBeds,
    "number_of_double_beds": numberOfDoubleBeds,
    "number_of_single_beds": numberOfSingleBeds,
    "is_active": isActive,
    "is_reserved": isReserved,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "host": host,
    "property_type": propertyType,
  };
}

class Amenity {
  int id;
  String name;
  bool isActive;

  Amenity({
    required this.id,
    required this.name,
    required this.isActive,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
    id: json["id"],
    name: json["name"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
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