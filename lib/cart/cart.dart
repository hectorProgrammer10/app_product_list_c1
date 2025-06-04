import '../models/cart_request.dart';

class CartController {
  static final List<CartProduct> _items = [];

  static void addProduct(int productId) {
    final index = _items.indexWhere((p) => p.productId == productId);
    if (index != -1) {
      _items[index] = CartProduct(
        productId: productId,
        quantity: _items[index].quantity + 1,
      );
    } else {
      _items.add(CartProduct(productId: productId, quantity: 1));
    }
  }

  static List<CartProduct> get items => _items;

  static void clear() => _items.clear();
}
