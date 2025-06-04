import 'package:flutter/material.dart';
import '../models/cart_request.dart';
import '../services/api_service.dart';

class SendCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void enviarCarrito() async {
      try {
        final cart = CartRequest(
          userId: 1,
          date: DateTime.now().toIso8601String(),
          products: [
            CartProduct(productId: 1, quantity: 2),
            CartProduct(productId: 2, quantity: 1),
          ],
        );

        await ApiService.sendCart(cart);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Carrito enviado exitosamente")));
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error al enviar carrito")));
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Enviar Carrito")),
      body: Center(
        child: ElevatedButton(
          onPressed: enviarCarrito,
          child: Text("Enviar carrito simulado"),
        ),
      ),
    );
  }
}
