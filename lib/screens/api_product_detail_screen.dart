import 'package:flutter/material.dart';
import 'package:product_list_app/cart/cart.dart';
import '../models/api_product.dart';
import '../services/api_service.dart';

class ApiProductDetailScreen extends StatelessWidget {
  final int productId;

  const ApiProductDetailScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle')),
      body: FutureBuilder<ApiProduct>(
        future: ApiService.fetchProductDetail(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final product = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.network(product.image, height: 200)),
                  SizedBox(height: 20),
                  Text(
                    product.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(product.description),
                  SizedBox(height: 20),
                  Text(
                    'Precio: \$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      CartController.addProduct(product.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.title} agregado al carrito'),
                        ),
                      );
                    },
                    child: Text('Agregar al carrito'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
