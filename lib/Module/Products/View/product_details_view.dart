import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Module/Products/Controller/cart_controller.dart';
import 'package:getx_practice/Module/Products/Model/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController=Get.find<CartController>();
    ProductModel product=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Product Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
            Text("${product.price}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.purple)),
            TextButton(onPressed: (){
              cartController.addToCart(product);
              Get.snackbar("Added to Cart", "${product.name} is added to cart");
            }, child: Text("Add to Cart"))
          ],
        ),
      ),
    );
  }
}
