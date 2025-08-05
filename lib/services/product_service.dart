import 'dart:convert';
import 'package:donut_app_2c_flores/models/product.dart';
import 'package:donut_app_2c_flores/utils/config.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  static const String baseUrl = Config.baseUrl;
  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }

  static Future<List<Product>> getAllProducts() async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/products"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Error al cargar productos");
    }
  }

  static Future<List<Product>> getProductsByCategory(int categoryId) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/products/category/$categoryId"),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Product.fromJson(item)).toList();
    } else {
      throw Exception("Error al cargar productos por categoria");
    }
  }
}
