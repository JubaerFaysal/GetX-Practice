import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Module/Products/Controller/product_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {

    ProductController productController=Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(onPressed: ()=>Get.toNamed('/cart-view'), icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Obx((){
        return ListView.builder(
            itemCount: productController.product.length,
            itemBuilder: (context,index) {
              final product=productController.product[index];
           return ListTile(
             title: Text(product.name),
             subtitle: Text('${product.price}'),
             onTap: (){
               Get.toNamed('/product-details',arguments: product);
             },
           );
        }
        );
      }),
    );
  }
}
