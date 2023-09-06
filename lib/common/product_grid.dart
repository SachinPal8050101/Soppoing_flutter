import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_flutter/common/product_container.dart';
import 'package:shopping_flutter/dataSchemas/product_response.dart';

class ProductGridState extends StatefulWidget {
  final dynamic product;
  const ProductGridState({super.key, this.product});



  @override
  State<ProductGridState> createState() => _ProductGrid();
}

class _ProductGrid extends  State<ProductGridState> {


 List<Product> parseProducts(String responseBody) {

  final Map<String, dynamic> data = json.decode(responseBody);

  if (data != null) {
    final List<dynamic> dataList = data['data'];
    return dataList.map<Product>((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Invalid response format');
  }
}



Future<List<Product>> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.3.212:5002/product/'));

    if (response.statusCode == 200) {
      final List<Product> products = parseProducts(response.body);
      return products;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final product = snapshot.data?[index];
              if(product != null){

              return ProductContainer(product: product,);
              }
              return null;
            },
          );
        }
      },
    );
  }
}
