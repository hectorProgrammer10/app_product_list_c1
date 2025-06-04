import 'package:flutter/material.dart';
import '../cart/cart.dart';
import '../services/api_service.dart';
import '../models/cart_request.dart';

class ApiCartScreen extends StatelessWidget {
  const ApiCartScreen({super.key});

  void enviarCarrito(BuildContext context) async {
    try {
      final carrito = CartRequest(
        userId: 1,
        date: DateTime.now().toIso8601String(),
        products: CartController.items,
      );

      await ApiService.sendCart(carrito);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Carrito enviado exitosamente')));

      CartController.clear();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al enviar carrito')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = CartController.items;

    return Scaffold(
      appBar: AppBar(title: Text('Carrito')),
      body:
          items.isEmpty
              ? Center(child: Text('El carrito está vacío'))
              : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return ListTile(
                          title: Text('Producto ID: ${item.productId}'),
                          subtitle: Text('Cantidad: ${item.quantity}'),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton.icon(
                      onPressed: () => enviarCarrito(context),
                      icon: Icon(Icons.send),
                      label: Text('Enviar carrito'),
                    ),
                  ),
                ],
              ),
    );
  }
}
