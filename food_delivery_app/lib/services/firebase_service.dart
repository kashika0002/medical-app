import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/restaurant.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get all restaurants
  Stream<List<Restaurant>> getRestaurants(String city) {
    return _firestore
        .collection('restaurants')
        .where('city', isEqualTo: city)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Restaurant.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  // Get restaurant by ID
  Future<Restaurant?> getRestaurantById(String id) async {
    try {
      final doc = await _firestore.collection('restaurants').doc(id).get();
      if (doc.exists) {
        return Restaurant.fromFirestore(doc.data()!, doc.id);
      }
      return null;
    } catch (e) {
      print('Error getting restaurant: $e');
      return null;
    }
  }

  // Get menu items for a restaurant
  Stream<List<MenuItem>> getMenuItems(String restaurantId) {
    return _firestore
        .collection('menuItems')
        .where('restaurantId', isEqualTo: restaurantId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MenuItem.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  // Save order
  Future<bool> saveOrder(Order order) async {
    try {
      await _firestore.collection('orders').doc(order.id).set(order.toFirestore());
      return true;
    } catch (e) {
      print('Error saving order: $e');
      return false;
    }
  }

  // Get user orders
  Stream<List<Order>> getUserOrders(String userId) {
    return _firestore
        .collection('orders')
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Order.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  // Search restaurants
  Future<List<Restaurant>> searchRestaurants(String query, String city) async {
    try {
      final snapshot = await _firestore
          .collection('restaurants')
          .where('city', isEqualTo: city)
          .get();

      final restaurants = snapshot.docs
          .map((doc) => Restaurant.fromFirestore(doc.data(), doc.id))
          .toList();

      if (query.isEmpty) {
        return restaurants;
      }

      return restaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(query.toLowerCase()) ||
              restaurant.cuisine.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } catch (e) {
      print('Error searching restaurants: $e');
      return [];
    }
  }
}
