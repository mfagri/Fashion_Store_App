// ignore: camel_case_types
class carts {
  int? id;
  int? userId;
  String? date;
  List<Products>? products;
  int? iV;

  carts({this.id, this.userId, this.date, this.products, this.iV});

  carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    date = json['date'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['date'] = date;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Products {
  int? productId;
  int? quantity;

  Products({this.productId, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['quantity'] = quantity;
    return data;
  }
}