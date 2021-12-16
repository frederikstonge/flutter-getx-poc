import 'package:get/get.dart';

import '../pages/cart/cart_binding.dart';
import '../pages/cart/cart_view.dart';
import '../pages/news/news_binding.dart';
import '../pages/news/news_view.dart';
import '../pages/search/search_binding.dart';
import '../pages/search/search_view.dart';
import '../pages/home/home_binding.dart';
import '../pages/home/home_view.dart';
import '../layouts/root/root_binding.dart';
import '../layouts/root/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          preventDuplicates: true,
          name: _Paths.HOME,
          page: () => const HomeView(),
          bindings: [
            HomeBinding(),
          ],
          title: null,
          children: [
            GetPage(
              preventDuplicates: true,
              name: _Paths.CART,
              page: () => const CartView(),
              bindings: [
                CartBinding(),
              ],
              title: null,
            ),
            GetPage(
              preventDuplicates: true,
              name: _Paths.NEWS,
              page: () => const NewsView(),
              bindings: [
                NewsBinding(),
              ],
              title: null,
            ),
            GetPage(
              preventDuplicates: true,
              name: _Paths.SEARCH,
              page: () => const SearchView(),
              bindings: [
                SearchBinding(),
              ],
              title: null,
            )
          ],
        ),
      ],
    ),
  ];
}
