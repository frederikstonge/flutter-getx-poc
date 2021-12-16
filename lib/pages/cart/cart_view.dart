import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/cart_service.dart';
import 'cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView(
        children: CartService.to.lineItems
            .map((i) => ListTile(
                  title: Text(i.productId.toString()),
                  trailing: Text(i.quantity.toString()),
                  onTap: () => CartService.to.editItem(i),
                ))
            .toList(),
      ),
    );
  }
}
