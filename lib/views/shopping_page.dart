import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shaibunna/controllers/cart_controller.dart';
import 'package:shaibunna/controllers/shoping_controller.dart';

class ShoppingPage extends StatelessWidget {
  //const ShoppingPage({super.key});
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.productModel!.products!.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              cartController.addToCart(
                                  controller.productModel!.products![index]);
                            },
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      'http://192.168.1.7:3000/${controller.productModel!.products![index].productImage}',
                                    ),
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${controller.productModel!.products![index].productName}'),
                                Text(
                                    '${controller.productModel!.products![index].productDescription}'),
                              ],
                            ),
                          ),
                        ],
                      ));
                    });
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total Amount In Cart : ${controller.totalPrice}',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              );
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
