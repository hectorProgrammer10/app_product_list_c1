class CartRequest {
  final int userId;
  final String date;
  final List<CartProduct> products;

  CartRequest({
    required this.userId,
    required this.date,
    required this.products,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "date": date,
      "products": products.map((p) => p.toJson()).toList(),
    };
  }
}

class CartProduct {
  final int productId;
  final int quantity;

  CartProduct({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {"productId": productId, "quantity": quantity};
  }
}
