import 'dart:convert';

import '/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  static const apiBaseUrl = 'http://192.168.0.102:4000/api/';
  // static const apiBaseUrl = '';

  List<ProductModel> allProduct = [];

  Future<void> addProduct(Map productData) async {
    print("add product data $productData");

    // var url = Uri.parse(apiBaseUrl + 'addproduct');

    // try {
    //   final response = await http.post(url, body: productData);
    //   if (response.statusCode == 200) {
    //     print(json.decode(response.body));

    //     var r = json.decode(response.body);
    //     print(r['code']);
    //     Get.back();
    //   }
    // } catch (error) {
    //   print(error);
    // }
  }

  getProduct() async {
    allProduct = [];
    var url = Uri.parse(apiBaseUrl + 'getProduct');
    List<ProductModel> helperList = [];
    try {
      final response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        var productResponse = json.decode(response.body);

        productResponse['productData'].forEach((result) => {
              helperList.add(ProductModel(
                  pname: result['pname'],
                  pprice: result['pprice'],
                  pdetails: result['pdetails']))
            });
      }
      allProduct.addAll(helperList);
      update();
    } catch (error) {
      print(error);
    }
  }
}
