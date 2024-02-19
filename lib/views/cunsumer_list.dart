import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shaibunna/controllers/consumer_controller.dart';

class ConsumerList extends StatelessWidget {
  //const ShoppingPage({super.key});
  final consumerController = Get.put(ConsumerController());
  ConsumerList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetX<ConsumerController>(builder: (controller) {
          return consumerController.isLoading.value
              ? const Center(
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                          strokeWidth: 10, color: Colors.teal)))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount:
                              controller.consumerResponse!.consumers!.length,
                          itemBuilder: (context, index) {
                            return Card(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${controller.consumerResponse!.consumers![index].fullName}'),
                                      Text(
                                          '${controller.consumerResponse!.consumers![index].email}'),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                          }),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
