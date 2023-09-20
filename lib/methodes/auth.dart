import 'package:localstorage/localstorage.dart';
// ignore: camel_case_types
class  auth {
  final storage = LocalStorage('data');
  late String cookies;

  // Storing data
    void storeData(String key, String value) {
    Map<String, dynamic> data = storage.getItem('data') ?? {};
    data[key] = value;
    storage.setItem('data', data);
  }

// Retrieving data
  String? getData(String key) {
    Map<String, dynamic> data = storage.getItem('data') ?? {};
    return data[key];
  }

// Removing data
  void removeData(String key) {
    Map<String, dynamic> data = storage.getItem('data') ?? {};
    data.remove(key);
    storage.setItem('data', data);
  }
}


class Cookievalue {
 
  final String token;

  const Cookievalue({
    required this.token,
  });

  factory Cookievalue.fromJson(Map<String, dynamic> json) {
    return Cookievalue(
      token: json['token'],
    );
  }
}