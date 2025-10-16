import 'model.dart';

class Order {
  final int id;
  final List<OrderItem> items;
  final DeliveryMethod deliveryMethod;
  final Address? deliveryAddress;
  final double deliveryFee;

  Order({
    required this.id,
    required this.items,
    required this.deliveryMethod,
    this.deliveryAddress,
    double? deliveryFee,
  }) : deliveryFee =
           deliveryFee ??
           (deliveryMethod == DeliveryMethod.DELIVERED ? 5.0 : 0.0) {
    if (items.isEmpty) {
      throw ArgumentError('Order must contain at least one item.');
    }
    if (deliveryMethod == DeliveryMethod.DELIVERED && deliveryAddress == null) {
      throw ArgumentError('Delivery address required for DELIVERED orders.');
    }
  }

  double computeTotal() {
    double itemsTotal = 0.0;
    for (var item in items) {
      itemsTotal += item.subtotal;
    }
    return itemsTotal + deliveryFee;
  }

  @override
  String toString() {
    String result = 'Order #$id\n';
    for (var it in items) {
      result += '  - ${it.toString()}\n';
    }
    result += 'Delivery: ${deliveryMethod.toString().split(".").last}\n';
    if (deliveryMethod == DeliveryMethod.DELIVERED) {
      result += 'Address: $deliveryAddress\n';
      result += 'Delivery fee: \$${deliveryFee.toStringAsFixed(2)}\n';
    }
    result += 'Total: \$${computeTotal().toStringAsFixed(2)}\n';
    return result;
  }
}
