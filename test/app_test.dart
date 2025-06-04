import 'package:flutter_test/flutter_test.dart';
import 'package:product_list_app/models/api_product.dart';
import 'package:product_list_app/models/cart_request.dart';
import 'package:product_list_app/cart/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('Modelo ApiProduct', () {
    test('fromJson construye correctamente', () {
      final json = {
        "id": 1,
        "title": "Producto de prueba",
        "description": "Descripción",
        "price": 49.99,
        "image": "https://example.com/image.png",
      };

      final product = ApiProduct.fromJson(json);

      expect(product.id, 1);
      expect(product.title, 'Producto de prueba');
      expect(product.description, 'Descripción');
      expect(product.price, 49.99);
      expect(product.image, isA<String>());
    });
  });

  group('Carrito de compras', () {
    setUp(() => CartController.clear());

    test('Se agrega producto correctamente', () {
      CartController.addProduct(1);
      CartController.addProduct(2);
      CartController.addProduct(1);

      final items = CartController.items;

      expect(items.length, 2);
      expect(items.first.productId, 1);
      expect(items.first.quantity, 2);
    });

    test('Se vacía el carrito después del envío', () {
      CartController.addProduct(1);
      expect(CartController.items.isNotEmpty, true);

      // Simular "envío" de carrito
      final cart = CartRequest(
        userId: 1,
        date: DateTime.now().toIso8601String(),
        products: CartController.items,
      );

      expect(cart.products.length, 1);

      CartController.clear();

      expect(CartController.items.isEmpty, true);
    });
  });

  group('SharedPreferences', () {
    test('Guarda y recupera isLoggedIn', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();

      await prefs.setBool('isLoggedIn', true);
      final result = prefs.getBool('isLoggedIn');

      expect(result, isTrue);
    });
  });
}
