import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decode/jwt_decode.dart';
import 'package:storeapp/methodes/auth.dart';
import 'package:storeapp/models/carts.dart';
import 'package:storeapp/models/product.dart';
import 'package:storeapp/pages/splash.dart';

import '../models/user.dart';

// ignore: camel_case_types
class test3 {
  late product p;
  late int quantity;
  test3({
    required this.p,
    required this.quantity,
  });
  @override
  String toString() {
    return 'Product: ${p.toString()}, Quantity: $quantity';
  }
}

class ApiService {
  int? getid(String jwtToken) {
    Map<String, dynamic> decodedToken = Jwt.parseJwt(jwtToken);
    return decodedToken['sub'];
  }

  Future<dynamic> login(String username, String password) async {
    var url = Uri.https('fakestoreapi.com', '/auth/login');
    try {
      var response = await http.post(url,
          body: {"username": username.trim(), "password": password.trim()});
      if (response.statusCode == 200) {
        String jwtToken = Cookievalue.fromJson(jsonDecode(response.body)).token;
        Map<String, dynamic> decodedToken =  Jwt.parseJwt(jwtToken);

        return {
          "statuscode": response.statusCode,
          "id": decodedToken['sub'],
          "token": jwtToken
        };
      } else {
        return {
          "statuscode": response.statusCode,
          "id": 0,
          "error": response.body
        };
      }
    } catch (e) {
      return {
        "statuscode": 404,
        "id": 0,
        "error": "Something is Wrong i can feel it"
      };
    }
  }

  Future<dynamic> signup(String username, String password) async {
    var url = Uri.https('fakestoreapi.com', '/users');
    var response = await http.post(url, body: {
      "email": "morrison@gmail.com",
      "username": "amor_2314",
      "password": "M83r5^_",
    });
    if (response.statusCode == 200) {
    } else {}
  }

  Future<List<dynamic>> geCategories() async {
    try {
      var url = Uri.https('fakestoreapi.com', '/products/categories');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // ignore: non_constant_identifier_names
  Future<product> get_pudactbyid(int id) async {
    try {
      var url = Uri.https('fakestoreapi.com', '/products/$id');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return product.fromJson(jsonDecode(response.body));
      } else {
        return product();
      }
    } catch (e) {
      return product();
    }
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> get_carts() async {
    int? id = getid(token.cookies.toString());
    try {
      var url = Uri.https('fakestoreapi.com', '/carts/user/$id');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<List<test3>> finaldata = [];
        List<dynamic> data = jsonDecode(response.body);

        List<carts> c = data.map((e) => carts.fromJson(e)).toList();

        for (int i = 0; i < c.length; i++) {
          finaldata.add([]);
          for (int j = 0; j < c[i].products!.length; j++) {
            var pp = await get_pudactbyid(c[i].products![j].productId!);
            finaldata[i].add(test3(p: pp, quantity: 1));
          }
        }
        return finaldata;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<dynamic>> getProducts() async {
    var url = Uri.https('fakestoreapi.com', '/products');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> products = jsonDecode(response.body);
        return products.map((item) => product.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }

  Future<List<dynamic>> getProductsBYcategorie(String categorie) async {
    var url = Uri.https('fakestoreapi.com', '/products/category/$categorie');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> products = jsonDecode(response.body);
      return products.map((item) => product.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<user?> getuser(int id) async {
    try {
      var url = Uri.https('fakestoreapi.com', '/users/$id');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        user myuser = user();
        myuser = user.fromJson(jsonDecode(response.body));
        return myuser;
      } else {
        return user();
      }
    } catch (e) {
      throw Exception('Failed to load user');
    }
  }

  // ignore: non_constant_identifier_names
  Future<String?> get_username(String jwtToken) async {
    try {
      Map<String, dynamic> decodedToken = Jwt.parseJwt(jwtToken);
      var url = Uri.https('fakestoreapi.com', '/users/${decodedToken['sub']}');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        user myuser = user();
        myuser =  user.fromJson(jsonDecode(response.body));
        return myuser.username;
      } else {
        return "";
      }
    } catch (e) {
      return "";
    }
  }

  ///////////////////map//////////////////////////
  
}
