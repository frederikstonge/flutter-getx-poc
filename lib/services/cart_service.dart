import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart_item.dart';
import '../models/line_item.dart';

class CartService extends GetxService {
  static CartService get to => Get.find();

  final lineItems = <LineItem>[].obs;

  addItem(String productId) async {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
            width: 50,
            child: Divider(
              thickness: 4,
            ),
          ),
          CartItem(
            productId,
            (int quantity) {
              Get.back();
              lineItems.add(LineItem(productId, quantity));
              Get.rawSnackbar(
                  message: "$productId with quantity $quantity added to cart");
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
    );
  }

  editItem(LineItem lineItem) async {
    if (Get.isSnackbarOpen) {
      Get.back();
    }

    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
            width: 50,
            child: Divider(
              thickness: 4,
            ),
          ),
          CartItem(
            lineItem.productId,
            (int quantity) {
              Get.back();
              lineItem.quantity = quantity;
              lineItems.refresh();
              Get.rawSnackbar(
                  message:
                      "${lineItem.productId} with quantity ${lineItem.quantity} updated");
            },
            editMode: true,
            quantity: lineItem.quantity,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(12),
          topEnd: Radius.circular(12),
        ),
      ),
    );
  }
}
