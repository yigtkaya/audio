class CartItem {
  final String id;
  final String name;
  final String photo;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.photo,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      photo: photo,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}
