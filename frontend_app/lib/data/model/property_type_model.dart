import 'dart:convert';

PropertyType propertyTypeFromJson(String str) =>
    PropertyType.fromJson(json.decode(str));

String propertyTypeToJson(PropertyType data) => json.encode(data.toJson());

class PropertyType {
  String message;
  List<Datum> data;

  PropertyType({
    required this.message,
    required this.data,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
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
  String icon;
  String name;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.icon,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        icon: json["icon"],
        name: json["name"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "name": name,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}