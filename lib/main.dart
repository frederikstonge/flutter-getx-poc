import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/cart_service.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp.router(
      title: "getx",
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        Get.put(CartService(), permanent: true);
      }),
    ),
  );
}
