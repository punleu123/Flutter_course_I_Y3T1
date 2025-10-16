import 'model.dart';
import 'order.dart';
import 'data.dart';

void main() {
  final data = DataSource();

  // Sample products
  var phone = Product(id: 1, name: 'Smartphone', price: 299.99);
  var caseProduct = Product(id: 2, name: 'Phone Case', price: 19.99);
  var charger = Product(id: 3, name: 'USB-C Charger', price: 24.50);

  // Store products
  data.addProduct(phone);
  data.addProduct(caseProduct);
  data.addProduct(charger);

  // Create order items
  var item1 = OrderItem(product: phone, quantity: 1);
  var item2 = OrderItem(product: caseProduct, quantity: 2);
  var item3 = OrderItem(product: charger, quantity: 1);

  // Pickup order
  var pickupOrder = Order(
    id: 1001,
    items: [item1, item2],
    deliveryMethod: DeliveryMethod.PICKUP,
  );
  data.saveOrder(pickupOrder);

  // Delivered order
  var address = Address(
    street: '12 Market St',
    city: 'Phnom Penh',
    zipCode: '12000',
  );
  var deliveryOrder = Order(
    id: 1002,
    items: [item1, item3],
    deliveryMethod: DeliveryMethod.DELIVERED,
    deliveryAddress: address,
  );
  data.saveOrder(deliveryOrder);

  print('--- Pickup Order ---');
  print(pickupOrder);

  print('--- Delivered Order ---');
  print(deliveryOrder);

  // Custom delivery fee order
  var order3 = Order(
    id: 1003,
    items: [OrderItem(product: caseProduct, quantity: 5)],
    deliveryMethod: DeliveryMethod.DELIVERED,
    deliveryAddress: Address(
      street: '99 River Rd',
      city: 'Siem Reap',
      zipCode: '17000',
    ),
    deliveryFee: 8.0,
  );
  data.saveOrder(order3);

  print('--- Order 3 ---');
  print(order3);
}
