import 'model.dart';
import 'order.dart';

/// Simple in-memory data store (no JSON)
class DataSource {
  final List<Product> _products = [];
  final List<Order> _orders = [];

  void addProduct(Product product) {
    _products.add(product);
  }

  List<Product> getAllProducts() => List.unmodifiable(_products);

  void saveOrder(Order order) {
    _orders.add(order);
  }

  List<Order> getAllOrders() => List.unmodifiable(_orders);
}
