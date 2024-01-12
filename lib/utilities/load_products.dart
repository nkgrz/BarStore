import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bar_store/models/product.dart';

const url = 'https://2f48-77-45-129-5.ngrok-free.app/products';

Future<List<Product>> loadProducts() async {
  final response = await http.get(Uri.parse(url));
  final List<dynamic> jsonData = json.decode(response.body);
  return jsonData.map((json) => Product.fromJson(json)).toList();
}