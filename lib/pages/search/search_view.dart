import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/cart_service.dart';
import 'search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Product"),
          trailing: const Icon(Icons.shopping_cart),
          onTap: () => CartService.to.addItem("sieq115"),
        ),
      ],
    );
  }
}
