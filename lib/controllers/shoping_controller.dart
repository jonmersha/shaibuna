import 'package:get/get.dart';
import 'package:shaibunna/common.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:shaibunna/models/product_model.dart';

class ShoppingController extends GetxController {
  var isLoading = false.obs;
 // var products=<Products>[].obs;
  ProductModel? productModel;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }


  void fetchProducts() async {
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          baseUrl)!);
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
       // print(result);
        productModel = ProductModel.fromJson(result);
     // print(products);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }


    // products.value = productResult;
  }
}
