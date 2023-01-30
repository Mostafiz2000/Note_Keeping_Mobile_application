import 'package:flutter/material.dart';
import '/controller/product_controller.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  Map productData = {"pname": "", "pprice": "", "pdetails": ""};

  ProductController controller = Get.put(ProductController());

  addProduct() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      controller.addProduct(productData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product screen'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Product Name'),
                ),
                onSaved: (value) {
                  productData['pname'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product name required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text('Product Price'),
                ),
                onSaved: (value) {
                  productData['pprice'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product price required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Product Description'),
                ),
                onSaved: (value) {
                  productData['pdetails'] = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product Description required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: addProduct, child: const Text("SUBMIT"))
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        ),
      ),
    );
  }
}
