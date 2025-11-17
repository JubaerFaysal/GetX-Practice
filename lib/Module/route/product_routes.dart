import 'package:get/get.dart';
import 'package:getx_practice/Module/Products/View/cart_view.dart';
import 'package:getx_practice/Module/Products/View/product_details_view.dart';
import 'package:getx_practice/Module/Products/View/product_view.dart';

class ProductRoutes {
  static final route = [
    GetPage(name: '/product-view', page: () => ProductView()),
    GetPage(name: '/product-details', page: () => ProductDetailsView()),
    GetPage(name: '/cart-view', page: ()=>CartView())
  ];
}
