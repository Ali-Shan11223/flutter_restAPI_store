import 'package:flutter/material.dart';

class UsersModel with ChangeNotifier{
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;

  UsersModel(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.role,
      this.avatar,
      this.creationAt,
      this.updatedAt});

  UsersModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["role"] is String) {
      role = json["role"];
    }
    if (json["avatar"] is String) {
      avatar = json["avatar"];
    }
    if (json["creationAt"] is String) {
      creationAt = json["creationAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["email"] = email;
    data["password"] = password;
    data["name"] = name;
    data["role"] = role;
    data["avatar"] = avatar;
    data["creationAt"] = creationAt;
    data["updatedAt"] = updatedAt;
    return data;
  }

  static List<UsersModel> usersFromSnapshot(List usersSnapshot) {
    return usersSnapshot.map((data) {
      return UsersModel.fromJson(data);
    }).toList();
  }
}
