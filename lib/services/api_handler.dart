import 'dart:convert';

import 'package:flutter_restapi_storeapp/models/products_model.dart';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../models/category_model.dart';

class APIHandler {
  static Future<List<ProductsModel>> getAllProducts() async {
    try {
      var uri = Uri.https(APIConstants.baseUrl, APIConstants.allProducts);
      var response = await http.get(uri);
      List temp = [];
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data) {
          temp.add(i);
        }
        return ProductsModel.productsFromSnapshot(temp);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<CategoryModel>> getAllCategory() async {
    try {
      var uri = Uri.https(APIConstants.baseUrl, APIConstants.allCategories);
      var response = await http.get(uri);
      List temp = [];
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data) {
          temp.add(i);
        }
        return CategoryModel.categoryFromSnapshot(temp);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    try {
      var uri = Uri.https(APIConstants.baseUrl, 'api/v1/products/$id');
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return ProductsModel.fromJson(data);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<ProductsModel>> getProductsByCategory(
      {required String id}) async {
    try {
      var uri =
          Uri.https(APIConstants.baseUrl, 'api/v1/categories/$id/products');
      var response = await http.get(uri);
      List temp = [];
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var i in data) {
          temp.add(i);
        }
        return ProductsModel.productsFromSnapshot(temp);
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
