import 'dart:convert';

class UserModel {
  String name;
  String lastName;
  String? id;
  String birthdate;
  List<String> address;
  String? personProfilePhoto;

  UserModel({
    required this.name,
    required this.lastName,
    this.id,
    required this.birthdate,
    required this.address,
    this.personProfilePhoto,
  });

  UserModel copyWith({
    String? name,
    String? lastName,
    String? id,
    String? birthdate,
    List<String>? address,
  }) =>
      UserModel(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        id: id ?? this.id,
        birthdate: birthdate ?? this.birthdate,
        address: address ?? this.address,
      );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        name: json["name"] ?? '',
        lastName: json["lastName"] ?? '',
        id: json["id"] ?? '',
        birthdate: json["birthdate"] ?? '',
        address: List<String>.from(json["address"].map((x) => x) ?? []),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "lastName": lastName,
        "id": id,
        "birthdate": birthdate,
        "address": List<dynamic>.from(address.map((x) => x)),
      };
}
