import 'package:get/get.dart';
import 'package:shaibunna/models/product.dart';

class CartController extends GetxController{
  var cartList=<Products>[].obs;
  double get totalPrice=>cartList.fold(0, (sum, item) => sum+item.price!);
  addToCart(Products products){
    print('Added To cart');
    cartList.add(products);
  }
  // int getTotlaProce(){
  //
  //
  // }

}