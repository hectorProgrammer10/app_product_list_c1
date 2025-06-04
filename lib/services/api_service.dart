import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_product.dart';
import '../models/cart_request.dart';

class ApiService {
  static const baseUrl = 'https://fakestoreapi.com';

  static Future<List<ApiProduct>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => ApiProduct.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar productos');
    }
  }

  static Future<ApiProduct> fetchProductDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));

    if (response.statusCode == 200) {
      return ApiProduct.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al cargar detalle del producto');
    }
  }

  static Future<void> sendCart(CartRequest cart) async {
    final response = await http.post(
      Uri.parse('$baseUrl/carts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(cart.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error al enviar carrito');
    }
  }

  static Future<Map<String, dynamic>> fetchCart(int cartId) async {
    final response = await http.get(Uri.parse('$baseUrl/carts/$cartId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener carrito');
    }
  }
}
