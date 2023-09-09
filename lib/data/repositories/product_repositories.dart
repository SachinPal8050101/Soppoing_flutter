import 'package:dio/dio.dart';
import 'package:shopping_flutter/data/models/product_model.dart';
import 'package:shopping_flutter/data/repositories/api/api.dart';

class ProductReposoitories {
  API api = API();

  Future<List<ProductModel>> fetchProducts() async {
    try {
      Response response = await api.sendRequest.get("product/");
      List<dynamic> productsMap = response.data["data"];
      return productsMap
          .map((productMap) => ProductModel.fromJson(productMap))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<ProductModel>> fetchSingleProductById() async {
     var queryParameters = {
      'productId': "64f1b92548265a210f61917f",
    };
    try {
      Response response = await api.sendRequest.get("product/productById",   queryParameters: queryParameters);
      List<dynamic> productsMap = response.data["data"];
      return productsMap
          .map((productMap) => ProductModel.fromJson(productMap))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

}
