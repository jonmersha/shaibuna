import 'package:shaibunna/models/product.dart';
class ProductModel {
  List<Products>? products;
  ProductModel({this.products});
  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
