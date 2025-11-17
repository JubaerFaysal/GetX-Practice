import 'package:get/get.dart';
import 'package:getx_practice/Module/Products/Model/product_model.dart';

class ProductController extends GetxController{

  var product=<ProductModel>[].obs;

  @override
  void onInit() {
    product.addAll([
      ProductModel(name: "Chips", price: 10),
      ProductModel(name: "Milk", price: 200),
      ProductModel(name: "Chocolate", price: 50)
    ]);
    super.onInit();
  }
}