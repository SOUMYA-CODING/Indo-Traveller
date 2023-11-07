// To parse this JSON data, do
//
//     final propertyTypeModel = propertyTypeModelFromJson(jsonString);

import 'dart:convert';

PropertyTypeModel propertyTypeModelFromJson(String str) =>
    PropertyTypeModel.fromJson(json.decode(str));

String propertyTypeModelToJson(PropertyTypeModel data) =>
    json.encode(data.toJson());

class PropertyTypeModel {
  String message;
  List<Datum> data;

  PropertyTypeModel({
    required this.message,
    required this.data,
  });

  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) =>
      PropertyTypeModel(
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
  String name;
  String icon;
  bool isActive;

  Datum({
    required this.id,
    required this.name,
    required this.icon,
    required this.isActive,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
        "is_active": isActive,
      };
}
