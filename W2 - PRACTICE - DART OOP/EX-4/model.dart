enum DeliveryMethod { DELIVERED, PICKUP }

class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() =>
      'Product(id: $id, name: $name, price: \$${price.toStringAsFixed(2)})';
}

class OrderItem {
  final Product product;
  int quantity;

  OrderItem({required this.product, required this.quantity}) {
    if (quantity <= 0) {
      throw ArgumentError('Quantity must be greater than 0');
    }
  }

  double get subtotal => product.price * quantity;

  @override
  String toString() =>
      '${product.name} x $quantity = \$${subtotal.toStringAsFixed(2)}';
}

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address({required this.street, required this.city, required this.zipCode});

  @override
  String toString() => '$street, $city, $zipCode';
}
