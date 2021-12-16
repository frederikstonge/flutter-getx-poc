// ignore_for_file: constant_identifier_names, non_constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const CART = HOME + _Paths.CART;
  static const NEWS = HOME + _Paths.NEWS;
  static const SEARCH = HOME + _Paths.SEARCH;
}

abstract class _Paths {
  static const HOME = '/home';
  static const CART = '/cart';
  static const NEWS = '/news';
  static const SEARCH = '/search';
}
