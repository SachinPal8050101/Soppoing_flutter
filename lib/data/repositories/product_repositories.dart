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
      throw ex;
    }
  }

}
