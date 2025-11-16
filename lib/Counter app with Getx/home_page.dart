import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Counter%20app%20with%20Getx/counter_controller.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController c = Get.put(CounterController());
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: Center(
        child: Obx(
          () => Text(
            'Count: ${c.count}',
            style: TextStyle(
              fontSize: 30,
              color: c.count.value > 10 ? Colors.red : Colors.deepPurple,
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: c.decrement,
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 10),
          FloatingActionButton(onPressed: c.increment, child: Icon(Icons.add)),
          SizedBox(width: 10),
          TextButton(
            onPressed: c.reset,
            child: Text("Reset", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
