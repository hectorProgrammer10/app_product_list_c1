import 'package:flutter/material.dart';
import 'package:product_list_app/screens/api_cart_screen.dart';
import '../models/api_product.dart';
import '../services/api_service.dart';
import 'api_product_detail_screen.dart';

class ApiProductListScreen extends StatefulWidget {
  @override
  _ApiProductListScreenState createState() => _ApiProductListScreenState();
}

class _ApiProductListScreenState extends State<ApiProductListScreen> {
  late Future<List<ApiProduct>> _products;

  @override
  void initState() {
    super.initState();
    _products = ApiService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos desde API'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ApiCartScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<ApiProduct>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(product.title),
                    subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                                  ApiProductDetailScreen(productId: product.id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
