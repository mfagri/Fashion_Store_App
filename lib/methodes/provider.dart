import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:storeapp/pages/splash.dart';
import '../api/api_service.dart';
import '../models/user.dart';
// ignore: depend_on_referenced_packages
import 'package:latlong2/latlong.dart';
import '../tools/validator.dart';

class Mangment extends ChangeNotifier {
  var locationLatLng = const LatLng(0, 0);

  bool valuesecond = false;
  bool login = false;
  final emailcontroler = TextEditingController();
  final passwordcontroler = TextEditingController();
  final usernamecontroler = TextEditingController();

  String emailerror = '';
  String infousername = '';
  String usernameerror = '';
  String passworderror = '';
  // ignore: non_constant_identifier_names
  List<dynamic> Categories = [];
  // ignore: non_constant_identifier_names
  List<dynamic> Products = [];
  // ignore: non_constant_identifier_names
  dynamic Carts;

  user myuser = user();
  bool emailstatu = false;
  bool usernamestatu = false;
  bool passwordstatu = false;

  bool get valuesecon => valuesecond;
  // ignore: non_constant_identifier_names
  TextEditingController get Emailcontroler => emailcontroler;
  // ignore: non_constant_identifier_names
  TextEditingController get Passwordcontroler => passwordcontroler;
  // ignore: non_constant_identifier_names
  TextEditingController get Usernamecontroler => usernamecontroler;
  // ignore: non_constant_identifier_names
  String get Emailerror => emailerror;
  // ignore: non_constant_identifier_names
  String get Usernameerror => usernameerror;
  // ignore: non_constant_identifier_names
  String get Passlerror => passworderror;
  // ignore: non_constant_identifier_names
  String get Infousername => infousername;
  dynamic get carts => Carts;
  List<dynamic> get categorie => Categories;
  List<dynamic> get products => Products;
  // ignore: non_constant_identifier_names
  bool get Emailstatu => emailstatu;
  // ignore: non_constant_identifier_names
  bool get Passstatu => passwordstatu;
  // ignore: non_constant_identifier_names
  bool get Usernamestatu => usernamestatu;
  bool get islogin => login;
  get location => locationLatLng;
  // ignore: non_constant_identifier_names
  user get Myuser => myuser;

  void editvaluesecond(bool? value) {
    valuesecond = value!;
    notifyListeners();
  }

  void setuser(user? datauser) async {
    myuser = datauser!;
    notifyListeners();
  }

  void info() async {
    try {
      getCurrentLocation();
      int? id = ApiService().getid(token.cookies.toString());
      myuser = (await ApiService().getuser(id!))!;
    } catch (e) {
      throw Exception('Failed to load user data');
    }
  }

  void validatefield() {
    var result = validatePassword(passwordcontroler.text);
    var result1 = validateUsername(usernamecontroler.text);

    if (!result.isValid || !result1.isValid) {
      if (!result.isValid) {
        passwordstatu = true;
        passworderror = result.error;
      } else {
        passwordstatu = true;
      }
      if (!result1.isValid) {
        usernamestatu = true;
        usernameerror = result1.error;
      } else {
        usernamestatu = false;
      }
    } else {
      usernamestatu = false;
      passwordstatu = false;
      login = true;
    }
    notifyListeners();
  }

  void validatefield2() {
    var result = validatePassword(passwordcontroler.text);
    var result1 = validateUsername(usernamecontroler.text);
    var result3 = validateEmail(emailcontroler.text);

    if (!result.isValid || !result1.isValid) {
      if (!result.isValid) {
        passwordstatu = true;
        passworderror = result.error;
      } else {
        passwordstatu = true;
      }
      if (!result1.isValid) {
        usernamestatu = true;
        usernameerror = result1.error;
      } else {
        usernamestatu = false;
      }
      if (!result3.isValid) {
        emailstatu = true;
        emailerror = result3.error;
      } else {
        emailstatu = false;
      }
    } else {
      usernamestatu = false;
      passwordstatu = false;
      emailstatu = false;
      login = true;
    }
    notifyListeners();
  }

  List<String> favorites = [];

  // ignore: non_constant_identifier_names
  void add_tofsvorit(String item) {
    //add new item to the list
    favorites.add(item);
    //remove old list from localstorage
    token.removeData('favorite');
    //save new list to local storage
    token.storeData('favorite', favorites.toString());
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void remove_fromfavorit(String item) {
    favorites.remove(item);
    //remove old list from localstorage
    token.removeData('favorite');
    //save new list to local storage
    token.storeData('favorite', favorites.toString());
    notifyListeners();
  }

  void usernameget() async {
    String name = (await ApiService().get_username(token.cookies))!;
    infousername = name;
    notifyListeners();
  }

  void categorieget() async {
    Categories = await ApiService().geCategories();
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void set_list(List<String> list) {
    favorites = list;
    // notifyListeners();
  }

  void cartsget() async {
    Carts = await ApiService().get_carts();
  }

  bool inList(String item) {
    return favorites.contains(item);
  }

  void productget() async {
    try {
      Products = await ApiService().getProducts();
    }
    // ignore: empty_catches
    catch (e) {}
    // notifyListeners();
  }

  ////////////////////////////////////
  Future<void> getCurrentLocation() async {
    GeolocatorPlatform.instance;
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    // print('location permission: [$locationPermission]');
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.requestPermission();
      // Location services are not enabled, request the user to enable it.
      // return;
    }

    // Request permission to access location
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permission denied, handle it accordingly.
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission permanently denied, take appropriate action.
      return;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Extract latitude and longitude
    double latitude = position.latitude;
    double longitude = position.longitude;
    // Now you have the latitude and longitude in 'latitude' and 'longitude' variables.
    locationLatLng = LatLng(latitude, longitude);
  }

  void dipose() {
    //dispose all controler hahahah
    emailcontroler.clear();
    emailcontroler.dispose();
    passwordcontroler.clear();
    passwordcontroler.dispose();
    usernamecontroler.clear();
    usernamecontroler.dispose();
    notifyListeners();
  }

  void getalldata(){
    productget();
    usernameget();
    cartsget();
    categorieget();
    info();
    set_list(favo);
  }
}
