import 'dart:convert';

PropertyListModel propertyListModelFromJson(String str) =>
    PropertyListModel.fromJson(json.decode(str));

String propertyListModelToJson(PropertyListModel data) =>
    json.encode(data.toJson());

class PropertyListModel {
  String message;
  List<Datum> data;

  PropertyListModel({
    required this.message,
    required this.data,
  });

  factory PropertyListModel.fromJson(Map<String, dynamic> json) =>
      PropertyListModel(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  int propertyType;
  PropertyImages propertyImages;
  String city;
  String state;
  String pricePerNight;

  Datum({
    required this.id,
    required this.propertyType,
    required this.propertyImages,
    required this.city,
    required this.state,
    required this.pricePerNight,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        propertyType: json["property_type"],
        propertyImages: PropertyImages.fromJson(json["property_images"]),
        city: json["city"],
        state: json["state"],
        pricePerNight: json["price_per_night"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "property_type": propertyType,
        "property_images": propertyImages.toJson(),
        "city": city,
        "state": state,
        "price_per_night": pricePerNight,
      };
}

class PropertyImages {
  String propertyImages;

  PropertyImages({
    required this.propertyImages,
  });

  factory PropertyImages.fromJson(Map<String, dynamic> json) => PropertyImages(
        propertyImages: json["property_images"],
      );

  Map<String, dynamic> toJson() => {
        "property_images": propertyImages,
      };
}
