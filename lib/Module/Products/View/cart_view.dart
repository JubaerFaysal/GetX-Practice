import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Module/Products/Controller/cart_controller.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController=Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Items"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx((){
              return ListView.builder(
                itemCount: cartController.cartItem.length,
                  itemBuilder: (context,index){
                  var item=cartController.cartItem[index];
                return Card(
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text("${item.price}"),
                    trailing: IconButton(onPressed: ()=>cartController.removeFromCart(item), icon: Icon(Icons.delete)),
                  ),
                );
              });
            }),
          ),
          Obx((){
            return Padding(padding: EdgeInsets.all(24),
            child: Text("Total Price:${cartController.totalPrice.value}"),
            );
          })
        ],
      ),

    );
  }
}
