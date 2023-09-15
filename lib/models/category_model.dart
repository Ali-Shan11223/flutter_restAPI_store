import 'package:flutter/material.dart';

class CategoryModel with ChangeNotifier {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryModel(
      {this.id, this.name, this.image, this.creationAt, this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["image"] is String) {
      image = json["image"];
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
    data["name"] = name;
    data["image"] = image;
    data["creationAt"] = creationAt;
    data["updatedAt"] = updatedAt;
    return data;
  }

  static List<CategoryModel> categoryFromSnapshot(List categorySnpashot) {
    return categorySnpashot.map((data) {
      return CategoryModel.fromJson(data);
    }).toList();
  }
}
