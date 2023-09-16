import 'package:dio/dio.dart';
import 'package:shopping_flutter/utils/secure_storage.dart';
import 'package:shopping_flutter/newArchitecture/data/repositories/api/api.dart';
import 'package:shopping_flutter/newArchitecture/data/models/customer_model.dart';
import 'package:shopping_flutter/newArchitecture/data/models/login_signup_model.dart';

class CustomerReposoitories {
  API api = API();

  Future<CustomerModal> getCustomerProfile(id) async {

Future<String?> getAccessToken() async {
      String? val = await SecureStorage.getKeyByName('token');
      return val;
    }

    var token = await getAccessToken();

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

  Future<LogInSignUpModal> logInCustomer(String email, String password) async {
    var data = {'email': email, 'password': password};

    try {
      Response response = await api.sendRequest.post(
        "customer/signin",
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        try {
          return LogInSignUpModal.fromJson(response.data);
        } catch (e) {
          return LogInSignUpModal.fromJson(response.data);
        }
      } else {
        throw Exception('Failed to load customer profile');
      }
    } catch (ex) {
      throw Exception('Can not log in');
    }
  }

  Future<void> addToWishList(String? productId) async {
    var data = {'productId': productId};
    Future<String?> getAccessToken() async {
      String? val = await SecureStorage.getKeyByName('token');
      return val;
    }

    var token = await getAccessToken();

    try {
      Response response = await api.sendRequest.put(
        "product/add_remove_wishlist",
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to load customer profile');
      }
    } catch (ex) {
      throw Exception('Can not log in');
    }
  }
}