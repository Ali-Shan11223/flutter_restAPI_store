import 'package:flutter/material.dart';

import 'category_model.dart';

class ProductsModel with ChangeNotifier {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  CategoryModel? category;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.creationAt,
      this.updatedAt,
      this.category});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["price"] is int) {
      price = json["price"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["images"] is List) {
      images =
          json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if (json["creationAt"] is String) {
      creationAt = json["creationAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["category"] is Map) {
      category = json["category"] == null
          ? null
          : CategoryModel.fromJson(json["category"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["price"] = price;
    data["description"] = description;
    if (images != null) {
      data["images"] = images;
    }
    data["creationAt"] = creationAt;
    data["updatedAt"] = updatedAt;
    if (category != null) {
      data["category"] = category?.toJson();
    }
    return data;
  }

  static List<ProductsModel> productsFromSnapshot(List productsSnapshot) {
    return productsSnapshot.map((data) {
      return ProductsModel.fromJson(data);
    }).toList();
  }
}
