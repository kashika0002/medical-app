class Order {
  final String id;
  final String userId;
  final String restaurantId;
  final String restaurantName;
  final List<OrderItem> items;
  final double totalAmount;
  final String status;
  final DateTime createdAt;
  final String deliveryAddress;

  Order({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.restaurantName,
    required this.items,
    required this.totalAmount,
    required this.status,
    required this.createdAt,
    required this.deliveryAddress,
  });

  factory Order.fromFirestore(Map<String, dynamic> data, String id) {
    return Order(
      id: id,
      userId: data['userId'] ?? '',
      restaurantId: data['restaurantId'] ?? '',
      restaurantName: data['restaurantName'] ?? '',
      items: (data['items'] as List<dynamic>?)
              ?.map((item) => OrderItem.fromMap(item as Map<String, dynamic>))
              .toList() ??
          [],
      totalAmount: (data['totalAmount'] ?? 0.0).toDouble(),
      status: data['status'] ?? 'pending',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      deliveryAddress: data['deliveryAddress'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'items': items.map((item) => item.toMap()).toList(),
      'totalAmount': totalAmount,
      'status': status,
      'createdAt': Timestamp.fromDate(createdAt),
      'deliveryAddress': deliveryAddress,
    };
  }
}

class OrderItem {
  final String menuItemId;
  final String name;
  final double price;
  final int quantity;

  OrderItem({
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      menuItemId: map['menuItemId'] ?? '',
      name: map['name'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      quantity: map['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'menuItemId': menuItemId,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}
