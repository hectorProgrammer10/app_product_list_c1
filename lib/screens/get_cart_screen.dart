import 'package:flutter/material.dart';
import '../services/api_service.dart';

class GetCartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carrito desde API")),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService.fetchCart(1),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            final cart = snapshot.data!;
            final List<dynamic> products = cart['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return ListTile(
                  title: Text("ID Producto: ${item['productId']}"),
                  subtitle: Text("Cantidad: ${item['quantity']}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
