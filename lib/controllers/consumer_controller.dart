import 'package:get/get.dart';
import 'package:shaibunna/common.dart';
import 'package:http/http.dart' as http;
import 'package:shaibunna/models/consumer_model.dart';

import 'dart:convert';

class ConsumerController extends GetxController {
   var isLoading = false.obs;
  ConsumerResponse? consumerResponse;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
  void fetchProducts() async {
     bool isFetched=false;
    try {
      isLoading(true);
      http.Response response = await http.get(Uri.tryParse(
          baseUrl+"/consumers/get")!);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
         print(result);
        isFetched=true;
        consumerResponse = ConsumerResponse.fromJson(result);
        print(consumerResponse);
      } else {
        print('error fetching data');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      if(isFetched)
      isLoading(false);
    }

  }
}
