import 'package:flutter/material.dart';
import '/view/addproduct_screen.dart';
import '/view/viewproduct_screen.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Flutter Nodejs Example'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const AddProductScreen());
              },
              child: const Text("Add Product"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ViewProductScreen());
              },
              child: const Text("View Your Product"),
            )
          ],
        ));
  }
}
