import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/cart_service.dart';
import '../../routes/app_pages.dart';
import 'home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: getRouteByIndex(controller.bottomNavBarIndex.value),
            key: Get.nestedKey(Routes.HOME),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.bottomNavBarIndex.value,
            onTap: (value) {
              controller.updateIndex(value);
              delegate.toNamed(getRouteByIndex(value));
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'news',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: Badge(
                  child: const Icon(Icons.shopping_cart),
                  position: BadgePosition.topEnd(top: -12, end: -12),
                  badgeColor: Colors.blueGrey,
                  badgeContent: Obx(
                    () => Text(
                      CartService.to.lineItems.length.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                label: 'cart',
              ),
            ],
          ),
        );
      },
    );
  }

  String getRouteByIndex(int index) {
    switch (index) {
      case 0:
        return Routes.NEWS;
      case 1:
        return Routes.SEARCH;
      case 2:
        return Routes.CART;
      default:
        return "";
    }
  }
}
