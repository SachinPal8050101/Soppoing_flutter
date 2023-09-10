import 'package:dio/dio.dart';
import 'package:shopping_flutter/data/repositories/api/api.dart';
import 'package:shopping_flutter/data/models/customer_model.dart';

class CustomerReposoitories {
  API api = API();

  Future<CustomerModal> getCustomerProfile() async {
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZjFiYzBjNTFkOTkyNmMzMWYzZmIxZiIsImVtYWlsIjoic2FjaGluLmt1bWFyMUBzZGFmZm9kaWxzdy5jb20iLCJpYXQiOjE2OTQzNTY5MDIsImV4cCI6MTY5NDM2MDUwMn0.AgK-u4NVAYbYXhsRhFk0DyxOfXZP6WvFtJkczaD1iiA';
    try {
      Response response = await api.sendRequest.get(
        "customer/getProfile",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then parse the JSON.
        try {
          return CustomerModal.fromJson(response.data);
        } catch (e) {
          return CustomerModal.fromJson(response.data);
        }
      } else {
        // If the server response is not a 200 OK, throw an exception.
        throw Exception('Failed to load customer profile');
      }
    } catch (ex) {
      rethrow;
    }
  }
}
