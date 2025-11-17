import 'package:get/get.dart';
import 'package:getx_practice/Module/Products/Model/product_model.dart';

class CartController extends GetxController{
  var cartItem=<ProductModel>[].obs;
  var totalPrice=0.0.obs;

  void addToCart(ProductModel product){
    cartItem.add(product);
    calculateTotal();
  }

  void removeFromCart(ProductModel product){
    cartItem.remove(product);
    calculateTotal();
  }

  void calculateTotal(){
    totalPrice.value=cartItem.fold(0, (sum,item)=>sum+item.price);
  }
}