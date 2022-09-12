import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:virtual_wearing_app_flutter/features/products/data/models/product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<Product>> getAll() async {
    final String response =
        await rootBundle.loadString('assets/jsons/products_json.json');
    final data = await json.decode(response);

    List<Product> products = [];

    for (int i = 0; i < data.length; i++) {
      print(data[i]['name']);
      products.add(Product(
        id: data[i]['id'],
        name: data[i]['name'],
        price: data[i]['price'].toString(),
        description: data[i]['description'],
        image: data[i]['image'],
        category: data[i]['category'],
      ));
    }

    print(data.runtimeType);

    return products;
  }

  Future<String> wear(String human, String dress) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://143.244.171.203:8080/virtual_wearing'));
    request.files.add(await http.MultipartFile.fromPath('human', human));
    request.files.add(http.MultipartFile.fromBytes(
        'dress', (await rootBundle.load(dress)).buffer.asUint8List(),
        filename: 'dress.jpg'));

    http.StreamedResponse response = await request.send();

    print("resposnse get");

    var res = await response.stream.bytesToString().then((value) {
      return jsonDecode(value);
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(res);
      return res["result_image"];
    } else {
      print(res["error"]);
      throw Exception(res['message']);
    }
  }
}
